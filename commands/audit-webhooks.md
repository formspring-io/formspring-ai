# Audit Formspring webhooks

Prerequisites: `FORMSPRING_TOKEN` set; MCP `formspring` connected; **Pro+** for webhooks; `webhooks:read`.

## Steps

1. `list_forms` (or target form from user).
2. Per form: `list_webhooks`, then `list_webhook_deliveries` for unhealthy endpoints.
3. Bucket failures by HTTP status and recency.
4. Recommend fixes (URL, TLS, timeout, payload). Offer `replay_webhook_delivery` only after user confirms.

Use the `audit-webhooks` MCP prompt when available.
