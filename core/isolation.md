---
name: isolation
description: Use before editing code to ensure the workspace and branch are isolated for the current task.
---

# Isolation

Before editing any code:

- [ ] Confirm current branch is **not** `main`
- [ ] One branch per task — do not mix unrelated changes
- [ ] Check for uncommitted work that could conflict
- [ ] Check for open PRs or active branches touching the same files
- [ ] Confirm dependency/runtime setup belongs to this workspace

## Shared resources are not isolated

Workspaces do **not** isolate:
- Ports
- Databases
- Cloud services
- Lockfiles
- Local caches

If another task owns the same files or shared resources, stop and ask for direction.

## Do

- Create a branch from a clean base
- Name branches clearly (e.g., `fix/login-redirect`, `feat/search-filter`)

## Don't

- Work directly on `main`
- Stack unrelated changes in one branch
- Assume a shared database or service is safe to modify without checking
