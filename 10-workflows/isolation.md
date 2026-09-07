---
name: isolation
description: Use before editing code to ensure the workspace and branch are isolated for the current task.
---

# Isolation

Before editing:

- confirm task identity
- confirm current branch is not `main`
- confirm one branch/workspace per task
- check for uncommitted work
- check open PR or active branch overlap when available
- confirm dependency/runtime setup belongs to this workspace

Remember that workspaces do not isolate shared resources:

- ports
- databases
- cloud services
- lockfiles
- local caches

If another task owns the same files or resources, stop and ask for direction.

