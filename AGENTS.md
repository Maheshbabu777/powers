Before starting a task, check the skill index below. If a row matches, read that file in full before acting. Every skill lives at the path shown in this index and nowhere else, do not create new top-level folders.

# Core Constitution

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
13. Contract changes after implementation starts require an explicit architecture update, not a quiet edit.
14. Never log passwords, tokens, credentials, private documents, sensitive prompts, private model context, payment data, or unnecessary PII.
15. Destructive migrations are recovery scenarios by default and require human approval plus verified backup.
16. Bug fixes should capture the before failure before changing code when feasible.
17. Untested scope must be named explicitly.
18. Confirmed critical and high findings block by default. Only a human can override a security block, with an override record.
19. Every handoff must state: input artifact consumed, output artifact produced, current risk level, current gate, evidence attached, open questions, known limitations, next owner.

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

## Source of Truth & Context Loading

When artifacts disagree, do not guess and do not silently choose whichever one is easiest.

Authority order:
1. Explicit human-approved product decisions
2. Human-approved architectural decisions
3. Approved API, data, or interface contracts
4. Approved security constraints
5. Current implementation
6. Tests and generated artifacts
7. Agent assumptions

Refresh context from source when:
- Docs and code disagree
- Tests and stated behavior disagree
- Branch is stale
- A previous agent summary lacks evidence
- Search results contradict loaded context
- The task crosses a component boundary
- The next change expands the blast radius

## Evidence and Findings

"Tests passed" is not enough. Every verification claim needs:
- what was checked
- exact commit/build/environment
- command, tool, browser, or probe used
- result
- evidence artifact
- caveats or untested scope

Problems must be concrete. Vague review comments do not block work. Every blocking or meaningful finding needs:
- severity, category, location, problem, why it matters, failure scenario, reproduction steps, evidence, recommended fix, regression risk, verification method.

## Recovery and Loop Control

Stop normal execution when:
- the same failure persists after repeated attempts
- each attempt increases blast radius
- root cause is unclear
- a local fix starts turning into architecture work
- source artifacts disagree
- context appears stale or unsupported
- security, data, or irreversible operational risk is unresolved
- the agent cannot explain why the next edit should work

Required recovery report:
Include Original goal, Current state, Failure or contradiction, Attempts made, Evidence from each attempt, What changed between attempts, Suspected root cause, What is known, What is assumed, What is uncertain, Blast radius now, Recommended next strategy, Human decision needed, if any.

## Workflow Ordering

Typical path: Intake -> Isolation -> Codebase Search -> Planning -> Implementation -> Review -> Developer Verification -> QE -> Release.

---

# Skill Index

> A skill is a single markdown file in its existing folder unless it needs bundled scripts or assets, in which case it becomes `<name>/SKILL.md` with its supporting files alongside it. Do not create a folder for a skill that has no supporting files.

| Path | Trigger Condition |
|---|---|
| `10-workflows/codebase-search.md` | Use when asked to find where a component, route, error, or configuration is defined, or when exploring the codebase. |
| `10-workflows/debugging.md` | Use when the user asks to investigate a bug, failing test, CI failure, or broken behavior. |
| `10-workflows/implementation.md` | Use when the user asks to write code for a new feature, fix a bug, or implement a planned change. |
| `10-workflows/intake.md` | Use when the user provides a vague request, new feature idea, or asks to start a new task. |
| `10-workflows/isolation.md` | Use before editing code to ensure the workspace and branch are isolated for the current task. |
| `10-workflows/maintenance.md` | Use when the user asks to refactor code, update dependencies, fix technical debt, or write docs. |
| `10-workflows/planning.md` | Use when the user asks to plan a complex change, major feature, or when the task requires dependency ordering. |
| `10-workflows/production-feedback.md` | Use when the user reports a production incident, live bug, or needs to update runbooks/monitoring. |
| `10-workflows/release.md` | Use when the user asks to prepare a deployment, ship a feature, or verify release readiness. |
| `10-workflows/review-loop.md` | Use when the user asks to address PR comments, fix lint/CI errors, or respond to reviewer feedback. |
| `30-quality/before-after-visual-evidence/SKILL.md` | Use when a UI change needs before/after screenshots or a PR-ready visual comparison. |
