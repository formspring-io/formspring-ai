#!/usr/bin/env bash
# Verify formspring-ai prompts/ match app/Mcp/SetupPrompts.php in pixel-forms.
set -euo pipefail

PLUGIN_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIXEL_FORMS_PATH="${PIXEL_FORMS_PATH:-${PLUGIN_ROOT}/../pixel-forms}"
PROMPTS_PATH="${PLUGIN_ROOT}/prompts"

if [[ ! -d "${PIXEL_FORMS_PATH}" ]]; then
  echo "Set PIXEL_FORMS_PATH to the Formspring app repo (pixel-forms)." >&2
  exit 1
fi

if [[ ! -f "${PIXEL_FORMS_PATH}/artisan" ]]; then
  echo "Not a Laravel app: ${PIXEL_FORMS_PATH}" >&2
  exit 1
fi

if [[ ! -d "${PROMPTS_PATH}" ]]; then
  echo "Missing plugin prompts directory: ${PROMPTS_PATH}" >&2
  exit 1
fi

echo "Checking setup prompt sync (${PIXEL_FORMS_PATH} → ${PROMPTS_PATH})..." >&2
cd "${PIXEL_FORMS_PATH}"
php artisan mcp:export-setup-prompts --path="${PROMPTS_PATH}" --check
