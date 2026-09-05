---
name: planning
description: Use after requirements/context are clear and before implementation to define the smallest safe execution plan, dependencies, checks, and handoffs.
depends_on:
  - ../00-core/constitution.md
  - ./codebase-search.md
  - ../40-reference/change-impact-analysis-template.md
---

# Planning

Plan enough to avoid random edits. Do not turn planning into a separate project.

Produce:

- goal
- non-goals
- affected files/components
- dependency order
- expected tests/checks
- risk level
- reviewer path
- rollback or recovery concern, if any
- stop conditions

For small L0/L1 work, this can be a short note. For L3/L4 work, make dependencies and handoffs explicit before implementation.

