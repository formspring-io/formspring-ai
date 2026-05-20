# Create a Formspring funnel

Prerequisites: `FORMSPRING_TOKEN` set; MCP `formspring` connected; **Pro+** plan; token has `funnels:read` and `funnels:write`.

## Steps

1. Clarify goal (lead gen, quiz, booking, etc.).
2. `list_templates` with `product: funnel` — review `vertical_tags` and `blocks_required`.
3. `create_funnel` with `template` (recommended) or blank `name` for empty funnel.
4. Return `edit_url`, `screens_count`, `blocks_count`, and `next_step` from the tool JSON.
5. `publish_funnel` when the user wants traffic on `/u/{slug}`.
6. Optional: `set_logic`, `set_score`, `set_pixel`, `set_capi_token` for advanced setup.

Use `funnel-conversion-review` after the funnel has traffic.
