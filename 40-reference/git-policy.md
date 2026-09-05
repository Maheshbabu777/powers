# Git policy

- Never commit directly to `main`.
- One task, one branch, one workspace.
- Prefer short-lived branches from the current mainline.
- Do not force-push `main`.
- Use `--force-with-lease` only on your own task branch when needed.
- Check for overlapping open PRs or active work before editing.
- Resolve lockfile conflicts by regenerating, not hand-merging.
- Re-run relevant checks after rebasing or resolving conflicts.
- Do not merge unless explicitly authorized.

Branch examples:

```text
feature/<short-description>
fix/<short-description>
hotfix/<short-description>
agent/<task-name>
```

Commit style:

```text
feat(scope): add capability
fix(scope): handle broken case
docs(scope): update instructions
refactor(scope): simplify without behavior change
test(scope): add coverage
chore(scope): update tooling
```

