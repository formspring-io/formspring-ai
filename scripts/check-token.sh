#!/usr/bin/env bash
set -euo pipefail

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-${CURSOR_PLUGIN_ROOT:-}}"

if [[ -z "${FORMSPRING_TOKEN:-}" && -z "${CLAUDE_PLUGIN_OPTION_FORMSPRING_TOKEN:-}" ]]; then
  echo "Formspring: no API token detected." >&2
  echo "  • Claude Code: run /formspring:login or set formspring_token in plugin settings." >&2
  echo "  • Cursor: run ${PLUGIN_ROOT:+$PLUGIN_ROOT/}scripts/device-auth.sh cursor and export FORMSPRING_TOKEN." >&2
  echo "  • Or connect at https://formspring.io/mcp/setup" >&2
fi

exit 0
