#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${FORMSPRING_TOKEN:-}" && -z "${CLAUDE_PLUGIN_OPTION_FORMSPRING_TOKEN:-}" ]]; then
  echo "Formspring plugin: set FORMSPRING_TOKEN or configure formspring_token in plugin settings (Claude Code)." >&2
fi

exit 0
