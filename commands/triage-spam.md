---
description: Triage Formspring spam submissions and propose custom_rules fixes.
disable-model-invocation: true
---

# Triage Formspring spam

Prerequisites: MCP `formspring` connected; `submissions:read` and `submissions:write`.

## Steps

1. Identify the form (`list_forms` or user-provided name/`public_id`).
2. `list_submissions` with `folder: spam` (adjust `limit` as needed).
3. For each row, recommend: keep in spam, `mark_as_spam` on inbox items, or delete via `bulk_submissions`.
4. **Get explicit user confirmation** before `bulk_submissions` delete or mass status changes.
5. Propose `custom_rules` patches (blocked emails, keywords) for `update_form` — show diff first.

Prefer the `triage-spam` MCP prompt when the client exposes it.
