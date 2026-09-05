---
name: security-review
description: Use for auth, authorization, secrets, input validation, injection, data exposure, dependency risk, infra security, and AI/LLM-specific risks.
depends_on:
  - ../00-core/constitution.md
  - ../00-core/evidence-and-findings.md
  - ../40-reference/threat-model-template.md
  - ../40-reference/finding-template.md
---

# Security review

Review is triggered by:

- auth or authorization
- access control
- sessions
- secrets
- input handling
- injection/XSS/CSRF
- file upload
- API abuse/rate limits
- data exposure
- dependency/supply-chain risk
- infra security
- AI/LLM tool or retrieval behavior

A surface being security-adjacent triggers review. It blocks release only when a real defect with failure scenario and impact is found.

Confirmed critical and high findings block by default. Only a human can override a security block, with an override record.
