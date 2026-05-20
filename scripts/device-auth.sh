#!/usr/bin/env bash
# RFC 8628 device authorization for Formspring MCP plugins.
# Usage: ./scripts/device-auth.sh [client_key]
#   client_key defaults to FORMSPRING_DEVICE_CLIENT or "cursor"
set -euo pipefail

API_BASE="${FORMSPRING_API_URL:-https://formspring.io}"
CLIENT="${1:-${FORMSPRING_DEVICE_CLIENT:-cursor}}"

if ! command -v jq >/dev/null 2>&1; then
  echo "This script requires jq (brew install jq)." >&2
  exit 1
fi

echo "Starting Formspring device authorization for client: ${CLIENT}" >&2

SESSION=$(curl -fsS -X POST "${API_BASE}/mcp/device/session" \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d "{\"client\":\"${CLIENT}\"}")

DEVICE_CODE=$(echo "$SESSION" | jq -r '.device_code')
USER_CODE=$(echo "$SESSION" | jq -r '.user_code')
VERIFY_URI=$(echo "$SESSION" | jq -r '.verification_uri_complete // .verification_uri')
INTERVAL=$(echo "$SESSION" | jq -r '.interval // 5')

echo "" >&2
echo "  1. Open: ${VERIFY_URI}" >&2
echo "  2. Sign in and approve (code: ${USER_CODE})" >&2
echo "" >&2

if command -v open >/dev/null 2>&1; then
  open "${VERIFY_URI}" >/dev/null 2>&1 || true
elif command -v xdg-open >/dev/null 2>&1; then
  xdg-open "${VERIFY_URI}" >/dev/null 2>&1 || true
fi

ATTEMPTS=120
for ((i = 0; i < ATTEMPTS; i++)); do
  sleep "${INTERVAL}"
  RESULT=$(curl -fsS -X POST "${API_BASE}/mcp/device/token" \
    -H 'Accept: application/json' \
    -H 'Content-Type: application/json' \
    -d "{\"device_code\":\"${DEVICE_CODE}\"}" || echo '{"status":"error"}')

  STATUS=$(echo "$RESULT" | jq -r '.status')

  if [[ "$STATUS" == "success" ]]; then
    TOKEN=$(echo "$RESULT" | jq -r '.access_token')
    echo "export FORMSPRING_TOKEN='${TOKEN}'"
    echo "" >&2
    echo "Next steps:" >&2
    echo "  1. Add the export above to your shell profile or Claude Code formspring_token." >&2
    echo "  2. Reload your IDE; enable MCP server formspring." >&2
    echo "  3. Run /formspring:verify-setup (Claude Code) or paste the verify prompt from:" >&2
    echo "     ${API_BASE}/mcp/setup" >&2
    exit 0
  fi

  if [[ "$STATUS" == "access_denied" || "$STATUS" == "expired_token" ]]; then
    echo "Authorization failed: ${STATUS}" >&2
    exit 1
  fi

  if [[ "$STATUS" == "error" ]]; then
    echo "Token poll request failed." >&2
    exit 1
  fi

  INTERVAL=$(echo "$RESULT" | jq -r '.interval // '"${INTERVAL}")
  echo "Waiting for approval… (${USER_CODE})" >&2
done

echo "Timed out waiting for approval." >&2
exit 1
