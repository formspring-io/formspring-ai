---
name: formspring
description: Use when working with Formspring (formspring.io) — creating forms, surveys, funnels, short links, automations, triaging submissions, webhooks, or AI insights via MCP. Triggers on Formspring, MCP formspring server, create form/survey/funnel from chat, list submissions, publish form.
---

# Formspring agent skill

## Prerequisites

1. MCP server `formspring` is connected (this plugin wires `https://formspring.io/mcp-server`).
2. API token is configured: `FORMSPRING_TOKEN` in the environment (Cursor), plugin `formspring_token` (Claude Code), or the [MCP setup wizard](https://formspring.io/mcp/setup).

Verify: ask the user to run a session and call `list_forms`, or use `/mcp` in Claude Code.

## Product routing (never mix tools)

| User wants | Tool | Not |
| --- | --- | --- |
| Contact / lead form (one screen) | `create_form` | `create_survey` |
| Multi-screen survey, quiz, NPS | `create_survey` | `create_form` |
| Multi-step funnel, quiz funnel, lead gen | `create_funnel` | `create_form` |
| Short link / QR | `create_link` | — |

## Create from a starter template

1. `list_templates` with `product`: `form`, `survey`, or `funnel`.
2. Pick a `key` (or recommend one to the user).
3. `create_form` / `create_survey` / `create_funnel` with `template` set to that key.
4. `publish_form` / `publish_survey` / `publish_funnel` when the user wants it live.

Funnel templates hydrate screens and blocks; forms and surveys hydrate fields and theme.

## Token abilities (starter set)

Read + triage on any plan:

`forms:read`, `submissions:read`, `submissions:write`, `links:read`, `automations:read`

Add when the user needs writes or Pro+ products:

- `forms:write`, `webhooks:read` / `webhooks:write` (Pro+)
- `surveys:read`, `surveys:write` (Pro+)
- `funnels:read`, `funnels:write`, `funnels:publish` (Pro+)
- `insights:read` (Pro+)

Avoid `tokens:write` unless the user explicitly needs to mint tokens via MCP.

## Plan visibility

On **Free**, `tools/list` omits survey, funnel, webhook, and AI tools. `list_templates` for `survey` or `funnel` returns a plan error. Explain upgrade; do not guess paid tools exist.

## After create

Return URLs and next steps from tool JSON (`public_url`, `edit_url`, `next_step`). For funnels, mention `add_screen` / `add_block` only if the user wants to customize beyond the template.

## Packaged MCP prompts

Prefer server prompts when the client exposes them: `draft-form`, `draft-survey`, `triage-spam`, `audit-webhooks`, `funnel-conversion-review`, `link-traffic-snapshot`, `automation-failure-audit`.

## Reference

Full tool catalogue: https://formspring.io/docs/mcp/tools
