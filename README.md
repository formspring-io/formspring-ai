# Formspring agent plugins

Official **Cursor** and **Claude Code** plugins that connect your AI assistant to [Formspring](https://formspring.io) through the hosted MCP server.

Create forms, surveys, funnels, and short links; triage submissions; audit webhooks; and run packaged workflows — without leaving the editor.

## Install

### 1. API token

Mint a token with the abilities you need:

- **Wizard (recommended):** [formspring.io/mcp/setup](https://formspring.io/mcp/setup) — pick Cursor or Claude Code; copy the token once.
- **Manual:** [formspring.io/api](https://formspring.io/api)

Export it:

```bash
# Paste the token value from the dashboard (shown once)
export FORMSPRING_TOKEN='…'
```

Add that line to your shell profile (`~/.zshrc`, `~/.bashrc`) for persistence.

### 2. Plugin

Clone the plugin repo (canonical remote):

```bash
git clone https://github.com/formspring-io/formspring-ai.git
```

**Cursor:** Install from the Cursor plugin marketplace (search **Formspring**), or add the cloned repo as a local plugin.

**Claude Code:** Install the plugin from the Claude plugin directory, or:

```bash
claude plugin install formspring
```

(Use the marketplace entry once published; until then, point Claude at this repository per [Claude Code plugin docs](https://docs.anthropic.com/en/docs/claude-code/plugins).)

### 3. MCP config (fallback)

If you are not using the plugin bundle, merge [`mcp.json`](mcp.json) into `.cursor/mcp.json` or `~/.claude.json`. Never commit a real token — only `${env:FORMSPRING_TOKEN}`.

### 4. Verify

In your agent chat:

> List my forms.

You should see workspace forms returned via MCP.

## What's included

| Piece | Purpose |
| --- | --- |
| `mcp.json` | Remote MCP server + env-based auth |
| `skills/formspring/` | Product routing, templates, plan gates |
| `commands/` | Slash workflows: create-form, triage-spam, … |

Server capabilities (74 tools, resources, prompts): [formspring.io/docs/mcp](https://formspring.io/docs/mcp)

## Development

This repository contains **no application code** — only agent packaging. The MCP server runs on Formspring infrastructure.

```bash
# Ensure no secrets are committed
./scripts/check-no-secrets.sh
```

## License

MIT — see [LICENSE](LICENSE).
