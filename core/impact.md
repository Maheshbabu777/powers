---
name: impact
description: Find everything a change could break before writing the spec - callers, shared code, side effects like logs, jobs, emails and analytics - and check it all again before hand-off.
---

# Impact

Most "I fixed X and broke Y" bugs come from code that was connected to X in a way nobody checked. Find those connections before you plan, and check them again before you hand off.

## Before the spec (normal and risky)

1. List the files and functions you expect to change. A guess is fine, the scan corrects it.
2. Run [../scripts/impact.sh](../scripts/impact.sh) with those paths and symbols. If a code graph tool (an MCP server that answers "who calls this") is available, ask it too. It sees calls that grep misses.
3. Read the files it lists as callers. Don't just count them. A caller that depends on the exact current behavior is the one that breaks.
4. Check the `Connected systems` section of `.context/project.md` for anything outside the code: webhooks set up in a dashboard, other services reading the same database, scheduled jobs on a server.
5. Write the result in the spec's `Affected` section: each caller, concern and connected system, and what should happen to it (`unchanged, covered by <test>`, `changes, criterion 3`, or `unknown, ask`).

If the scan finds a public contract, shared data, or another service depending on this code, the task is risky, whatever size it looked like before.

## Before hand-off (every task)

1. Run the full test suite, not just the tests for the code you touched. Compare it with the baseline from [implement.md](implement.md). A test that passed on the baseline and fails now is your regression, even if it looks unrelated.
2. Check every flow in the `Critical flows` section of `project.md`. Use its test where it has one, otherwise do the manual steps written there. Report each one as pass, fail, or not checked.
3. Read your own `git diff <base>`. Every changed file should be in the plan or the `Affected` list. Explain or revert anything that isn't. Look hardest at shared helpers, global state, config and anything you changed "while you were there".
4. Run `scripts/impact.sh --base <base-branch>` once more. It warns about new dependencies and environment variables that `project.md` doesn't mention yet. Each warning gets a line in `Concerns` or `Connected systems`, or a reason in the hand-off.

## Keeping the map current

- Found a connection the hard way? Add it: a pattern under `Concerns` if code can show it, a line under `Connected systems` if it can't.
- A bug slipped through to a flow that isn't listed? Ask the human whether it belongs in `Critical flows`. Never add one yourself.
