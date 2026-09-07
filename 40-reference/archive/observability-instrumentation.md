---
name: observability-instrumentation
description: Use when a feature, fix, deployment, or incident needs logs, metrics, health checks, traces, alerts, dashboards, or redaction decisions.
depends_on:
  - ../00-core/constitution.md
  - ./platform-sre.md
  - ../40-reference/observability-template.md
---

# Observability instrumentation

Observability means the team can tell what happened without exposing sensitive data.

Decide:

- what failure modes must be visible
- what event, metric, or health signal proves the behavior
- what must be redacted
- what must never be logged
- what alert or dashboard is needed, if any
- what evidence proves the signal works

Never log passwords, tokens, credentials, private documents, sensitive prompts, private model context, payment data, or unnecessary PII.

Route redaction uncertainty to `../30-quality/security-review.md`.
Route deployment/alert ownership to `./platform-sre.md`.
