Before starting a task, read this file. Check the skill index below and load matching skills before acting.

# Feature Development Powers

A light-by-default playbook for building and changing features with AI agents. Heavy reviews (security, performance, deep observability) are on-demand only. Quality skills for structure and clean human writing are part of the normal path.

---

## Non-negotiable rules

1. Builders never certify their own work without evidence.
2. Never invent a requirement.
3. Never claim verification without evidence.
4. Never silently skip, delete, or weaken a failing test.
5. Prefer small, reversible changes.
6. Never work directly on `main`.
7. Stop when repeated fixes fail or context becomes unreliable.
8. Security and accessibility are never optional when the change actually involves them.
9. Process depth scales with risk and size — not habit.
10. Always check and respect `preferences.md`.

## Light-by-default rule

**Default path for small bugs, corrections, and simple add-ons = core skills only.**

Do **NOT** load `on-demand/security-review.md`, `on-demand/performance.md`, or `on-demand/observability.md` unless:

- The user explicitly asks, **OR**
- The change clearly touches high-risk areas (auth, payments, sensitive data, public API surface, destructive operations), **OR**
- The user asks to "harden", "review security", "improve performance", "add observability", etc.

When none of those apply, the core skills are all you need.

Note: `core/wiring.md` and `core/soul.md` are core quality skills. They are allowed and encouraged on normal feature work. They are not heavy on-demand skills.

## Risk awareness

Keep a simple risk sense:

| Level | Meaning |
|---|---|
| L0 | Docs, config, non-behavioral |
| L1 | Low-risk isolated change |
| L2 | Normal feature or multi-file change |

Escalate depth (load on-demand skills, ask for review) only when risk or user request justifies it. Do not force heavyweight process on every task.

If a change touches auth, payments, sensitive data, public API, or destructive operations, treat it as at least L2 and consider loading the relevant on-demand skill.

## Workflow spine

```
intake → isolation → search → (plan if needed) → implement (+ wiring when relevant) → prove → review → done
```

**Before you commit or open a PR:** run `core/soul.md` on your commit message, PR title, PR body, and any docs or comments you wrote. This is not optional. AI-sounding text in commits and PRs erodes trust.

Small work skips unnecessary steps. Not every task needs a plan. Frontend and on-demand skills load only when triggered.

## Preference evolution

- Always read `preferences.md` when relevant.
- When the user corrects you or states a clear standing preference, update `preferences.md` in a clean, reusable form.
- Do not invent preferences. Only record repeated or explicitly stated ones.
- Preferences refine how work is done. They do not override the non-negotiable rules.
- Keep preference entries short and actionable.

## Recovery

If the same failure persists, blast radius grows, or context becomes unreliable:

1. **Stop.** Do not keep thrashing.
2. Report clearly: what you tried, what failed, what you know, what you don't.
3. Ask for direction.

---

# Skill Index

| Path | When to load |
|---|---|
| `core/intake.md` | Vague request, new feature idea, or starting a new task |
| `core/isolation.md` | Before any code edit |
| `core/search.md` | Finding components, routes, errors, configs, or exploring the codebase |
| `core/plan.md` | Non-trivial change that needs ordering or impact thinking |
| `core/implement.md` | Writing the actual code change |
| `core/debug.md` | Investigating a bug, failing test, or broken behavior |
| `core/prove.md` | Verifying the change works; collecting evidence |
| `core/review.md` | Addressing PR/CI/lint feedback or doing a light review loop |
| `core/wiring.md` | Deciding what belongs in actions vs shared services, when operational logic is duplicated across flows, or when adding a feature that shares mechanics with existing ones |
| `core/soul.md` | Writing or editing any text a human will read: commit messages, PR titles/bodies, docs, code comments, replies. Apply before committing or sending |
| `frontend/frontendeng.md` | Building robust, accessible, and performant web UI components, state, and browser behavior |
| `frontend/design-system.md` | Building or refining UI, layout, theming, interactions, or product frontend |
| `frontend/before-after/SKILL.md` | UI change that needs visual proof or PR screenshots |
| `on-demand/security-review.md` | User asks for security review, or clear high-risk signals |
| `on-demand/performance.md` | User asks for performance work |
| `on-demand/observability.md` | User asks for deeper observability or instrumentation |
| `preferences.md` | Always relevant — read for standing preferences; update when a clear preference appears |
