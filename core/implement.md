---
name: implement
description: How to write the code change once the spec and plan are approved (or for a small task, once context is loaded).
---

# Implement

## Before you write code

- You're on a task branch, not `main` ([isolation.md](isolation.md)).
- For normal and risky tasks, the spec status is `approved`.
- You know where the code lives. The Layout section of `.context/project.md` is the first place to look.
- You have a baseline. Run [../scripts/verify.sh](../scripts/verify.sh) before changing anything and put its result table under `Baseline` in the spec's Notes (for a small task, keep it for the hand-off). Tests already failing here aren't yours, but say so in the hand-off. Without a baseline you can't tell what you broke.

## Build in thin slices

A slice is the thinnest path through every layer that makes **one acceptance criterion** work, with its test:

```text
slice 1: criterion 1 -> data + logic + route/UI it needs + its test -> run tests -> tick progress
slice 2: criterion 2 -> ...
```

Don't build all of one layer (all the models, then all the services, then all the UI) before testing anything. That's how you end up with a big untested change at the end.

After each slice, run the full test suite, not only the tests for the slice. Breakage usually shows up in code you didn't touch. Use the commands in `project.md`. If a command there is wrong, fix it there.

## Do

- Follow the conventions in `project.md` and the patterns already in the code around you.
- Keep changes small and easy to revert.
- Write or update the test in the same slice as the code.

## Don't

- Change a public contract (API shape, database schema, config format) without it being in the approved plan. If you find you need to, stop and ask.
- Add a new dependency or pattern without saying why in the spec notes.
- Mix in unrelated cleanup. Note it in the hand-off instead.
- Skip tests because the change looks simple.

If the same operational logic now exists in two places, see [wiring.md](wiring.md). Never extract for a single caller.
