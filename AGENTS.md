# Formspring agent plugins

Packaging-only repo for Cursor and Claude Code. The hosted MCP server lives at `https://formspring.io/mcp-server`.

## Layout

- `.claude-plugin/` — Claude manifest + marketplace catalog
- `.cursor-plugin/` — Cursor manifest + marketplace catalog
- `skills/`, `commands/`, `agents/`, `hooks/`, `rules/` — shared components at repo root
- `mcp.json` — Cursor / env auth
- `.mcp.json` — Claude / HTTP + `user_config.formspring_token`

## Checks before push

```bash
./scripts/check-no-secrets.sh
claude plugin validate . --strict
```

Never commit API tokens. Use `${env:FORMSPRING_TOKEN}` or `${user_config.formspring_token}` only.
