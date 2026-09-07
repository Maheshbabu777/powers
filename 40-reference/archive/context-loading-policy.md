---
name: context-loading-policy
description: Use to keep agent context small and fresh. Defines what to load always, on demand, and when to refresh.
depends_on:
  - ../00-core/source-of-truth.md
---

# Context loading policy

Always load:

- `../00-core/constitution.md`
- current task record
- current workflow skill

Load on demand:

- specialist skill needed now
- artifact template being produced
- project overlay
- related spec, contract, ADR, finding, or runbook

Do not load by default:

- every role file
- every template
- full visual-design skill for backend work
- full red-team guide for ordinary low-risk changes

Refresh from source when:

- docs and code disagree
- tests and stated behavior disagree
- branch is stale
- prior agent summary lacks evidence
- search results contradict loaded context
