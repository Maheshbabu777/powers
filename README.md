# Feature Development Powers

A focused, light-by-default playbook for building and changing features with AI agents.

## Philosophy

- **Light by default.** Small bugs, corrections, and simple add-ons use only core skills. No heavy process unless the task warrants it.
- **Heavy skills on demand.** Security review, performance analysis, and deep observability are detailed and useful, but only loaded when explicitly needed.
- **Quality built in.** Code structure (`wiring.md`) and clean human writing (`soul.md`) are part of the normal path, not afterthoughts.
- **Frontend-aware.** Design system guidance and visual before/after tooling are available when touching UI.
- **Preferences evolve.** How you like to work is captured in `preferences.md` and grows over time as agents learn your patterns.
- **Evidence over claims.** Verification requires proof, not assertions.

## How to use

1. **Start at `AGENTS.md`** — the single entrypoint. It contains the rules, skill index, and workflow spine.
2. **Core skills** (`core/`) are the default path for everyday feature work, including structure and writing quality.
3. **Frontend skills** (`frontend/`) load only when you're touching UI.
4. **On-demand skills** (`on-demand/`) load only when you ask for them or the change clearly needs them.
5. **Preferences** (`preferences.md`) — agents read and update as you work together.

## Structure

```
powers/
├── AGENTS.md              ← Single entrypoint: rules + skill index
├── CLAUDE.md              ← Claude directive (points to AGENTS.md)
├── README.md              ← This file
├── LICENSE
├── preferences.md         ← Living preference layer
│
├── core/                  ← Default path for feature work
│   ├── intake.md
│   ├── isolation.md
│   ├── search.md
│   ├── plan.md
│   ├── implement.md
│   ├── debug.md
│   ├── prove.md
│   ├── review.md
│   ├── wiring.md          ← Actions vs services, shared mechanics
│   └── soul.md            ← Cut AI tells, add human voice
│
├── frontend/              ← Load when touching UI
│   ├── frontendeng.md     ← UI components, state, accessibility
│   ├── design-system.md
│   └── before-after/      ← Visual proof skill + scripts
│
├── on-demand/             ← Explicit opt-in only
│   ├── security-review.md
│   ├── performance.md
│   └── observability.md
│
└── templates/             ← Useful templates only
    ├── task-record.md
    ├── finding.md
    ├── pr-description.md
    └── verification-evidence.md
```

## What was removed

This repo was intentionally pruned from a heavier enterprise playbook. Removed material includes:

- Multi-role gate system (7 gates, mandatory security red-team)
- Specialist role files (architecture, platform/SRE, quality engineering, etc.)
- Large archive of reference material
- Unused stub templates (ADR, threat model, design system template, etc.)
- Project overlay system

The focus is now on practical feature development with progressive disclosure of depth.
