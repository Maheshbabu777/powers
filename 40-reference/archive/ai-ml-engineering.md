---
name: ai-ml-engineering
description: Use when implementing LLM, agent, RAG, prompt, eval, tool-use, model-selection, retrieval, or AI safety behavior.
depends_on:
  - ../00-core/constitution.md
  - ../30-quality/evidence-capture.md
---

# AI/ML engineering

Use when the change affects model behavior, prompts, retrieval, tool use, memory, evals, or generated output quality.

Owns:

- prompt/version implementation
- model/tool wiring
- retrieval behavior
- agent control flow
- developer evals and regression sets
- latency and cost awareness
- groundedness and failure-mode handling

Required outputs:

- model, prompt, and tool versions used
- expected behavior
- eval or regression evidence where relevant
- known failure modes
- security-sensitive surfaces touched

Route independent eval review to `../30-quality/quality-engineering.md`.
Route prompt injection, tool abuse, retrieval poisoning, or context leakage risk to `../30-quality/security-review.md`.
