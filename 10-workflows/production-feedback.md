---
name: production-feedback
description: Use when the user reports a production incident, live bug, or needs to update runbooks/monitoring.
---

# Production feedback

Incident loop:

```text
Detect -> Contain -> Recover -> Investigate -> Root cause
  -> Corrective action -> Regression test -> Monitoring/runbook update
  -> Product/Architecture feedback when structural
```

Production findings should not dead-end after the immediate fix. Feed them back into specs, ADRs, tests, and runbooks.

