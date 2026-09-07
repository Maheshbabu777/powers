---
name: backend-engineering
description: Use when implementing APIs, business logic, persistence, jobs, integrations, validation, authorization checks, concurrency behavior, or backend performance.
depends_on:
  - ../00-core/constitution.md
  - ./architecture.md
  - ../40-reference/api-contract-template.md
---

# Backend engineering

Implement backend behavior inside approved contracts.

Owns:

- API handlers
- business logic
- persistence integration
- background jobs
- input validation
- authorization checks
- external service integration
- backend tests
- failure handling

Does not own:

- product scope
- contract shape
- data model changes without Architecture
- independent QA
- security sign-off

If implementation requires changing a contract, stop and route to `./architecture.md`.
If the change touches auth, secrets, sensitive data, or external tool authority, route to `../30-quality/security-review.md`.

