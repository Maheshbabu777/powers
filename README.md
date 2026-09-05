---
name: swe-skills-playbook
description: Production-oriented SWE Skills Playbook built from the existing sweskills material. Use as the root map for routing agents through engineering work.
---

# SWE Skills Playbook

This playbook turns the original flat team files into a frugal, production-team-like agent system.

It is not a mandate to run many agents. It is a set of roles, workflows, and handoff contracts that can collapse to three practical hats:

- Builder: product, architecture, engineering, developer verification.
- Reviewer: quality, security when relevant, visual review when relevant.
- Operator: git, release, observability, rollback, recovery.

## Load order

Always load:

- `00-core/constitution.md`
- `01-routing/router.md`
- the current workflow file under `10-workflows/`

Load only when relevant:

- specialist files under `20-specialists/`
- quality files under `30-quality/`
- templates under `40-reference/`
- project overlays under `90-project-overlays/`

## Workflow spine

```text
intake -> isolation -> codebase search -> plan -> build -> prove -> review -> release -> learn
```

Small work skips unnecessary steps. Risk controls depth.

## Source basis

Built from:

- original `README.md`
- original `00-constitution.md`
- original `01-product-ux.md` through `07-security-red-team.md`
- original `frontend-visual-design-skill.md`

Reference patterns adopted from `https://github.com/michaelshimeles/skills`:

- trigger-focused skill descriptions
- isolated task setup
- narrow code-structure skill design
- evidence capture as a real artifact
- before/after visual proof for UI review and PRs
- Vercel Design/UI ideas: Web Interface Guidelines and Building Components
- bounded review loops
- concise workflow spine
- explicit frontend/backend/AI engineering routes
- production code review, maintenance, observability, and engineering-writing support
