---
name: implementation
description: Use when the user asks to write code for a new feature, fix a bug, or implement a planned change.
---

# Implementation

Before coding:

- confirm the task record
- confirm workspace isolation
- run codebase search
- identify contracts and affected components
- run change impact analysis for non-trivial changes
- review `AGENTS.md` for core engineering rules and constraints

Build vertically:

```text
data -> service/domain -> route/controller -> UI/client -> tests
```

Keep implementation inside approved contracts. If the contract is infeasible, stop and return to Architecture.

Gate 3 means implementation complete with developer evidence. It does not mean independently verified.
