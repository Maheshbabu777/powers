---
name: swe-skills-playbook
description: Production-oriented SWE Skills Playbook. Use AGENTS.md as the root map for routing agents through engineering work.
---

# SWE Skills Playbook

This playbook provides a structured, production-oriented engineering workflow for AI agents.

## Architecture & Load Order

There is exactly one entrypoint for agents:
- `AGENTS.md` - The single source of truth containing the core constitution, hard rules, gate tables, and the skill index. 

Agents are instructed to always read `AGENTS.md` before starting any task. The skill index inside `AGENTS.md` provides concrete triggers that tell the agent which specific workflow file (under `10-workflows/`) or quality skill (under `30-quality/`) to read based on the user's prompt.

Project-specific configuration belongs in the consuming project's own repository (e.g., via a project overlay).

## Workflow spine

```text
intake -> isolation -> codebase search -> plan -> build -> prove -> review -> release -> learn
```

Small work skips unnecessary steps. Risk controls depth.

## Source basis

Built from:
- original flat team files mapped into a single entrypoint architecture

Reference patterns adopted from `https://github.com/michaelshimeles/skills`:
- trigger-focused skill descriptions
- isolated task setup
- narrow code-structure skill design
- before/after visual proof for UI review and PRs (using `@vercel/before-and-after`)
- explicit routing rather than file guessing
