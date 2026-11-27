# Publishing checklist

Repository: `https://github.com/formspring-io/formspring-ai.git`

## Pre-flight

- [ ] `./scripts/check-no-secrets.sh`
- [ ] `./scripts/check-setup-prompts-sync.sh` (with `pixel-forms` checked out beside this repo; uses `php artisan mcp:export-setup-prompts --check`)
- [ ] `claude plugin validate . --strict` (Claude Code CLI installed)
- [ ] Confirm `mcp.json` uses only `${env:FORMSPRING_TOKEN}`
- [ ] Confirm `.mcp.json` uses only `${user_config.formspring_token}`
- [ ] Tag release `v1.2.2` and push `main`

## Claude Code

1. `/plugin marketplace add https://github.com/formspring-io/formspring-ai`
2. `/plugin install formspring@formspring`
3. Smoke:
   - `/formspring:login` (device auth) or set `formspring_token`
   - `/mcp` → `formspring` connected
   - `/formspring:verify-setup`
   - `/formspring:create-form` or *List my forms.*
   - `list_templates` with `product: form`
4. Submit: [claude.ai/settings/plugins/submit](https://claude.ai/settings/plugins/submit)

## Cursor marketplace

1. [cursor.com/marketplace/publish](https://cursor.com/marketplace/publish) — link this GitHub repo (open source, manual review).
2. Local test:

   ```bash
   ln -sf "$(pwd)" ~/.cursor/plugins/local/formspring
   ```

   Reload Cursor; **Settings → MCP** → `formspring` on.

3. Smoke: device-auth or env token, *List my forms.*, `/formspring:verify-setup` (via chat paste if no slash commands), `list_templates` with `product: form`.

## Team marketplaces

Import `https://github.com/formspring-io/formspring-ai` in **Dashboard → Settings → Plugins → Team Marketplaces** (Teams / Enterprise).

## Formspring product links

After publication, ensure these reference the plugin repo:

- [formspring.io/mcp](https://formspring.io/mcp)
- Docs: `/docs/mcp/install-cursor`, `/docs/mcp/install-claude-code`
- Dashboard `/mcp/setup` success card

## Verification prompts

| Prompt / command | Expect |
| --- | --- |
| `/formspring:verify-setup` | Team, plan, busiest form, 5 submission rows |
| List my forms. | Non-empty or empty list JSON |
| list_templates product form | Template keys returned |
| Create contact form from template contact | `create_form` succeeds |
| `/formspring:webhook-health` | Delivery summary (Pro+) |
