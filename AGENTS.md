# Formspring agent plugins

Packaging-only repo for Cursor and Claude Code. The hosted MCP server lives at `https://formspring.io/mcp-server`.

## Layout

- `.claude-plugin/` — Claude manifest + marketplace catalog
- `.cursor-plugin/` — Cursor manifest + marketplace catalog
- `skills/`, `commands/`, `agents/`, `hooks/`, `rules/` — shared components at repo root
- `prompts/` — setup wizard prompts (keep in sync with app `App\Mcp\SetupPrompts`)
- `scripts/device-auth.sh` — RFC 8628 device flow (`POST /mcp/device/session`, `/mcp/device/token`)
- `mcp.json` — Cursor / env auth
- `.mcp.json` — Claude / HTTP + `user_config.formspring_token`

## Auth flow

1. User runs `/formspring:login` or `device-auth.sh <client_key>`.
2. Browser approves at `/mcp/device`; poll returns Sanctum PAT as `FORMSPRING_TOKEN`.
3. User runs `/formspring:verify-setup` to exercise MCP tools.

Client keys must match `config/mcp_clients.php` in the Formspring app (`cursor`, `claude-code`, `openclaw`, `hermes`, …).

## Checks before push

```bash
./scripts/check-no-secrets.sh
./scripts/check-setup-prompts-sync.sh   # requires sibling pixel-forms checkout
claude plugin validate . --strict
```

Never commit API tokens. Use `${env:FORMSPRING_TOKEN}` or `${user_config.formspring_token}` only.

**Setup prompt sync:** Canonical text is `app/Mcp/SetupPrompts.php` in pixel-forms. After editing PHP, run:

```bash
cd ../pixel-forms && php artisan mcp:export-setup-prompts
```

That rewrites `prompts/*.md` here. Commit both repos when prompts change.
