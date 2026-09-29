---
name: isolation
description: Set up a clean branch before editing code.
---

# Isolation

Before editing code:

1. Check the current branch. If it's `main` or `master`, create a task branch from an up-to-date base, named like `feat/search-filter` or `fix/login-redirect`. Match the spec slug when there is one.
2. Check `git status`. If there's uncommitted work you didn't make, stop and ask before touching it.
3. One branch per task. Don't stack unrelated changes.

A branch doesn't isolate shared things: local databases, ports, cloud resources, lockfiles, caches. Ask before running anything that changes a shared database or cloud resource.
