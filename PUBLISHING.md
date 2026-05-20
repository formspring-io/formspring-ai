# Publishing checklist

Use this after the repository is pushed to `https://github.com/formspring-io/formspring-ai.git`.

```bash
git remote add origin https://github.com/formspring-io/formspring-ai.git
git push -u origin main
```

## Pre-flight

- [ ] Run `./scripts/check-no-secrets.sh`
- [ ] Tag release `v1.0.0`
- [ ] Confirm `mcp.json` uses only `${env:FORMSPRING_TOKEN}`

## Cursor marketplace

1. Open Cursor → Settings → Plugins → submit or link the GitHub repository.
2. Ensure `.cursor-plugin/plugin.json` validates (name, version, skills, commands, logo path).
3. Smoke test after install:
   - `FORMSPRING_TOKEN` exported
   - Settings → MCP → `formspring` enabled
   - Chat: *List my forms.*

## Claude Code plugin directory

1. Follow Anthropic’s current plugin submission process for `.claude-plugin/plugin.json`.
2. Confirm `mcpServers.formspring` appears in `/mcp` after plugin install.
3. Smoke: *List my forms.*

## Formspring product links

Update after publication:

- [formspring.io/mcp](https://formspring.io/mcp) — marketplace install buttons
- Docs: `install-cursor.md`, `install-claude-code.md` — plugin-first install path
- Dashboard `/mcp/setup` success card — link to this repo

## Verification prompts

| Prompt | Expect |
| --- | --- |
| List my forms. | Non-empty or empty list JSON |
| list_templates product form | ≥15 template keys |
| Create contact form from template contact | `create_form` + publish optional |
