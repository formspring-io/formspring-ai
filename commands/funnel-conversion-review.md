---
description: Review Formspring funnel analytics and recommend conversion improvements (Pro+).
disable-model-invocation: true
---

# Funnel conversion review

Prerequisites: MCP `formspring` connected; **Pro+** plan; `funnels:read`, `funnels:analytics`.

## Steps

1. Identify the funnel (`list_funnels` or user-provided slug).
2. `get_funnel_analytics` and `list_funnel_sessions` as needed.
3. Highlight drop-off steps, completion rate, and outliers.
4. Recommend copy, logic, or template changes — mutate only after user approval.

Prefer the `funnel-conversion-review` MCP prompt when available.
