---
name: frontend-visual-design
description: Use for design direction, design systems, UI visual quality, responsive behavior, tokens, component visual specs, and anti-AI-slop review.
depends_on:
  - ../00-core/constitution.md
  - ./product-requirements.md
  - ../40-reference/design-system-template.md
---

# Frontend visual design

Design direction is a rationale, not a label. "Modern" is not enough.

Decide:

- who the user is
- what the domain expects
- content density
- device context
- accessibility constraints
- brand/product character

Owns:

- design direction
- typography, spacing, color, shape, elevation, layout, motion, iconography tokens
- component visual specs
- visual hierarchy
- loading, empty, error, success state design
- anti-slop review

When work becomes reusable component construction, route to `./building-components.md`.
When work needs UI-code quality review, route to `../30-quality/web-design-guidelines.md`.
When implemented UI needs review, route to `../30-quality/visual-review.md`.

Does not own:

- product scope
- API/data architecture
- production frontend implementation
- independent functional QA
- security sign-off
