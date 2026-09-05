---
name: source-of-truth
description: Use when specs, docs, tests, code, or agent memory disagree. Prevents silent guesses and stale-context decisions.
depends_on:
  - ./constitution.md
---

# Source of truth

When artifacts disagree, do not guess and do not silently choose whichever one is easiest.

Authority order:

1. Explicit human-approved product decisions
2. Human-approved architectural decisions
3. Approved API, data, or interface contracts
4. Approved security constraints
5. Current implementation
6. Tests and generated artifacts
7. Agent assumptions

This hierarchy identifies authority. It does not authorize silent overwrites.

If code contradicts a contract, the contract is authoritative for intent, but the mismatch is itself a finding.

## Stale context rule

Treat summaries, memory, and old docs as possibly stale. Prefer current source files, current tests, current configs, and current human-approved artifacts.

Refresh context when:

- code contradicts docs
- tests contradict stated behavior
- branch is stale
- a previous agent summary lacks evidence
- the task crosses a component boundary
- the next change expands the blast radius

When stale or conflicting context blocks progress, use `./recovery-and-loop-control.md`.
