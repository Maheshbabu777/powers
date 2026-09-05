---
name: production-feedback
description: Use after deployment, incidents, regressions, or live user reports to close the loop into product, architecture, tests, and runbooks.
depends_on:
  - ../00-core/evidence-and-findings.md
  - ../20-specialists/platform-sre.md
  - ../30-quality/security-red-team.md
  - ../40-reference/incident-record-template.md
---

# Production feedback

Incident loop:

```text
Detect -> Contain -> Recover -> Investigate -> Root cause
  -> Corrective action -> Regression test -> Monitoring/runbook update
  -> Product/Architecture feedback when structural
```

Production findings should not dead-end after the immediate fix. Feed them back into specs, ADRs, tests, and runbooks.

