---
name: web-design-guidelines
description: Use when reviewing or building web UI for accessibility, focus, forms, motion, typography, content handling, images, performance, navigation state, touch behavior, safe areas, theming, i18n, hydration, hover states, and UX copy.
depends_on:
  - ./evidence-capture.md
  - ../40-reference/finding-template.md
---

# Web design guidelines

Adapted from Vercel's Web Interface Guidelines. Use this as a practical review pass for web UI code and rendered behavior.

## Check

- semantic HTML before ARIA
- icon-only buttons have accessible names
- form controls have labels, names, types, autocomplete, and useful error handling
- actions use buttons; navigation uses links
- keyboard operation works
- focus states are visible and not covered by sticky UI
- motion respects reduced motion and avoids `transition: all`
- text containers handle long content
- empty, sparse, dense, loading, and error states are designed
- images have dimensions and correct alt behavior
- large lists are virtualized or otherwise bounded
- URL reflects meaningful UI state
- destructive actions require confirmation or undo
- touch targets and safe areas work on mobile
- dark mode and browser UI use appropriate `color-scheme` and `theme-color`
- dates, numbers, and currency use locale-aware formatting
- hydration risks are handled deliberately
- hover, active, and focus states increase clarity
- labels and errors tell the user what to do next

## Output

When reviewing code, report findings by file and line.

When reviewing rendered behavior, include:

- route/screen
- viewport
- state
- evidence

Use `../40-reference/finding-template.md` for meaningful defects.
