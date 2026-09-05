---
name: isolation
description: Use before editing code for any new feature, fix, or maintenance task. Confirms branch/workspace isolation and overlap risk.
depends_on:
  - ../00-core/constitution.md
  - ../40-reference/git-policy.md
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

