---
name: review
description: How to handle PR comments, CI failures, and lint errors on an existing change.
---

# PR feedback

This is for responding to feedback on a change. Checking your own work against the spec is [prove.md](prove.md).

## Loop

1. Collect the feedback: human comments, CI, linters, AI reviewers.
2. Make sure the results are for the current commit, not an older one.
3. Sort it: real problems, style nits, and false positives.
4. Fix the real problems first, grouping related fixes.
5. Re-run the checks.
6. Reply to each item: fixed, or why not.
7. Repeat, up to 3 rounds unless the user says otherwise.

If a comment changes what the feature should do, update the spec before the code.

## When you hit the cap

Report: rounds done, what's fixed, what's left and why, and why another round isn't worth it.

## Don't

- Mark something resolved that you didn't fix.
- Argue about style before the real issues are fixed.
- Keep going past the cap without asking.
