---
name: editorial-product-frontend-design
description: Universal guidance for designing and refining polished multi-page product websites and lightweight web apps with clear hierarchy, intentional motion, responsive navigation, accessible forms, theming, and coherent interaction patterns.
---

# Frontend design guide

Use this as a practical design reference when building or refining a multi-page product site. It captures the choices that make an interface feel cohesive, calm, and purposeful rather than assembled from generic components.

## 1. Start with a committed visual system

Pick a small set of decisions and apply them everywhere:

- Choose one type family for interface and body text; add a mono face only for true data/code contexts.
- Use a limited colour palette: a page ground, primary ink, muted ink, one restrained accent, surfaces, and subtle border tones.
- Define all reusable colours, radii, shadows, and easing curves as CSS variables/tokens. Components should consume tokens rather than hard-coded colours.
- Use one intentional radius scale. Round contained interactive objects—buttons, dropdowns, popovers, selected cards, form panels—but do not round every divider, row, or editorial section.
- Use thin, low-contrast borders to organise information. Borders should create rhythm, not visual noise.

For editorial product experiences, favour an uncluttered ground, confident typography, generous whitespace, and precise alignment. Avoid gradients, colourful badges, generic all-caps labels, or dashboard-like cards unless the product truly needs them.

## 2. Build hierarchy before decoration

Make the content immediately readable:

- Give display headings a distinctive scale, tight tracking, and compact line-height.
- Keep body text comfortable and consistent; long-form reading usually benefits from a constrained measure and around `16px` text.
- Use sentence case for navigation, labels, and actions.
- Separate display, body, metadata, and helper text by size, colour, and spacing—not by excessive font weights.
- Reserve the accent colour for links, selected states, or a meaningful part of a headline.
- Use whitespace to establish groups before adding backgrounds or cards.

When a page has a hero plus supporting copy, use an asymmetric grid where it helps hierarchy. Do not default to equal columns simply because a grid is available.

## 3. Use a simple responsive strategy

Treat mobile as a deliberate composition, not a squeezed desktop page.

- Use fluid text sizing with `clamp()` for large headings.
- Collapse multi-column grids at a defined tablet/mobile breakpoint.
- Prevent accidental horizontal overflow at the page level.
- Preserve enough padding on narrow screens for controls and readable text.
- Keep desktop cards and data layouts from becoming visually cramped on smaller screens; stack or simplify them instead.
- Account for sticky headers with `scroll-margin-top` on anchor targets.

### Navigation

Use different navigation treatments when the layout requires it:

- On desktop/tablet, a centered compact navigation rail can work well when it has clear active state and enough breathing room.
- On phones, replace a crowded row of links with a small menu button and a right-aligned dropdown.
- Show the active page clearly in both treatments; a shared sliding indicator works well in a desktop rail, while a selected background/check works well in a dropdown.
- Close mobile menus after navigation and when Escape is pressed.
- Keep primary utility controls, such as appearance settings, available on mobile.

## 4. Make interactions quiet and useful

Motion should explain feedback, hierarchy, or state change. It should never compete with content.

Good defaults:

- Use one shared easing curve, such as a quick ease-out with a soft settle.
- On buttons, use a subtle colour/shadow change and at most a `1px` lift on hover.
- Nudge a directional arrow slightly when its action is hovered.
- Use an underline sweep for text links.
- Fade/settle route content in briefly after a navigation change.
- Let menus and popovers scale/fade in from their attachment point.
- Use small progressive steps for long-running or mocked processes.
- Use a one-time arrival treatment for a key hero heading, then remember it for the browser session so it does not replay during internal navigation.

Avoid:

- Bouncy, spring-heavy, or attention-seeking button animation.
- Control rotation or tilt unless it has a direct meaning.
- Input fields morphing into boxes or shifting layout when focused.
- Replaying a loading animation when its result is already available.
- Large page translations that make the interface feel unstable.
- Motion that ignores `prefers-reduced-motion`.

Always provide a reduced-motion fallback that shows final states immediately and disables smooth scrolling/animations.

## 5. Design forms around confidence

Forms should explain what is happening without relying on browser-default messages.

- Use visible labels even when placeholders provide examples.
- Let inputs use a simple, stable focus treatment: a border, a mild surface change, or a restrained ring. Do not animate an input into a new component.
- Validate in the application, using `noValidate` when replacing native bubbles.
- Attach errors directly to the field that needs attention, not at the bottom of a form or in a toast that can be missed.
- Write helpful messages: “Add your email address to continue” is better than “Required.”
- Clear the error when the user begins correcting the relevant field.
- Use `aria-invalid`, `aria-describedby`, and `role="alert"` appropriately.
- Keep supporting/privacy text in place when errors appear; do not replace it with a tiny message.

When an action has an allowance or quota, keep the primary action visually normal. On activation, explain that the limit is reached and present the appropriate next action. Avoid permanently converting the button into an unfriendly disabled state without explanation.

## 6. Handle asynchronous product states deliberately

A mock or live analysis flow should behave like a consistent product, not a sequence of unrelated screens.

- Personalise results from the submitted input where practical.
- Show the main result as soon as it is ready.
- Make optional or secondary checks discoverable without interrupting the main result.
- Persist fetched client-side state while the user remains in the experience.
- Do not run a loading sequence again for a check that has already completed.
- Distinguish raw signals/data from recommendations or actions. They should not share the same control treatment.
- Keep each result group at the height its content needs; equal-height columns often reduce clarity.
- Use rounded, contained surfaces for result summaries, tables, and selected views when the rest of the page is editorial.

## 7. Keep repeated components consistent

Create small shared conventions instead of styling each page independently:

- One primary button treatment.
- One secondary/text-link treatment.
- One directional arrow/icon treatment.
- One focus-ring treatment.
- One menu/popover surface treatment.
- One card elevation/hover treatment, used only for interactive cards.
- One spacing and label scale.

Use the same icon family everywhere. Reuse the same icon for the same meaning: one arrow style for forward navigation, one for back navigation, one close icon, one menu icon. Icons should support copy, not replace it where ambiguity is possible.

## 8. Theme with tokens, not overrides

Support light, dark, and system preference through a central token layer.

- Map every surface, text colour, border, shadow, and interactive state to tokens.
- Check navigation, popovers, form panels, result cards, feedback widgets, and selected states in each theme—not only the page background.
- Theme transitions should cover background, border, text, fill/stroke, and shadows together.
- Do not transform the theme trigger itself as feedback.
- Keep contrast high enough for body text and controls in both modes.

## 9. Design utility widgets as complete mini-flows

Small persistent controls, such as feedback, need the same care as a full page.

- Keep the launcher compact and comfortably padded.
- Use a readable, stable heading size; do not accidentally resize it through global form styles.
- Change text size without changing the widget’s geometry unless geometry is the requested problem.
- Animate open/close with a short, subtle transition.
- After submission, show a concise confirmation and return cleanly to the normal page state. Do not force an unnecessary second flow.
- Place persistent widgets where they do not interfere with primary navigation or mobile controls.

## 10. Preserve clarity in long-form and legal content

- Keep article bodies in a narrow reading column with comfortable `16px` text and generous line-height.
- Organise growing content lists top-down so the newest or most important material is easy to add and discover.
- Keep article back links and pagination clear, using the shared back-arrow convention.
- Treat policy/terms pages as first-class pages: use the same typography, theme, header/back link, section navigation, and readable measure as the rest of the site.

## 11. Accessibility baseline

- Give every interactive control a visible keyboard focus state.
- Use semantic buttons for actions and semantic links for navigation.
- Use `aria-current` for the active route and `aria-expanded`/`aria-controls` for menus and disclosure controls.
- Do not signal state with colour alone.
- Ensure body copy and controls meet contrast requirements in every theme.
- Preserve scrolling even if scrollbar chrome is visually hidden.
- Do not depend on browser-default validation popups as the only feedback channel.

## 12. Implementation workflow

1. Inspect the existing entrypoint, router, global CSS/tokens, and shared components before changing UI.
2. Preserve the current application shell, routes, providers, font wiring, and unrelated functionality.
3. Identify whether a change is local or systemic. Use existing components/tokens for local changes; alter tokens only when the whole system needs a change.
4. Build structure and information hierarchy first, then add surface styling and motion.
5. Test desktop, tablet, and phone layouts, including open menus, long text, and form errors.
6. Test light, dark, and system theme states.
7. Verify keyboard access and reduced-motion behaviour.
8. Run the relevant build/type check after broad changes or after fixing an error.

## Final change checklist

- Does the new element use shared theme tokens?
- Is the radius appropriate to the component rather than applied by habit?
- Is the interaction useful, restrained, and reduced-motion safe?
- Does the mobile layout have its own intentional navigation/spacing treatment?
- Does a form error appear exactly where it can be understood and corrected?
- Are repeated icons, arrows, buttons, and links visually consistent?
- Does async state persist while the user remains in the experience?
- Are anchor targets visible below sticky UI?
- Is horizontal overflow prevented without disabling intended scrolling?
- Does the change make the product feel more coherent rather than merely more decorated?
