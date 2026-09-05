---
name: swe-core-constitution
description: Always load for meaningful engineering work. Defines non-negotiable rules, risk, evidence, and escalation.
---

# Core constitution

## Non-negotiable rules

1. Builders never certify their own work.
2. Contracts, not conversations.
3. Simplicity is a requirement.
4. Process depth scales with risk, not habit.
5. Never invent a requirement.
6. Never claim verification without evidence.
7. Never silently skip, delete, or weaken a failing test.
8. Security and accessibility are never optional where relevant.
9. Observability ships with the feature.
10. Prefer small, reversible changes.
11. Never work directly on `main`.
12. Stop when repeated fixes fail or context becomes unreliable.

## Risk levels

| Level | Meaning | Default routing |
|---|---|---|
| L0 | Docs or non-behavioral | applicable checks only |
| L1 | Low-risk isolated change | Builder plus Reviewer |
| L2 | Normal feature/change | Requirements, Architecture as needed, Builder, Reviewer |
| L3 | Sensitive or cross-boundary | Product, Architecture, Builder, QE, Security |
| L4 | Critical, destructive, infra-heavy | full relevant review, Operator, human approval |

Engineering owns initial risk classification. Any role may raise risk. Nobody may quietly downgrade it to skip review.

## Gate meanings

| Gate | Owner | Meaning |
|---|---|---|
| Gate 1 | Product + UX | requirement ready |
| Gate 2 | Architecture | architecture and contracts ready |
| Gate 3 | Engineering | implementation complete, not independently verified |
| Gate 4 | Quality Engineering | first independent acceptance |
| Gate 5 | Security | serious vulnerabilities cleared |
| Gate 6 | Platform + SRE | deployable, observable, recoverable |
| Gate 7 | Security Red Team | continuous adversarial production review |

Gate 7 is not a mandatory seventh pre-release checkpoint. Red Team can still flag a blocking issue before release when risk warrants it.

## Minimal task record

Use `../40-reference/task-record-template.md` for meaningful changes.

At minimum, know:

- Task ID
- title
- type
- risk level
- branch/workspace
- current gate
- affected contracts/components
- verification evidence
- findings

Use `./evidence-and-findings.md`, `./source-of-truth.md`, and `./recovery-and-loop-control.md` when the task needs those details.
