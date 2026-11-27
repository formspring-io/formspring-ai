#!/usr/bin/env bash
# Fails if any https://formspring.io URL in tracked files resolves (after redirects) to >= 400.
# /mcp-server is the MCP endpoint (GET returns 405 by design) and is skipped.
set -euo pipefail

cd "$(dirname "$0")/.."

urls=$(git grep -hoE 'https://formspring\.io[A-Za-z0-9/._~%?=&#-]*' -- . ':!scripts/check-links.sh' \
  | sed -E 's/[.,#]+$//' | sort -u | grep -vE '^https://formspring\.io/mcp-server(/|$)' || true)

if [ -z "$urls" ]; then
  echo "error: no formspring.io URLs found" >&2
  exit 1
fi

# Fail-soft only when the host itself is unreachable (e.g. runner network), never on 4xx/5xx.
if ! curl -sS -o /dev/null --max-time 20 https://formspring.io; then
  echo "warning: formspring.io unreachable; skipping link check" >&2
  exit "${LINKS_UNREACHABLE_EXIT:-0}"
fi

fail=0
while IFS= read -r url; do
  code=$(curl -sSL -o /dev/null -w '%{http_code}' --max-time 20 --retry 2 "$url" || echo 000)
  if [ "$code" -ge 400 ] || [ "$code" = 000 ]; then
    echo "FAIL $code $url" >&2
    fail=1
  else
    echo "ok   $code $url"
  fi
done <<< "$urls"

exit "$fail"
