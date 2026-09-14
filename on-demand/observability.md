---
name: observability
description: Use when the user asks for deeper observability, instrumentation, logging, metrics, or tracing.
---

# Observability

This skill is **on-demand**. Do not load it by default. Load it when:
- The user explicitly asks to add logging, metrics, tracing, or monitoring
- The user says "add observability", "instrument", "add monitoring", or similar
- A production incident reveals missing visibility

## Core principle

Observability means the team can tell **what happened** without reproducing it, and without exposing sensitive data.

## Decide before instrumenting

- [ ] What failure modes must be visible?
- [ ] What event, metric, or health signal proves the behavior?
- [ ] What must be redacted?
- [ ] What must never be logged?
- [ ] What alert or dashboard is needed, if any?
- [ ] What evidence proves the signal actually works?

## Logging

### Do
- Use structured logging (JSON or key-value pairs)
- Include correlation/request IDs for tracing
- Log at appropriate levels: ERROR for failures, WARN for degradation, INFO for key events, DEBUG for development
- Include enough context to diagnose without reproducing (timestamp, user action, component, outcome)
- Test that logs actually appear where expected

### Don't
- Log passwords, tokens, credentials, private documents, sensitive prompts, private model context, payment data, or unnecessary PII
- Log entire request/response bodies in production
- Use string concatenation for log messages (use structured fields)
- Log at INFO/WARN level for routine operations that would flood

### Redaction

When in doubt about whether data is sensitive, redact it. Better to have a redacted log than a data leak.

Common fields to redact:
- Passwords and auth tokens
- Credit card numbers, SSNs, government IDs
- Email addresses and phone numbers (unless needed for the specific diagnosis)
- API keys and secrets
- Health/medical data
- Private message content

## Metrics

### Key metric types
- **Counters** — things that only go up (requests, errors, signups)
- **Gauges** — current value (active connections, queue depth, memory usage)
- **Histograms** — distribution of values (request latency, response size)

### Naming conventions
- Use dot or underscore separation: `http.request.duration` or `http_request_duration`
- Include units: `_seconds`, `_bytes`, `_total`
- Be consistent across the codebase

### What to measure
- Request rate, error rate, latency (RED method)
- Utilization, saturation, errors (USE method for resources)
- Business-critical events (signups, purchases, key user actions)

## Tracing

### When to add traces
- Cross-service calls
- Database queries
- External API calls
- Message queue publish/consume
- Long-running or multi-step operations

### Trace context
- Propagate trace IDs across service boundaries
- Include span names that describe the operation, not the implementation
- Add relevant attributes (user ID, resource type, operation outcome)

## Alerts

### Do
- Alert on symptoms (high error rate, high latency) not causes
- Set thresholds based on actual baselines, not guesses
- Include runbook links or clear next steps in alert descriptions
- Test that alerts actually fire when conditions are met

### Don't
- Alert on every error — some errors are expected
- Set thresholds so sensitive that alerts become noise
- Create alerts without a clear owner or response action

## Health checks

- Liveness: "is the process running?" — keep it simple
- Readiness: "can this instance serve traffic?" — check dependencies
- Do not make health checks expensive or side-effect-producing

## Evidence that observability works

- [ ] Can you answer "what happened?" for the key failure modes without reproducing them?
- [ ] Do logs/metrics/traces appear in the expected destination?
- [ ] Are sensitive fields properly redacted?
- [ ] Do alerts fire when they should (and only when they should)?
