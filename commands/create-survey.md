---
description: Create a Formspring multi-screen survey or quiz (Pro+).
disable-model-invocation: true
---

# Create a Formspring survey

Prerequisites: MCP `formspring` connected; **Pro+** plan; token has `surveys:read` and `surveys:write`.

## Steps

1. Clarify survey type (NPS, CSAT, quiz, application, etc.).
2. `list_templates` with `product: survey` when a starter fits.
3. Sketch screens/fields; confirm with the user.
4. `create_survey` with `name`, optional `template` or `fields`.
5. `publish_survey` when ready to collect responses.
6. Share `public_url` and remind them surveys are **not** forms.

Use the `draft-survey` MCP prompt when available.
