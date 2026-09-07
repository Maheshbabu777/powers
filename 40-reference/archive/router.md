---
name: swe-router
description: Use at the start of a task and whenever deciding the next skill, workflow, reviewer, or handoff.
depends_on:
  - ../00-core/constitution.md
  - ./dependency-graph.md
  - ./handoff-protocol.md
  - ./context-loading-policy.md
---

# Router

## First questions

1. What kind of work is this?
2. Is it ambiguous?
3. What is the risk level?
4. What artifacts already exist?
5. What source files or contracts are authoritative?
6. Which workflow is current?
7. Which specialist is needed now?
8. What evidence is required before handoff?
9. What would force a stop or escalation?

## Route by task type

| Task type | Start with | Then |
|---|---|---|
| vague product request | `../10-workflows/intake.md` | requirements, architecture, implementation |
| new feature | `../10-workflows/isolation.md` | codebase search, planning, implementation |
| bug/debugging | `../10-workflows/debugging.md` | implementation only after root cause is credible |
| UI/design work | `../20-specialists/frontend-visual-design.md` | web design guidelines, visual review, before/after evidence when useful, QE |
| UI component work | `../20-specialists/building-components.md` | web design guidelines, visual review, QE |
| frontend implementation | `../20-specialists/frontend-engineering.md` | implementation, developer verification, code review |
| backend implementation | `../20-specialists/backend-engineering.md` | implementation, developer verification, code review |
| AI/ML implementation | `../20-specialists/ai-ml-engineering.md` | eval evidence, security review when relevant |
| architecture or contract change | `../20-specialists/architecture.md` | ADR, implementation |
| security issue | `../30-quality/security-review.md` | finding, fix, re-review |
| deployment/ops | `../20-specialists/platform-sre.md` | release, production feedback |
| PR/review cleanup | `../10-workflows/review-loop.md` | bounded iteration |
| maintenance/docs/refactor | `../10-workflows/maintenance.md` | applicable checks, review by risk |

Use `../30-quality/before-after-visual-evidence.md` when a UI change needs visual proof for review or PR context.
Use `../20-specialists/engineering-writing.md` when producing PR text, findings, handoffs, release notes, or human-facing docs.

## Collapse roles by default

Use three practical hats unless risk requires more separation:

- Builder
- Reviewer
- Operator

Builder and Reviewer must remain separate for behavior-changing work.
