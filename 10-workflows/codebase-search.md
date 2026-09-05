---
name: codebase-search
description: Use before implementation or debugging to find relevant code quickly with search, symbols, filenames, errors, routes, configs, and tests.
depends_on:
  - ../00-core/source-of-truth.md
  - ../01-routing/context-loading-policy.md
  - ../40-reference/command-discovery.md
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

