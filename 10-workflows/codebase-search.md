---
name: codebase-search
description: Use when asked to find where a component, route, error, or configuration is defined, or when exploring the codebase.
---

# Codebase search

Use fast search before opening random files.

Prefer:

- `rg --files` for file inventory
- `rg "<symbol-or-error>"`
- route/path searches
- config key searches
- dependency name searches
- test name searches

Build a small evidence map:

```text
Searched:
Matched:
Likely authoritative files:
Related tests:
Unknowns:
Next file to read:
```

Stop expanding context once enough evidence supports the next action.

