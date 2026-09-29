---
name: context
description: How to bootstrap, read, and update a project's .context/ folder. Used at the start and end of every task.
---

# Project context

Every project keeps its own context in a `.context/` folder at the repo root:

```text
.context/
  project.md      stable facts about the project. Keep it under 200 lines
  decisions.md    one line per decision someone might later question
  preferences.md  how the human wants work done in this repo: commit rules, code style, working style
  specs/
    <slug>.md     one file per feature or fix (see spec.md)
```

This is the only place you write project notes. No summaries, plans or notes in the repo root, in `docs/`, or in another tool's folder.

## Reading

- `project.md` and `preferences.md`: read all of both at the start of every task.
- The active spec: read all of it when you're working on that feature.
- `decisions.md`: don't read the whole thing. Search it for the area you're touching (for example `grep -i auth .context/decisions.md`).
- Before you rely on a path or command from `.context/`, make sure it still exists. If it's wrong, fix the line in the same task.

## Bootstrap (when project.md is missing)

1. If you can run shell commands, run `scripts/init-project.sh <repo-root>` from the powers folder. It creates the folder, templates and agent entry files without overwriting anything. Otherwise, copy the files from `templates/context/` by hand.
2. Fill in only what you can verify from the repo: stack, layout, entry points, conventions you can see in the code. Run the test command once to confirm it works before writing it down.
3. Some things can't be read from code: what the product is for, who uses it, what's out of scope, and which odd patterns are intentional. Put those under "Ask the human" and ask them in chat. Write the answers in.
4. If another tool's folder already has useful facts (`.kiro/steering`, `.cursor/rules`, an old `docs/` page), move the facts that are still true into `project.md`.

Keep it to pointers and short lines. A bootstrap `project.md` is usually 40 to 80 lines.

## What goes where

| Kind of fact | Where |
|---|---|
| Command, path, convention, or gotcha that stays true across features | `project.md` |
| A choice someone might later ask "why did we do it this way?" about | `decisions.md`, one line |
| Anything only true for the current feature: plan, progress, feature-specific notes | the spec |
| A standing preference the human stated for this repo ("from now on, commits should...") | `preferences.md`, close to their words, with the date |
| A preference you noticed but they never stated | nowhere. Mention it under `Preference suggestions` in the hand-off |
| What you did this session | nowhere. Git history already has it |

Never write copies of code, guesses you haven't checked, or secrets.

## Writing rules

- The bar for `project.md`: would a new engineer need this on day one, or did it cost you more than 10 minutes to figure out? If neither, leave it out.
- Edit in place. If a line is wrong, replace it. Don't add a correction below it.
- One gotcha per line, with the file path it applies to.
- If `project.md` is over 200 lines, condense or delete old lines before adding new ones.
- Update the `Last verified` line at the top of `project.md` whenever you confirm its commands still work.
- `decisions.md` format: `YYYY-MM-DD | decision | why | specs/<slug>.md`.

## After every task

Answer these four questions. This is required. Skipping it silently is the failure it exists to stop.

1. Was a command, path, or convention in `project.md` wrong? Fix it.
2. Did I learn something stable that cost me time? Add one line to `project.md`.
3. Did I make a choice someone might question later? Add one line to `decisions.md`.
4. Is the spec's status and progress list current? Update it.

Then run `scripts/check-context.sh --base <base-branch>` from the powers folder. It fails on stale paths and bad spec status, and its last lines list what changed in `.context/` on this branch. Write the `Context updated:` line in the hand-off report to match. If you changed nothing, say `none, because <reason>`, for example `none, because this fix didn't change any command, path or convention`.
