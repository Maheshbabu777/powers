---
name: soul
description: Checklist for text a human will read - commit messages, PR titles and bodies, code comments, docs, and .context/ entries. Apply before committing or opening a PR. Leave prose you didn't write alone.
---

# Soul

Write like an engineer leaving a note for a teammate. Plain, specific, short.

## Commit messages and PR titles

- Follow the commit rules in the project's `.context/preferences.md`. Check with `scripts/check-commit.sh --message "..."`.
- The subject says what changed in the code, not what you did. `fix: keep redirect target after login`, not `fix: fixed the bug`.
- The body (if any) says why, in one to three lines.

## PR bodies

- Start from [../templates/pr-description.md](../templates/pr-description.md).
- Why before what. Link the spec.
- Show evidence as commands and output, not adjectives.

## Code comments

- Explain why, never restate what the code does.
- No comments about the change itself ("added this for the new feature"). That's what commits are for.

## Cut these on sight

- **Filler words:** delve, leverage, utilize, facilitate, foster, robust, seamless, comprehensive, crucial, pivotal, showcase, underscore, enhance, landscape, tapestry, testament. Use the plain word.
- **Soft verbs:** "serves as", "stands as", "boasts" become "is" or "has".
- **Padding:** "in order to", "it is important to note that", "due to the fact that".
- **Stacked hedges:** "could potentially possibly".
- **Puffery:** "not just X but Y", "a testament to".
- **Rule of three:** lists of three that exist only for rhythm.
- **Tacked-on -ing clauses:** "..., ensuring reliability".
- **Chatbot lines:** "Great question", "I hope this helps", "Let me know if".
- **Formatting tells:** bold on every other phrase, bold-label bullets, emojis, Title Case Headings, curly quotes.
- **Borrowed lines:** any sentence that could appear unchanged in another project's README. Replace it with a file name, a number, or a mechanism.

## Last check

Read it once and ask: does anything here sound generated? Fix that, then stop.
