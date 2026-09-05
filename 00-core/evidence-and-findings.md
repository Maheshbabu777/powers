---
name: evidence-and-findings
description: Use whenever making verification claims or reporting defects. Keeps claims evidence-backed and findings actionable.
depends_on:
  - ./constitution.md
  - ../40-reference/verification-evidence-template.md
  - ../40-reference/finding-template.md
---

# Evidence and findings

## Verification rule

"Tests passed" is not enough. Every verification claim needs:

- what was checked
- exact commit/build/environment
- command, tool, browser, or probe used
- result
- evidence artifact
- caveats or untested scope

Use `../40-reference/verification-evidence-template.md`.

## Finding rule

Problems must be concrete. Vague review comments do not block work.

Every blocking or meaningful issue needs:

- severity
- category
- location
- problem
- why it matters
- failure scenario
- reproduction steps, when available
- evidence
- recommended fix
- regression risk
- verification method

Use `../40-reference/finding-template.md`.

