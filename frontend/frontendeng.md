---
name: frontendeng
description: Use when implementing frontend UI, client state, routing, API integration, forms, accessibility behavior, browser behavior, or frontend performance.
---

# Frontend engineering

Adapted from Vercel's frontend engineering, component building, and web interface guidelines.

This skill covers *how* the frontend is engineered and reviewed. For visual direction, tokens, and design-system rules, load `frontend/design-system.md`.

## Ownership

When acting as a frontend engineer, you own:
- Frontend implementation and client routing
- State management and API integration
- Forms and validation wiring
- Accessibility behavior in code
- Browser performance and bundle awareness
- Frontend tests

## Building Components

Before creating a new component, check whether an existing component or pattern already covers the need.

If a new component is justified:
1. **Define purpose:** Outline its purpose and non-purpose.
2. **Define states:** default, hover, focus, active, disabled, loading, error, selected (where relevant).
3. **Define behavior:** Determine keyboard and screen-reader behavior.
4. **Define tokens:** Use design tokens for styling, not raw visual values.
5. **Define responsive behavior:** Ensure it works across breakpoints.
6. **Document:** Add or update component docs when the pattern is reusable.

### Quality bar
Components should be:
- Accessible by default
- Composable without boolean-prop sprawl
- Explicit about controlled vs uncontrolled state
- Typed clearly
- Themeable through design tokens
- Styled through stable state or data attributes

## Web Interface Review Guidelines

Use this as a practical review pass for web UI code and rendered behavior. Report findings by file and line, or if reviewing rendered behavior, include route/viewport/state/evidence.

### Structural & Semantic
- **HTML over ARIA:** Use semantic HTML before reaching for ARIA.
- **Buttons vs Links:** Actions use buttons; navigation uses links.
- **Form controls:** Ensure forms have labels, names, types, autocomplete, and useful error handling.
- **Icon buttons:** Icon-only buttons must have accessible names.
- **Images:** Images have explicit dimensions (to prevent layout shift) and correct alt behavior.
- **Long text:** Text containers safely handle very long content without breaking layout.

### Interactive & Accessible
- **Keyboard operation:** Ensure full UI can be operated via keyboard.
- **Focus states:** Focus states are visible and not covered by sticky UI.
- **Next steps:** Labels and errors clearly tell the user what to do next.
- **Destructive actions:** Destructive actions require confirmation or undo.
- **Motion:** Motion respects reduced motion and avoids lazy `transition: all`.
- **Hover/Active:** Hover, active, and focus states actually increase clarity.
- **Mobile context:** Touch targets (e.g., 44x44) and safe areas work correctly on mobile.

### State & System
- **State design:** Empty, sparse, dense, loading, and error states are explicitly designed and handled.
- **Routing:** The URL reflects meaningful UI state.
- **Performance:** Large lists are virtualized or otherwise bounded.
- **System theme:** Dark mode and browser UI use appropriate `color-scheme` and `theme-color`.
- **Localization:** Dates, numbers, and currency use locale-aware formatting.
- **Hydration:** Hydration risks (like random values, dates, or `window` access) are handled deliberately.
