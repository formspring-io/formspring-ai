You are connected to Formspring through MCP. Run this setup check without asking me to click anything in the dashboard:

1. Call `list_forms`. If the tool is missing or returns 401/403, stop and tell me which ability is required.
2. Call `get_team` and `get_plan` so I know which workspace and plan you see.
3. Pick the busiest form: for each form from step 1, call `get_form_stats` (or use stats from list if available), then choose the form with the highest submission count in the last 30 days.
4. On that form, call `list_submissions` with a limit of 5 (newest first). Present a markdown table: received time, category (or "uncategorized"), and a one-line summary of the payload.
5. End with one sentence: "MCP setup looks good" or explain exactly what failed.

Rules: use only MCP tool results — do not invent forms or submissions. Contact-style **forms** use `list_forms` / `create_form`; multi-screen **surveys** use `list_surveys` / `create_survey` — never cross those tools.
