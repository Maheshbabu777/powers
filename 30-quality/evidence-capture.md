---
name: evidence-capture
description: Use whenever a change needs proof. Selects evidence type for UI, API, tests, performance, or agent/tool behavior.
depends_on:
  - ../00-core/evidence-and-findings.md
  - ../40-reference/verification-evidence-template.md
---

# Evidence capture

Evidence types:

- command output for tests, lint, typecheck, build
- before/after screenshots for visual UI
- browser run for interactive flow
- API probe output for backend behavior
- measured numbers for performance
- transcript excerpt for agent/tool behavior

Bug fixes should capture the before failure before changing code when feasible.

Evidence must state:

- commit/build
- branch
- environment
- command/tool
- result
- caveats

Untested scope must be named explicitly.
