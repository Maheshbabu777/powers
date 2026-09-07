---
name: quality-engineering
description: Use for independent functional, contract, integration, edge-case, failure, and regression verification.
depends_on:
  - ../00-core/constitution.md
  - ../00-core/evidence-and-findings.md
  - ./evidence-capture.md
  - ../40-reference/finding-template.md
  - ../40-reference/test-plan-template.md
  - ../40-reference/test-results-template.md
---

# Quality engineering

Mission: prove the software works under expected and unexpected conditions.

Check:

- acceptance criteria
- contract behavior
- edge cases
- failure scenarios
- integration
- end-to-end flows
- regression
- performance when warranted

QE can create or modify tests and fixtures. QE does not fix production implementation code.

Gate 4 is the first independent acceptance gate.
