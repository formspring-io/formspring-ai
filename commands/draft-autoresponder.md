---
description: Draft and test a Formspring form autoresponder before saving.
disable-model-invocation: true
---

# Draft and test a Formspring autoresponder

Prerequisites: MCP `formspring` connected; `forms:read`, `forms:write`, `forms:test-email`.

## Steps

1. `get_form` for the target form; read current autoresponder and allowed placeholders.
2. Draft copy aligned with brand tone; only use placeholders the form supports.
3. `send_test_autoresponder` to the account email — **do not** `update_form` until the user approves the test.
4. After approval, `update_form` with autoresponder settings.

Use the `draft-autoresponder` MCP prompt when available.
