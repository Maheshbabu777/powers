---
name: release
description: Use when the user asks to prepare a deployment, ship a feature, or verify release readiness.
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
