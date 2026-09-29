# Powers

A feature development workflow for coding agents that works with any agent: Claude Code, Codex, Kiro, Cursor, and others.

## The idea

Two things, kept apart:

- **Powers** (this repo) say how to work: size the task, write a spec, get approval, build in slices, verify against the spec, update context. They're the same in every project and agents never write to them.
- **`.context/`** (inside each project) says what the project is. Agents read it at the start of every task and update it at the end.

```text
your-project/
  AGENTS.md                 entry point for most agents
  CLAUDE.md                 @AGENTS.md
  .kiro/steering/powers.md  entry point for Kiro (only if the project uses Kiro)
  .powers/                  this repo, as a git submodule or a copy
  .context/
    project.md              stable facts: commands, layout, conventions, gotchas
    decisions.md            one line per decision
    preferences.md          how you want work done in this repo, e.g. commit rules
    specs/<slug>.md         one spec per feature: criteria, plan, progress
```

## Setting up a project

```bash
cd your-project
git submodule add <powers-repo-url> .powers
.powers/scripts/init-project.sh .
```

The script creates `.context/` and the agent entry files, and never overwrites existing ones. If the project already has an `AGENTS.md`, paste the block from `templates/project/AGENTS.md` into it.

Then ask your agent to start any task. On the first run it fills in `project.md` from the repo and asks you what it can't work out from the code.

With Claude Code you can also install this folder as a skill. The project still needs `.context/` and the `AGENTS.md` block.

## How context stays useful

The rules are in [core/context.md](core/context.md). In short:

- Pointers and one-line facts, not prose or copied code. `project.md` stays under 200 lines.
- Code wins. A wrong line gets replaced in the same task.
- Nothing about "what I did this session". That's the git log.
- Every hand-off ends with a `Context updated:` line, so a skipped update is visible.
- Context edits ship in the same commit as the code, so you review them in the diff.

## Layout

```text
SKILL.md          the whole workflow, start here
core/             context, spec, isolation, implement, debug, prove, review, search, wiring, soul
frontend/         UI engineering, design system, before/after screenshots, browser control
on-demand/        security, performance, observability
templates/        context/, project/ entry files, PR and finding templates
scripts/          init-project, install-hooks, check-context, check-commit, new-spec, verify
```
