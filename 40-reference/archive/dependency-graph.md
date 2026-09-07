---
name: dependency-graph
description: Reference when checking workflow order, gates, and specialist dependencies.
depends_on:
  - ../00-core/constitution.md
---

# Dependency graph

```text
Human request
  -> Intake
  -> Isolation
  -> Codebase Search
  -> Planning
  -> Requirements when unclear or product-facing
  -> Architecture when boundaries/contracts/data/dependencies change
  -> Frontend/Backend/AI specialist when stack-specific work is needed
  -> Implementation
  -> Code Review when meaningful code changed
  -> Developer Verification
  -> Quality Engineering
  -> Security when risk/surface requires
  -> Release when deployable work exists
  -> Production Feedback after shipping or incident
```

Debugging path:

```text
Intake -> Isolation -> Codebase Search -> Reproduce -> Evidence -> Hypothesis
  -> Experiment -> Fix Plan -> Implementation -> Verification -> QE
```

UI/design path:

```text
Intake -> Isolation -> Product Requirements when needed
  -> Frontend Visual Design
  -> Building Components when reusable UI is created/refactored
  -> Planning
  -> Implementation
  -> Web Design Guidelines
  -> Visual Review
  -> Before/After Visual Evidence when useful
  -> Quality Engineering
```

Security path:

```text
Finding -> Task ID -> Architecture if boundary/contract changes
  -> Engineering fix -> QE regression -> Security confirmation -> Release
```

Maintenance path:

```text
Intake -> Isolation -> Maintenance
  -> Codebase Search when files/commands are unclear
  -> Planning when scope/risk is non-trivial
  -> Applicable checks
  -> Review by risk
```

Review cleanup path:

```text
Fresh review result -> Review Loop -> Fix actionable findings
  -> Re-run checks -> Resolve addressed threads -> Stop clean or capped
```
