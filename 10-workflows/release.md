---
name: release
description: Use when preparing to deploy or ship. Confirms gates, rollback/recovery, observability, and deployment evidence.
depends_on:
  - ../00-core/constitution.md
  - ../20-specialists/platform-sre.md
  - ../40-reference/rollback-recovery-template.md
---

# Release

Before release:

- confirm Gate 4 is clear
- confirm Gate 5 is clear when security review is required
- confirm CI/check evidence
- attach before/after visual evidence for UI changes when useful
- confirm rollback and/or recovery path
- confirm observability and redaction
- confirm migrations and backups where relevant
- get human approval for irreversible actions

After release:

- record deployment version/environment
- check health
- attach evidence
- hand off to production feedback when needed
