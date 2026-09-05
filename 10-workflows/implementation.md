---
name: implementation
description: Use when building code against approved requirements, contracts, and architecture.
depends_on:
  - ../00-core/constitution.md
  - ./isolation.md
  - ./codebase-search.md
  - ./planning.md
  - ../30-quality/developer-verification.md
  - ../40-reference/change-impact-analysis-template.md
  - ../40-reference/implementation-notes-template.md
---

# Implementation

Before coding:

- confirm the task record
- confirm workspace isolation
- run codebase search
- identify contracts and affected components
- run change impact analysis for non-trivial changes
- use `../20-specialists/building-components.md` when the change creates or refactors reusable UI components
- use `../20-specialists/frontend-engineering.md`, `../20-specialists/backend-engineering.md`, or `../20-specialists/ai-ml-engineering.md` when the implementation needs stack-specific guidance
- use `../20-specialists/observability-instrumentation.md` when the feature needs logs, metrics, health checks, or redaction decisions

Build vertically:

```text
data -> service/domain -> route/controller -> UI/client -> tests
```

Keep implementation inside approved contracts. If the contract is infeasible, stop and return to Architecture.

Gate 3 means implementation complete with developer evidence. It does not mean independently verified.
