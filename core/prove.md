---
name: prove
description: Use when verifying a change works and collecting evidence that it does.
---

# Prove

Evidence is required. "It works" or "tests passed" is not enough.

## Every verification claim needs

- [ ] **What was checked** — specific behavior or requirement
- [ ] **How** — command, tool, browser action, or probe used
- [ ] **Result** — pass/fail, output, screenshot
- [ ] **Environment** — commit, branch, OS, browser, runtime version
- [ ] **Caveats** — what was not tested, known gaps
- [ ] **Untested scope** — name it explicitly, do not silently skip

## For UI changes

- Prefer before/after screenshots when the change is visual
- Load `frontend/before-after/SKILL.md` for visual proof tooling
- Test across breakpoints (desktop, tablet, mobile) when layout is affected
- Test light and dark themes when theming is involved

## For logic changes

- Run the relevant test suite and attach output
- If no tests exist, note that as untested scope
- Add tests where feasible — do not just note the gap and move on

## Do

- Collect evidence as you go, not after the fact
- Be honest about what is and isn't covered

## Don't

- Claim "all tests pass" without running them
- Skip verification because the change looks trivial
- Hide untested scope — name it clearly

## Before finishing

If this evidence feeds into a commit message, PR body, or doc, run `core/soul.md` on the text. Verification summaries are human-facing and should read like a person wrote them.
