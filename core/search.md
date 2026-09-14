---
name: search
description: Use when asked to find where a component, route, error, or configuration is defined, or when exploring the codebase.
---

# Search

Use fast search before opening random files.

## Prefer

- `rg --files` for file inventory
- `rg "<symbol-or-error>"` for definitions and usages
- Route/path searches
- Config key searches
- Dependency name searches
- Test name searches

## Build an evidence map

```text
Searched:
Matched:
Likely authoritative files:
Related tests:
Unknowns:
Next file to read:
```

## Do

- Start with the narrowest query that could answer the question
- Use file-type filters (`-g '*.ts'`) to reduce noise
- Read matched files before broadening the search

## Don't

- Open random files hoping to stumble on the answer
- Keep expanding context after enough evidence supports the next action
- Search for things you can infer from files already read
