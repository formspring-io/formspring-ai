---
description: Sign in to Formspring via browser (device authorization) and print FORMSPRING_TOKEN export
disable-model-invocation: true
---

# Formspring login (device authorization)

Run the device authorization script for the current plugin client:

```bash
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-${CURSOR_PLUGIN_ROOT:-}}"
"${PLUGIN_ROOT}/scripts/device-auth.sh" "${FORMSPRING_DEVICE_CLIENT:-cursor}"
```

**Client keys:** `cursor`, `claude-code`, `claude-desktop`, `vscode`, `openclaw`, `hermes`, `chatgpt`, `codex` (must match [MCP client config](https://formspring.io/mcp)).

After you approve in the browser:

1. Paste the printed `export FORMSPRING_TOKEN=...` into your shell profile **or** Claude Code `formspring_token` plugin setting.
2. Reload the IDE and confirm **Settings → MCP** shows `formspring` connected.
3. Run **`/formspring:verify-setup`** (or paste the verify prompt from [formspring.io/mcp/setup](https://formspring.io/mcp/setup)).

Docs: [Device authorization](https://formspring.io/docs/mcp/device-authorization)
