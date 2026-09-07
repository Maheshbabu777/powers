---
name: code-review
description: Use for independent implementation review of diffs before or during PR review. Focuses on correctness, regressions, maintainability, contracts, and test adequacy.
depends_on:
  - ../00-core/constitution.md
  - ../00-core/evidence-and-findings.md
  - ../40-reference/finding-template.md
---

# Code review

Review the change as an independent engineer.

Prioritize:

- correctness bugs
- contract violations
- missing validation or error handling
- regressions
- missing or weak tests
- maintainability risks
- risky dependencies
- security-sensitive changes that need Security
- observability gaps

Do not rewrite the implementation during review unless explicitly wearing the Builder hat again. Findings go back to the owner.

Use `../40-reference/finding-template.md` for actionable issues.

