---
name: formspring-templates
description: Formspring template discovery and create-from-template flow via list_templates and create_* tools.
---

# Formspring templates

## When to use

User says: "from a template", "starter", "NPS survey", "contact form template", "funnel gallery", "use the B2B demo funnel".

## Flow

```
list_templates(product=form|survey|funnel)
  → optional category or search
  → user/agent picks key
create_*(template=key, name=...)
  → publish_* when ready
```

## Examples

**Form:** `list_templates` → `product: form`, `search: contact` → `create_form` with `template: contact`.

**Survey:** `list_templates` → `product: survey`, `search: nps` → `create_survey` with `template: nps`.

**Funnel:** `list_templates` → `product: funnel` → `create_funnel` with `template: b2b-saas-demo` (hydrates screens/blocks).

## Errors

- Unknown `template` key → re-run `list_templates` for that product; do not invent keys.
- Plan errors on survey/funnel → team needs Pro+ for those products.
