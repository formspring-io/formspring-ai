---
description: 7-day Formspring inbox snapshot for the busiest form (read-only until you confirm writes).
---

# Formspring inbox snapshot

Prerequisites: MCP `formspring` connected; `forms:read`, `submissions:read`.

Using Formspring MCP only, produce an inbox snapshot for my team:

1. `list_forms` — markdown table: name, `public_id`, published (yes/no).
2. Identify the form with the most submissions in the last 7 days (`get_form_stats` per form if needed).
3. On that form, `list_submissions` for the last 7 days (paginate if needed, cap at 50 rows in your summary).
4. Report: total submissions, count by category, count still uncategorized, and the 3 newest non-spam rows with a one-line summary each.
5. List up to 3 concrete follow-ups I should handle today (reply, categorize, mark spam, etc.).

Do not call `update_submission`, `mark_as_spam`, or `delete_submission` unless I explicitly confirm after you show the plan.
