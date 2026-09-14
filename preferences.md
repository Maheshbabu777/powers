# Preferences

Standing preferences that agents must respect. Update this file when a clear, reusable preference appears.

> **Rules for updating**: Only record preferences the user has explicitly stated or repeatedly demonstrated. Do not invent preferences. Keep entries short and actionable. Preferences refine *how* work is done — they do not override non-negotiable rules in `AGENTS.md`.

## General

- Prefer practical, working code over theoretical perfection.
- Keep things simple. Do not over-engineer.

## Implementation

- When shared operational logic appears across two or more callers, extract to a service layer. Never extract for a single caller.

## Frontend

- Motion should be quiet and useful. Avoid bouncy, attention-seeking animations.
- Respect `prefers-reduced-motion` in all motion work.

## Testing & Evidence

- Always run tests before claiming they pass. Attach output.
- Name untested scope explicitly. Do not pretend full coverage.

## Git / PR

- Use conventional commit prefixes: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`, `style:`, `perf:`, `ci:`, `build:`, `revert:`.
- Commit messages should be lowercase after the prefix. No period at the end.
- Keep commit subjects under 72 characters.
- PR titles follow the same conventional commit format.
- PR bodies should explain *why*, not just *what*.

## Things to avoid

- Do not use em dashes in any human-facing text. Use periods or commas.
- Do not use AI-sounding words: delve, leverage, utilize, facilitate, foster, showcase, underscore, pivotal, vibrant, landscape (abstract).
- Do not add sycophantic openers ("Great question!", "Absolutely!").

## History / Notes

- Conventional commit style preference stated explicitly by user during initial setup.
- Repo restructured from enterprise playbook to Feature Development Powers.
