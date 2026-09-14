---
name: plan
description: Use when the user asks to plan a non-trivial change, or when the task needs ordering or impact thinking.
---

# Plan

Only as much planning as the task needs. A one-line fix needs a one-line plan. A multi-file feature needs a real one.

## Produce

- [ ] Goal — what success looks like
- [ ] Non-goals — what this change deliberately does not do
- [ ] Affected files/components
- [ ] Dependency order — what must change first
- [ ] Expected tests/checks
- [ ] Stop conditions — when to pause and ask
- [ ] Risk level (L0/L1/L2) — escalate if it touches auth, payments, sensitive data, public API, or destructive operations

## For small work (L0/L1)

A short note is enough. Do not turn planning into a separate project.

## For larger work (L2+)

Make dependencies and order explicit before implementation. Identify contracts that constrain the change. Note rollback or recovery concerns if relevant.

## Don't

- Plan more than the task requires
- Invent requirements that were not stated or clearly implied
- Skip planning entirely on non-trivial work
