---
name: intake
description: Use when the user provides a vague request, new feature idea, or asks to start a new task.
---

# Intake

Clarify what needs to happen before doing anything else.

## Checklist

- [ ] What is the task? (feature, fix, refactor, docs, other)
- [ ] Are the requirements clear, or does ambiguity remain?
- [ ] What areas of the codebase are affected?
- [ ] Risk sense: L0 (docs/non-behavioral), L1 (isolated, low-risk), L2 (normal feature)?
- [ ] Does this touch auth, payments, sensitive data, or public API? → If yes, risk goes up.
- [ ] Are there existing tests, contracts, or specs that constrain this work?

## When to ask the human

Ask when ambiguity would change:
- Scope or effort
- Security posture
- Data handling
- Irreversibility of the change

Do not guess at requirements. If the request is vague, ask one focused clarifying question rather than assuming.

## Output

A short task summary: what, why, affected areas, risk level, and any open questions.
Keep it proportional — a one-line bug fix needs a one-line summary, not a spec.
