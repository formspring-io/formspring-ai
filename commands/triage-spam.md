---
description: Triage Formspring spam submissions and propose custom_rules fixes (confirm before writes).
---

# Triage Formspring spam

Prerequisites: MCP `formspring` connected; `forms:read`, `submissions:read`, `submissions:write`.

Triage spam on my busiest contact form using Formspring MCP:

1. `list_forms` → pick the form with the highest recent volume (`get_form_stats`).
2. `list_submissions` with `folder: "spam"` on that form.
3. Walk through up to 15 spam rows. For each: show id, received time, sender hint from payload, and your verdict: true spam / false positive / unsure.
4. Cluster false positives by pattern (domain, keyword, field value).
5. Propose `custom_rules` patches for the form (`get_form` first to read current rules). Show a before/after diff in text only.
6. Ask me which rows to `mark_as_spam` or restore, and whether to apply rule changes — do not write until I confirm.

Never use survey or funnel tools for this task; this is a **form** inbox.

Prefer the server `triage-spam` MCP prompt when the client exposes it.
