---
name: review-loop
description: Use when responding to PR review, CI findings, static analysis, security review, or AI reviewer feedback. Bounded loop, fresh results only.
depends_on:
  - ../00-core/recovery-and-loop-control.md
  - ../00-core/evidence-and-findings.md
  - ../40-reference/finding-template.md
---

# Review loop

Use this pattern for human review, CI, static analysis, security review, or AI reviewer feedback.

Loop:

1. Trigger or collect review.
2. Confirm results are fresh for the current commit.
3. Parse findings.
4. Separate actionable issues from notes or false positives.
5. Fix actionable issues.
6. Re-run relevant checks.
7. Resolve addressed threads or document why not.
8. Repeat until clean or capped.

Default cap: 3 iterations unless the project says otherwise.

If capped, report:

- iterations
- resolved findings
- remaining findings
- current evidence
- why continuing is not safe or useful

