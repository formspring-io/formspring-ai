# Formspring weekly digest brief

Prerequisites: `FORMSPRING_TOKEN` set; MCP `formspring` connected; `forms:read`, `submissions:read`, `insights:read` (insights Pro+).

## Steps

1. `list_forms` — identify busiest form(s) via `get_form_stats` (30-day).
2. For key forms: `list_submissions` (recent inbox), optional `get_ai_insights`.
3. Produce markdown: headline metric, spam ratio trend, top themes, one outlier, recommended actions.
4. Do not mutate data unless the user asks.

Use `summarize-week` or `weekly-digest-brief` MCP prompts when available.
