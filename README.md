# Formspring agent plugins

Official **Cursor** and **Claude Code** plugins that connect your AI assistant to [Formspring](https://formspring.io) through the hosted MCP server.

Create forms, surveys, funnels, and short links; triage submissions; audit webhooks; and run packaged workflows — without leaving the editor.

## Install

### 1. Sign in (device authorization — recommended)

No manual token copy. From this repo:

```bash
./scripts/device-auth.sh cursor
# or: ./scripts/device-auth.sh claude-code
```

Opens [formspring.io/mcp/device](https://formspring.io/mcp/device) in your browser; after you approve, the script prints `export FORMSPRING_TOKEN=...`.

In Claude Code you can also run **`/formspring:login`** (plugin command).

**Cursor:** add the export to your shell profile, then reload the window.

**Claude Code:** paste into `formspring_token` plugin settings or export `FORMSPRING_TOKEN`.

Docs: [Device authorization](https://formspring.io/docs/mcp/device-authorization)

### 2. Or mint a token manually

- **Wizard:** [formspring.io/mcp/setup](https://formspring.io/mcp/setup) — browser connect, device approval, or copy/paste config; includes **setup prompts** you can paste into any agent.
- **API page:** [formspring.io/api](https://formspring.io/api)

### 3. Claude Code

```text
/plugin marketplace add https://github.com/formspring-io/formspring-ai
/plugin install formspring@formspring
```

Enable the plugin and complete the `formspring_token` prompt (or run `/formspring:login` first). Run `/mcp` to confirm `formspring` is connected.

**Dev:** `claude --plugin-dir /path/to/formspring-ai` then `/reload-plugins`.

**Slash commands:** `/formspring:login`, `/formspring:verify-setup`, `/formspring:inbox-snapshot`, `/formspring:webhook-health`, `/formspring:triage-spam`, `/formspring:integration-brief`, plus create/audit workflows under `/formspring:*`.

### 4. Cursor

- **Marketplace:** search **Formspring** in the Cursor marketplace, or
- **Team marketplace:** Dashboard → Settings → Plugins → Import `https://github.com/formspring-io/formspring-ai`
- **Local dev:** symlink this repo to `~/.cursor/plugins/local/formspring` and reload the window.

Export `FORMSPRING_TOKEN`, then **Settings → MCP** → enable `formspring`.

Skills appear under **Settings → Rules** (Agent Decides). Optional rule: `formspring-product-routing` (Always if you want strict routing).

### 5. Other agents (OpenClaw, Hermes, VS Code, ChatGPT, …)

Use the same MCP URL and device flow. Install snippets and client keys are on [formspring.io/mcp](https://formspring.io/mcp) and under `resources/docs/mcp/` in the Formspring app repo.

### 6. Manual MCP only (no plugin)

Merge [`mcp.json`](mcp.json) into `.cursor/mcp.json` or `~/.claude.json`. Use only `${env:FORMSPRING_TOKEN}` — never commit a real token.

Claude manual install can use [`.mcp.json`](.mcp.json) with `type: http` at project scope.

### 7. Verify

Run **`/formspring:verify-setup`** in Claude Code, or in chat:

> List my forms.

You should see workspace forms via MCP. For a full connection check (team, plan, sample submissions), use the verify setup command or the first prompt on [formspring.io/mcp/setup](https://formspring.io/mcp/setup).

## What's included

| Piece | Purpose |
| --- | --- |
| `mcp.json` / `.mcp.json` | Remote MCP server + auth |
| `skills/` | Product routing + templates + setup flow |
| `commands/` | Slash workflows (login, verify, inbox, webhooks, create, …) |
| `prompts/` | Setup prompt text (synced with app wizard) |
| `agents/` | Triage, webhooks, funnels, form drafting |
| `rules/` | Cursor product-routing rule (`.mdc`) |
| `scripts/device-auth.sh` | Browser sign-in for plugins |

Server capabilities (tools, resources, prompts): [formspring.io/docs/mcp](https://formspring.io/docs/mcp)

## Development

This repository contains **no application code** — only agent packaging. The MCP server runs on Formspring infrastructure.

```bash
./scripts/check-no-secrets.sh
claude plugin validate . --strict   # when Claude Code CLI is installed
```

See [PUBLISHING.md](PUBLISHING.md) for marketplace submission checklists.

## License

MIT — see [LICENSE](LICENSE).
