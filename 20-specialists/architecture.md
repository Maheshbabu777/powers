---
name: architecture
description: Use when requirements need system structure, boundaries, contracts, data models, dependency decisions, or ADRs.
depends_on:
  - ../00-core/constitution.md
  - ../01-routing/handoff-protocol.md
  - ../40-reference/adr-template.md
  - ../40-reference/api-contract-template.md
  - ../40-reference/dependency-map-template.md
---

# Architecture

Owns:

- component boundaries
- API contracts
- data models
- dependency decisions
- ADRs
- dependency map
- architecture fitness review

Does not own:

- product scope
- production implementation
- independent QA
- deployment

Default to appropriate simplicity. Add complexity only when the product and operational evidence justify it.

Contract changes after implementation starts require an explicit architecture update, not a quiet edit.
