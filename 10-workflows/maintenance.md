---
name: maintenance
description: Use when the user asks to refactor code, update dependencies, fix technical debt, or write docs.
---

# Maintenance

Maintenance still needs an authorized reason.

Use for:

- docs-only changes
- non-behavioral cleanup
- refactors
- dependency updates
- tooling/CI changes
- tech debt paydown

Rules:

- do not smuggle product behavior changes into maintenance
- keep scope tight
- identify affected checks
- document known debt only when it is a real accepted compromise
- route dependency or tooling risk to Architecture, Security, or Platform as needed

L0 docs/non-behavioral changes need applicable checks only. Behavior changes follow normal risk routing.

