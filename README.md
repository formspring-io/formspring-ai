# Formspring agent plugins

Official **Cursor** and **Claude Code** plugins that connect your AI assistant to [Formspring](https://formspring.io) through the hosted MCP server.

Create forms, surveys, funnels, and short links; triage submissions; audit webhooks; and run packaged workflows — without leaving the editor.

## Install

### 1. API token

Mint a token with the abilities you need:

- **Wizard (recommended):** [formspring.io/mcp/setup](https://formspring.io/mcp/setup) — pick Cursor or Claude Code; copy the token once.
- **Manual:** [formspring.io/api](https://formspring.io/api)

**Cursor:** export `FORMSPRING_TOKEN` in your shell (add to `~/.zshrc` or `~/.bashrc`).

**Claude Code:** enter the token when enabling the plugin (`formspring_token`), or export `FORMSPRING_TOKEN`.

### 2. Claude Code

```text
/plugin marketplace add https://github.com/formspring-io/formspring-ai
/plugin install formspring@formspring
```

Enable the plugin and complete the `formspring_token` prompt. Run `/mcp` to confirm `formspring` is connected.

**Dev:** `claude --plugin-dir /path/to/formspring-ai` then `/reload-plugins`.

**Slash commands (namespaced):** `/formspring:create-form`, `/formspring:triage-spam`, `/formspring:audit-webhooks`, and others under `/formspring:*`.

### 3. Cursor

- **Marketplace:** search **Formspring** in the Cursor marketplace, or
- **Team marketplace:** Dashboard → Settings → Plugins → Import `https://github.com/formspring-io/formspring-ai`
- **Local dev:** symlink this repo to `~/.cursor/plugins/local/formspring` and reload the window.

Export `FORMSPRING_TOKEN`, then **Settings → MCP** → enable `formspring`.

Skills appear under **Settings → Rules** (Agent Decides). Optional rule: `formspring-product-routing` (Always if you want strict routing).

### 4. Manual MCP only (no plugin)

Merge [`mcp.json`](mcp.json) into `.cursor/mcp.json` or `~/.claude.json`. Use only `${env:FORMSPRING_TOKEN}` — never commit a real token.

Claude manual install can use [`.mcp.json`](.mcp.json) with `type: http` at project scope.

### 5. Verify

In chat:

> List my forms.

You should see workspace forms via MCP.

## What's included

| Piece | Purpose |
| --- | --- |
| `mcp.json` / `.mcp.json` | Remote MCP server + auth |
| `skills/` | Product routing + templates |
| `commands/` | Slash workflows (10 commands) |
| `agents/` | Triage, webhooks, funnels, form drafting |
| `rules/` | Cursor product-routing rule (`.mdc`) |

Server capabilities (74 tools, resources, prompts): [formspring.io/docs/mcp](https://formspring.io/docs/mcp)

## Development

This repository contains **no application code** — only agent packaging. The MCP server runs on Formspring infrastructure.

```bash
./scripts/check-no-secrets.sh
claude plugin validate . --strict   # when Claude Code CLI is installed
```

See [PUBLISHING.md](PUBLISHING.md) for marketplace submission checklists.

## License

MIT — see [LICENSE](LICENSE).
