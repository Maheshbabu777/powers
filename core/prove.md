---
name: prove
description: How to verify a change against its acceptance criteria and show the evidence.
---

# Prove

"It works" isn't evidence. A command and its output is.

## For each acceptance criterion

Record in the spec, next to the criterion:

- how you checked it: test name, command, or the exact manual steps
- the result: pass or fail, with the relevant output lines

For a small task without a spec, put the same thing in the hand-off report.

Add environment details (browser, OS, runtime version) only when they could change the result, like UI rendering or a flaky integration.

## Test, lint and type check

Run [../scripts/verify.sh](../scripts/verify.sh) from the repo root. It runs the commands from the Commands table in `project.md` and prints a block with the commit, each command and its result. Paste that block into the spec. A check it reports as `not run` goes under `Untested`, and if the command exists but isn't in `project.md`, add it there.

## UI changes

- Before and after screenshots when the change is visual: [../frontend/before-after/SKILL.md](../frontend/before-after/SKILL.md). If the state only appears after clicking through the app: [../frontend/browser-control/SKILL.md](../frontend/browser-control/SKILL.md).
- Check mobile and desktop widths when layout changed, and light and dark themes when colors changed.

## Logic changes

- Run the test suite that covers the change, using the command from `project.md`, and read the output yourself.
- If there were no tests for this area, add at least one. If you truly can't, say so under `Untested`.

## Don't

- Say "all tests pass" without having run them in this session.
- Skip verification because the change looks trivial.
- Leave out what you didn't test. Name it in the hand-off.
