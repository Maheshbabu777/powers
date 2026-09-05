---
name: before-after-visual-evidence
description: Use when a UI change needs before/after screenshots or a PR-ready visual comparison. Do not use for backend-only or non-visual changes unless measured output pairs are more useful than screenshots.
depends_on:
  - ./evidence-capture.md
  - ../40-reference/finding-template.md
---

# Before/after visual evidence

Use this skill when visual proof helps reviewers understand what changed.

Inspired by Vercel's `before-and-after` screenshot-comparison skill, but scoped here as evidence support inside the playbook rather than a universal release requirement.

## Use when

- UI bug fixes
- visual design changes
- responsive/layout changes
- styling regressions
- component state changes
- PRs where a screenshot comparison would reduce review ambiguity

## Do not use when

- the change is backend-only
- the change is an invisible refactor
- screenshots would expose secrets, private data, or customer data
- functional behavior is better proven by tests, API probes, logs, or measured outputs

## Evidence shape

Capture:

- before image, baseline URL, or baseline state
- after image, changed URL, or changed state
- route/screen/component
- viewport/device size
- commit/build/environment
- caveats or untested states

For PRs, produce a simple comparison table:

```text
| Before | After |
|---|---|
| <before image> | <after image> |
```

## Boundaries

This skill proves visible change. It does not replace:

- `./visual-review.md` for visual/design-system judgment
- `./web-design-guidelines.md` for accessibility/performance/UX review
- `./quality-engineering.md` for functional verification
- `./security-review.md` for sensitive data checks

If the before/after evidence contradicts the claimed change, report a Finding using `../40-reference/finding-template.md`.
