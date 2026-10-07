---
name: powers
description: Feature development workflow for coding agents. Use when building a new feature, changing existing behavior, or fixing a bug in a code repository. Reads and maintains the project's .context/ folder, which holds project facts and one spec per feature.
---

# Powers

A workflow for building features in any repo, with any coding agent. All links below are relative to the folder this file is in.

Two things, kept apart:

- **Powers** (this folder) say how to work. They are the same in every project. Never write project facts here.
- **`.context/`** (inside the project repo) says what the project is: stable facts in `project.md`, decisions in `decisions.md`, and one spec per feature in `specs/`. You read it at the start of every task and update it at the end.

## Rules

1. Don't invent requirements. If something that would change scope is unclear, ask.
2. Don't claim something works without the command you ran and what it printed.
3. Never skip, delete, or weaken a failing test to get a green run.
4. Never work directly on `main` or `master`.
5. Code wins over docs. If `.context/` disagrees with the code, trust the code and fix `.context/` in the same task.
6. If the same fix fails twice, or you lose track of what's going on, stop and report what you tried.
7. Follow the project's `.context/preferences.md`. It beats any general rule in these powers. Add to it only when the human states a standing preference in their own words.
8. Never commit with `--no-verify`. If the commit hook rejects your message, fix the message.

## Size the task first

| Size | Looks like | Steps |
|---|---|---|
| Small | Obvious fix or tweak, one or two files, no open behavior questions | 1, 4, 5, 6 |
| Normal | New behavior, several files, or anything a user would notice | All six |
| Risky | Touches auth, payments, personal data, public API, migrations, or deletes data | All six, plus the matching [on-demand](#other-powers) review. Plan approval is required even if the change is small |

Say which size you picked and why in one line. If you're unsure between two sizes, pick the bigger one.

## Workflow

### 1. Load context (every task)

Read `.context/project.md` and `.context/preferences.md` in full. If they don't exist, follow the bootstrap in [core/context.md](core/context.md) before anything else.

Run [scripts/check-context.sh](scripts/check-context.sh) from the repo root. Fix any `FAIL` before starting. Stale context misleads you for the whole task.

Check `.context/specs/` for a spec that matches this task. If one exists, continue it instead of starting a new one.

**Output:** one line, e.g. `Context: read project.md, continuing specs/search-filter.md`.

### 2. Spec (normal and risky)

First find what the change could break: run [scripts/impact.sh](scripts/impact.sh) on the files and functions you expect to touch and follow the before-the-spec steps in [core/impact.md](core/impact.md). If it turns up a public contract, shared data or another service, the task is risky.

Then follow [core/spec.md](core/spec.md). Create a new spec with [scripts/new-spec.sh](scripts/new-spec.sh) `<slug>`, which also warns about related specs. Write or update `.context/specs/<slug>.md` with the problem, acceptance criteria, what's affected, what's out of scope, and open questions.

**Output:** the spec file. Ask the open questions now, not halfway through the code.

### 3. Plan, then stop for approval (normal and risky)

Add the plan to the same spec file: the files you'll touch in order, the test that proves each acceptance criterion, and the risks.

**Stop here.** Show the spec and plan and wait for the human to approve before writing code. Set the spec status to `approved` once they do.

### 4. Implement

- Branch first: [core/isolation.md](core/isolation.md).
- Build in slices: [core/implement.md](core/implement.md). Tick the progress list in the spec as each slice lands.
- Something broken or a test failing for unclear reasons: [core/debug.md](core/debug.md).
- Same operational logic showing up in two places: [core/wiring.md](core/wiring.md).
- Touching UI: [frontend/frontendeng.md](frontend/frontendeng.md), and [frontend/design-system.md](frontend/design-system.md) for visual work.
- Looking for where something lives: check the Layout section of `project.md` first, then [core/search.md](core/search.md).

If the scope changes while you work, update the spec first, then the code.

### 5. Verify against the spec

Follow [core/prove.md](core/prove.md). Run [scripts/verify.sh](scripts/verify.sh) for the test, lint and type-check evidence block. Every acceptance criterion gets pass or fail, with the command or step you used and its result. Then check that nothing else broke: the full suite against the baseline, every critical flow in `project.md`, and your diff against the plan ([core/impact.md](core/impact.md#before-hand-off-every-task)). This applies to small tasks too. Name anything you didn't test.

### 6. Update context and hand off

Run the after-task check in [core/context.md](core/context.md#after-every-task), then `scripts/check-context.sh --base <base-branch>`. Its last lines tell you what context changed on this branch. Your `Context updated:` line must match them. Context edits go in the same commit as the code so the human sees them in the diff.

Write commit messages and PR text with [core/soul.md](core/soul.md), following the commit rules in `.context/preferences.md`. Check a message first with `scripts/check-commit.sh --message "..."`.

End with this report, every time, even for small tasks:

```text
Done: <one line>
Size: small | normal | risky
Criteria: <n>/<m> verified (details in .context/specs/<slug>.md)  or  n/a (small task)
Critical flows: <n>/<m> pass, <list any failed or not checked>
Regressions: none vs baseline  or  <tests that passed before and fail now>
Untested: <list, or none>
Context updated: <files and why>  or  none, because <reason>
Preference suggestions: <list, or none>
```

## Other powers

| File | Load when |
|---|---|
| [core/review.md](core/review.md) | Responding to PR comments, CI failures, or lint errors |
| [frontend/before-after/SKILL.md](frontend/before-after/SKILL.md) | A UI change needs before/after screenshots of a static URL |
| [frontend/browser-control/SKILL.md](frontend/browser-control/SKILL.md) | You need to drive a running app (fill forms, click, wait) to check or capture a state |
| [on-demand/security-review.md](on-demand/security-review.md) | Risky task touching auth, secrets, payments or personal data, or the user asks for a security review |
| [on-demand/performance.md](on-demand/performance.md) | The user asks for performance work, or a criterion has a speed or size target |
| [on-demand/observability.md](on-demand/observability.md) | The user asks for logging, metrics or tracing |
| [templates/pr-description.md](templates/pr-description.md) | Opening a PR |

## Scripts

Run them from the project repo root, as `<powers-path>/scripts/<name>`. They need bash (Git Bash works on Windows). If you can't run shell commands, do the same checks by hand.

| Script | What it does |
|---|---|
| [init-project.sh](scripts/init-project.sh) | Creates `.context/` and the agent entry files. Never overwrites |
| [check-context.sh](scripts/check-context.sh) | Flags stale paths, oversized `project.md`, bad spec status, notes outside `.context/`. With `--base`, lists context changes on the branch |
| [new-spec.sh](scripts/new-spec.sh) | Creates a spec from the template and lists related specs |
| [check-commit.sh](scripts/check-commit.sh) | Checks commit messages against `.context/preferences.md`. Runs as a git hook, or on demand with `--message` or `--range main..HEAD` |
| [install-hooks.sh](scripts/install-hooks.sh) | Installs the commit-msg hook. `init-project.sh` runs it for you |
| [impact.sh](scripts/impact.sh) | Lists who imports or uses the code you'll touch and the side effects they carry. With `--base`, warns about new dependencies and env vars `project.md` doesn't know |
| [verify.sh](scripts/verify.sh) | Runs checks from the Commands table in `project.md` and prints an evidence block |
| [capture.sh](frontend/before-after/scripts/capture.sh) | Before/after screenshots. See the before-after skill |
