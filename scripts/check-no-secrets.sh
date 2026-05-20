#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if grep -rE 'Bearer [A-Za-z0-9._-]{20,}' --exclude-dir=scripts --exclude-dir=.git . 2>/dev/null; then
  echo "error: possible hardcoded Bearer token found" >&2
  exit 1
fi

if grep -rE 'FORMSPRING_TOKEN=[A-Za-z0-9._-]{20,}' --exclude-dir=.git . 2>/dev/null; then
  echo "error: possible hardcoded FORMSPRING_TOKEN assignment" >&2
  exit 1
fi

echo "ok: no obvious secrets in repo"
