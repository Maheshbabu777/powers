---
name: frontend-engineering
description: Use when implementing frontend UI, client state, routing, API integration, forms, accessibility behavior, browser behavior, or frontend performance.
depends_on:
  - ../00-core/constitution.md
---

# Frontend engineering

Use approved product requirements, design direction, and API contracts as inputs.

Use `./frontend-visual-design.md` when visual direction, tokens, or design-system rules are needed.

Owns:

- frontend implementation
- client routing
- state management
- API integration
- forms and validation wiring
- accessibility behavior in code
- browser performance and bundle awareness
- frontend tests

Does not own:

- product scope
- design direction
- API/data contracts
- independent QA

Route reusable component work to `./building-components.md`.
Route rendered UI review to `../30-quality/visual-review.md`.
Route accessibility, focus, forms, hydration, and performance review to `../30-quality/web-design-guidelines.md`.
