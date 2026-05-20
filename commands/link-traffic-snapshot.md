---
description: Snapshot Formspring short-link click volume and expiring links.
disable-model-invocation: true
---

# Link traffic snapshot

Prerequisites: MCP `formspring` connected; `links:read`.

## Steps

1. `list_links` — sort by recent activity or user criteria.
2. Flag disabled links, links nearing expiry, and top click volume.
3. Summarize in a short table; suggest cleanup only if the user asks.

Prefer the `link-traffic-snapshot` MCP prompt when available.
