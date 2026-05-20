---
description: Audit Formspring webhook delivery health across forms (read-only until you confirm replays).
---

# Formspring webhook health

Prerequisites: MCP `formspring` connected; `webhooks:read` (Pro+). Prefer `/formspring:audit-webhooks` for a shorter checklist.

Audit Formspring webhook health using MCP tools only:

1. `list_forms` — for each form, `list_webhooks` (skip forms with zero webhooks).
2. For every webhook, `list_webhook_deliveries` with limit 100. Compute success rate and note the dominant failure status codes or error messages.
3. Sort results worst-first. Flag any webhook below 90% success in the sample.
4. For the single worst webhook, explain likely root cause in plain language and suggest one fix (URL, auth, payload, or retry). Do not call `replay_webhook_delivery` or `update_webhook` until I confirm.

If webhooks are not on my plan or tools are omitted, say so clearly and stop.
