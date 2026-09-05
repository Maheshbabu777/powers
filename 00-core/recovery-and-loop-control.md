---
name: recovery-and-loop-control
description: Use when a fix keeps failing, context becomes unreliable, scope expands, or the agent is tempted to keep trying similar edits.
depends_on:
  - ./constitution.md
  - ./source-of-truth.md
  - ../40-reference/finding-template.md
---

# Recovery and loop control

## Stop triggers

Stop normal execution when:

- the same failure persists after repeated attempts
- each attempt increases blast radius
- root cause is unclear
- a local fix starts turning into architecture work
- source artifacts disagree
- context appears stale or unsupported
- security, data, or irreversible operational risk is unresolved
- the agent cannot explain why the next edit should work

## Required recovery report

```text
Original goal:
Current state:
Failure or contradiction:
Attempts made:
Evidence from each attempt:
What changed between attempts:
Suspected root cause:
What is known:
What is assumed:
What is uncertain:
Blast radius now:
Recommended next strategy:
Human decision needed, if any:
```

## Strategy-change menu

When looping, change strategy:

- reproduce from scratch
- create a minimal reproduction
- inspect the source of truth
- re-read the contract, spec, or ADR
- compare expected vs actual behavior
- add diagnostic logging locally
- isolate or bisect
- ask Architecture for contract/boundary decision
- ask Product when acceptance criteria are unclear
- ask Security when risk is unclear
- stop for human decision when next action is irreversible or speculative

