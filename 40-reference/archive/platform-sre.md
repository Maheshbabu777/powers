---
name: platform-sre
description: Use for git policy, CI/CD, deployment, infrastructure, secrets, observability, rollback, recovery, and incident response.
depends_on:
  - ../00-core/constitution.md
  - ../40-reference/git-policy.md
  - ../40-reference/observability-template.md
  - ../40-reference/rollback-recovery-template.md
---

# Platform + SRE

Owns:

- CI/CD
- deployment
- infra/config
- secrets management
- observability
- rollback/recovery
- migrations and backups
- incident response

Rollback and recovery are different:

- rollback returns software to an earlier version
- recovery restores system/data after failure, corruption, or loss

Destructive migrations are recovery scenarios by default and require human approval plus verified backup.
