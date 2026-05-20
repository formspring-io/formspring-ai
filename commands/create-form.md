# Create a Formspring form

Prerequisites: `FORMSPRING_TOKEN` set; MCP `formspring` connected; token has `forms:read` and `forms:write`.

## Steps

1. Clarify purpose, audience, and whether they want a **template** or custom fields.
2. If template: `list_templates` with `product: form` (optional `search` / `category`).
3. Propose field list, `name`, and `slug`. **Wait for user approval** before mutating.
4. `create_form` with `name`, optional `slug`, `notification_emails`, `fields` or `template`.
5. If draft with fields, `publish_form` when the user wants it live.
6. Return `public_id`, hosted URL, and embed/docs link from the response.

Use the `draft-form` MCP prompt when the client supports it.
