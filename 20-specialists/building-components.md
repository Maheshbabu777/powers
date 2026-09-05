---
name: building-components
description: Use when building or refactoring UI components, component APIs, accessibility behavior, controlled/uncontrolled state, slots/as-child/polymorphism, design tokens, theming, data attributes, or component docs.
depends_on:
  - ./frontend-visual-design.md
---

# Building components

Adapted from Vercel's `building-components` skill and placed as a specialist implementation skill.

Use when building:

- primitives
- reusable components
- composed UI blocks
- component APIs
- accessible interactions
- tokenized/themed components
- component docs

## Quality bar

Components should be:

- accessible by default
- composable without boolean-prop sprawl
- explicit about controlled vs uncontrolled state
- typed clearly
- themeable through design tokens
- styled through stable state or data attributes
- documented enough for reuse

## Design-system contract

Before creating a new component, check whether an existing component or pattern already covers the need.

If a new component is justified:

1. Define its purpose and non-purpose.
2. Define states: default, hover, focus, active, disabled, loading, error, selected where relevant.
3. Define keyboard and screen-reader behavior.
4. Define token usage, not raw visual values.
5. Define responsive behavior.
6. Add or update component docs when the pattern is reusable.

## Handoff

After implementation, route to:

- `../30-quality/web-design-guidelines.md` for accessibility, performance, and UX-code review
- `../30-quality/visual-review.md` for rendered visual/design-system review
- `../30-quality/before-after-visual-evidence.md` when screenshot comparison helps
