---
name: debugging
description: Use when behavior is broken, tests fail, CI fails, or production/user reports need investigation.
depends_on:
  - ../00-core/recovery-and-loop-control.md
  - ./codebase-search.md
  - ../30-quality/evidence-capture.md
  - ../40-reference/finding-template.md
---

# Debugging

Do not start by editing.

Order:

1. Reproduce the failure.
2. Capture evidence.
3. State expected vs actual behavior.
4. Identify likely owner files.
5. Form one hypothesis.
6. Run one meaningful experiment.
7. Interpret the result.
8. Fix only when the root cause is credible.
9. Add regression coverage.
10. Hand off evidence.

If the same failure persists or the fix keeps growing, use `../00-core/recovery-and-loop-control.md`.

