---
description: Framework integration catalog brief and go-live checklist (planning only).
---

# Formspring integration brief

Prerequisites: MCP `formspring` connected; `forms:read`, `billing:read`.

I'm wiring Formspring into a site. Using MCP only:

1. Call `get_framework_integration_catalog` with `per_page` 25 and summarize how many stacks are listed.
2. Ask me which framework I use (or infer from my message). Fetch that row plus two related rows from the catalog.
3. For each row, quote the short `snippet` pattern (with `FORMSPRING_ENDPOINT` placeholder) and the `docs_url`.
4. Call `get_usage` and `get_subscription_state` so I know plan limits that matter for submissions and integrations.
5. Give me a 5-step checklist to go live (token, form endpoint, CORS/origins if browser POST, test submission, webhook optional).

Do not create forms yet unless I ask — this pass is planning only.
