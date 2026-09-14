---
name: debug
description: Use when the user asks to investigate a bug, failing test, CI failure, or broken behavior.
---

# Debug

Do not start by editing. Understand first, then fix.

## Order

1. **Reproduce** the failure — get a consistent repro
2. **Capture evidence** — error messages, logs, stack traces, screenshots
3. **State expected vs actual** — what should happen vs what does happen
4. **Identify likely owner files** — use search to find the relevant code
5. **Form one hypothesis** — what could cause this specific gap
6. **Run one meaningful experiment** — test the hypothesis, not a guess
7. **Interpret the result** — did the experiment confirm or reject?
8. **Fix only when root cause is credible** — not before
9. **Add regression coverage** — a test that would have caught this
10. **Hand off evidence** — document what was found and fixed

## Do

- Capture the "before" failure state when feasible
- Change one thing at a time
- Verify the fix actually addresses the root cause, not a symptom

## Don't

- Edit code before understanding the failure
- Apply multiple fixes simultaneously
- Skip regression tests because "it works now"

## When stuck

If the same failure persists after a few attempts, or the fix keeps growing in scope:
- Stop
- Report what you know, what you tried, and what failed
- Ask for direction

Do not keep thrashing.
