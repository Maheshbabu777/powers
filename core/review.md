---
name: review
description: Use when the user asks to address PR comments, fix lint/CI errors, or respond to reviewer feedback.
---

# Review

Handle review feedback systematically. Do not thrash.

## Loop

1. Collect review feedback (human, CI, linter, AI reviewer)
2. Confirm results are fresh for the current commit
3. Parse findings
4. Separate actionable issues from notes, style nits, or false positives
5. Fix actionable issues
6. Re-run relevant checks
7. Resolve addressed items or document why not
8. Repeat until clean or capped

## Iteration cap

Default: **3 iterations** unless the user says otherwise.

If capped, report:
- Iterations completed
- Findings resolved
- Findings remaining (with reasons)
- Current evidence
- Why continuing is not safe or productive

## Do

- Fix real issues before arguing about style
- Group related fixes into a single pass
- Re-run checks after each fix round

## Don't

- Ignore actionable feedback
- Silently mark items as resolved without fixing them
- Keep looping past the cap without asking

## Before finishing

Run `core/soul.md` on the commit message, PR title, and PR body before committing or opening the PR. AI-sounding text in review artifacts erodes trust. This step is easy to forget in the heat of a task. Do not skip it.
