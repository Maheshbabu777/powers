---
name: implement
description: Use when the user asks to write code for a new feature, fix a bug, or implement a planned change.
---

# Implement

## Before coding

- [ ] Isolation confirmed (not on `main`, clean branch)
- [ ] Search done — you know where the relevant code lives
- [ ] Contracts and affected components identified
- [ ] Check `preferences.md` for standing implementation preferences

## Build vertically

```text
data → service/domain → route/controller → UI/client → tests
```

Prefer small, vertical slices that can be tested independently. Do not build all layers of a feature before testing any of them.

## Do

- Stay inside known contracts and patterns
- Follow existing code conventions in the project
- Keep changes small and reversible
- Write or update tests alongside the change
- Reference `preferences.md` for style and tooling choices

## Don't

- Change contracts without stopping to discuss
- Make sweeping refactors inside a feature branch
- Skip tests because the change looks simple
- Introduce new patterns or dependencies without justification
- Smuggle unrelated cleanup into a feature change

## When shared logic appears

If you find yourself duplicating operational mechanics across flows, load `core/wiring.md` to decide what belongs in actions vs a shared service layer. Do not extract for a single caller.
