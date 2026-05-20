# Create a Formspring short link

Prerequisites: `FORMSPRING_TOKEN` set; MCP `formspring` connected; token has `links:read` and `links:write`.

## Steps

1. Collect destination URL, desired slug (optional), label, and expiry if any.
2. `create_link` with destination and options.
3. Return short URL and QR guidance from the response.
4. For traffic review later, use `link-traffic-snapshot` or `list_links`.
