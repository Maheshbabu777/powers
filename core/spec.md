---
name: spec
description: How to write, get approval for, and maintain a feature spec in .context/specs/. Used for normal and risky tasks.
---

# Spec

One file per feature or fix at `.context/specs/<slug>.md`. Use a short kebab-case slug, like `search-filter` or `fix-login-redirect`. Create it with [../scripts/new-spec.sh](../scripts/new-spec.sh) `<slug>`, which fills in the template and lists specs that look related. Without a shell, copy [../templates/context/spec.md](../templates/context/spec.md).

Before you create one, list `.context/specs/`. If there's already a spec for this work, continue it.

## Sections

- **Status:** `draft`, `approved`, `in progress`, `done`, or `dropped`.
- **Problem:** 2 to 4 sentences, in the user's terms. Who is affected and what's wrong or missing today.
- **Acceptance criteria:** numbered. Each one must be checkable with a test, a command, or a specific manual step.
  - Bad: "Search works well."
  - Good: "Searching `foo` on `/items` returns only items whose title contains `foo`, ignoring case."
- **Affected:** callers, side effects and connected systems this change could break, each with what should happen to it. Comes from [impact.md](impact.md).
- **Out of scope:** what this change won't do, so nobody quietly expands it.
- **Open questions:** ask them in chat. Write the answer next to each question once you have it.
- **Plan:** files to touch in order, the test for each criterion, and risks. Written in step 3 of the workflow.
- **Progress:** a checkbox per plan step. Tick as you go.
- **Notes:** things you learned that only matter for this feature.

## Rules

- Every criterion must come from something the user said or agreed to. If you think one is needed but they didn't ask for it, mark it `(proposed)` and ask.
- Keep it short. Problem, criteria and scope for a normal feature should fit on one screen.
- Don't write code for a normal or risky task until the human has approved the spec and plan. Then set the status to `approved`.
- If the scope changes, update the spec first, then the code.
- When the work is done, set the status to `done`, note next to each criterion where it was verified, and move any stable learnings to `project.md`.
