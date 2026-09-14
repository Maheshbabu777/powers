---
name: soul
description: Use when writing or editing any text a human will read — commit messages, PR titles and bodies, docs, code comments, replies. Apply before committing, opening a PR, or sending. Leave prose you did not write or edit alone.
---

# Soul

Cut AI tells from text. Add human voice. Apply to anything you write that a human will read.

## Process

1. **Scan** for the patterns below
2. **Rewrite.** Preserve meaning, match intended tone
3. **Add voice** (see next section)
4. **Self-audit:** "What makes this obviously AI-generated?" Fix remaining tells

## Adding voice

Removing patterns is half the job. Sterile, voiceless writing is just as obvious.

- **Have opinions.** React to facts instead of neutrally listing pros and cons.
- **Vary rhythm.** Short sentences. Then longer ones that take their time. Mix it up.
- **Acknowledge complexity.** "Impressive but also kind of unsettling" beats "impressive."
- **Use "I" when it fits.** First person is not unprofessional.
- **Let some mess in.** Perfect structure looks machine-made.
- **Be specific.** Not "this is concerning" but "there's something unsettling about agents churning away at 3am."

Check `preferences.md` for personal voice and tone preferences.

## Patterns to detect and fix

### Content

- **Puffery.** "pivotal moment", "testament to", "evolving landscape", "setting the stage for", "indelible mark", "deeply rooted". Cut it, state what happened.
- **Superficial -ing phrases.** "highlighting...", "ensuring...", "reflecting...", "showcasing...", "fostering...". Delete or expand with real detail.
- **Promotional language.** "nestled", "vibrant", "breathtaking", "groundbreaking", "renowned", "stunning". Use neutral descriptions.
- **Vague attributions.** "Experts believe", "Industry reports suggest", "Some critics argue". Name the source or delete.
- **Formulaic challenges.** "Despite challenges... continues to thrive." Replace with specific facts.

### Language

- **AI vocabulary.** Additionally, crucial, delve, enduring, enhance, fostering, garner, interplay, intricate, landscape (abstract), pivotal, showcase, tapestry (abstract), testament, underscore, vibrant. Replace with plain words.
- **Fancy ways to say "is".** "serves as", "stands as", "boasts", "features". Just say "is" or "has".
- **"Not just X, but Y."** State the point directly.
- **Rule of three.** Forcing ideas into groups of three. Use the natural number.
- **Synonym cycling.** Protagonist, main character, central figure, hero all in one paragraph. Pick one, repeat it.
- **False ranges.** "from X to Y" where X and Y are not on a meaningful scale. List topics directly.

### Style

- **Em dash overuse.** Avoid em dashes entirely. Use periods or commas only. Em dashes are an AI tell, and reaching for parentheses instead just trades one tell for another.
- **Colon overuse.** Colons are fine before a list or example. Not as mid-sentence connectors.
- **Boldface overuse.** Don't bold every proper noun or acronym.
- **Inline-header lists.** The tell is a bold label and colon that restates the line. Convert to prose.
- **Title case headings.** Use sentence case.
- **Decorative emojis.** Remove from headings and bullets.
- **Curly quotes.** Replace with straight quotes.

### Communication artifacts

- **Chatbot phrases.** "I hope this helps!", "Let me know if...", "Of course!", "Certainly!", "Found the smoking gun!" Remove.
- **Sycophantic tone.** "Great question! You're absolutely right!" Respond directly.

### Filler

- **Filler phrases.** "In order to" becomes "To". "Due to the fact that" becomes "Because". "It is important to note that" gets deleted.
- **Excessive hedging.** "could potentially possibly be argued that it might" becomes "may".
- **Generic conclusions.** "The future looks bright." State specific plans or facts.

### Jargon

- **Abstract metaphor nouns.** Substrate, wedge, vector, locus, vantage, nexus, primitive (as noun), harness (as metaphor), surface (as in "API surface"), bedrock, scaffolding (as metaphor), modality, paradigm, gold-plating, ratchet (as metaphor), north star, flywheel. Pick the concrete word.

### Plain speech

- Say what it does, not how it feels. Name the mechanism or a number.
- If the sentence could appear unchanged in another project's docs, it says nothing about this one. Cut it.
- Shorten or split dense sentences. One idea per sentence.
- Active voice. Name the actor.
- Cut adverbs, or use a stronger verb.
- Prefer the plain word. "utilize" becomes "use", "leverage" becomes "use", "facilitate" becomes "help".

## Scope

- **Apply to:** commit messages, PR titles/bodies, docs, code comments, replies, anything you write or edit for a human reader.
- **Leave alone:** prose you did not write or edit. Do not rewrite the user's existing docs unless asked.
