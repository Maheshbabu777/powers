---
name: browser-control
description: Drive a real headless browser from the terminal to navigate, fill forms, click, wait for async results, scroll, and screenshot live pages. Use when a task needs to interact with a running app (not just load a static URL) — for example driving a scan and waiting for results, verifying a rendered UI state, or capturing screenshots of a page that only appears after user interaction. Powered by the `agent-browser` CLI (vercel-labs/agent-browser, Apache-2.0).
allowed-tools:
  - Bash(agent-browser *)
  - Bash(which agent-browser)
  - Bash(npm install -g agent-browser)
  - Bash(npx agent-browser *)
---

# Browser Control Skill

Full headless-browser automation for agents. Unlike the before-after skill (which loads a
static URL and snapshots it), this skill can *interact*: type into inputs, click, wait for
async results (WebSocket/XHR), scroll, and capture a page that only exists after a user flow.

> **Package:** `agent-browser` (source: `vercel-labs/agent-browser`). Install with
> `npm install -g agent-browser` then `agent-browser install` to download Chromium.
> Never assume it is present — always run the pre-flight check first.

## When to use this skill

- The target state only appears after interaction (fill a URL, submit, wait for a result).
- You need to verify or screenshot a *rendered* UI state, not a static route.
- A before/after capture requires driving the app to produce the "after" state.

If you only need to snapshot a plain URL with no interaction, prefer `frontend/before-after`.

## Core rule: work by snapshot + ref, never by eye

You cannot see the page. Do not guess coordinates or assume selectors. The reliable loop is:

1. `agent-browser open <url>` — navigate.
2. `agent-browser snapshot -i --json` — get interactive elements as refs (`@e1`, `@e2`, ...).
3. Parse the JSON, pick the ref for the element you want.
4. Act on it: `agent-browser fill @e3 "docs.stripe.com"`, `agent-browser click @e2`.
5. **Wait explicitly** before capturing — never a blind sleep when a real signal exists.
6. Re-`snapshot` after the page changes, then continue.

## Execution order (MUST follow)

1. **Pre-flight** — `which agent-browser || npm install -g agent-browser` then
   `agent-browser install` (first run only, downloads Chromium).
2. **Open** — `agent-browser open <url>` (use the local dev URL for "after").
3. **Snapshot** — `agent-browser snapshot -i --json` to find the input and submit control.
4. **Interact** — `fill` the target URL into the scan input, `click`/`press Enter` to submit.
5. **Wait for the real result** — prefer `wait --text` / `wait <selector>` / `wait --fn`
   over a fixed delay. Waiting for the actual banner/result is the difference between real
   evidence and a blank screenshot.
6. **Scroll into view** — `agent-browser scrollintoview <selector>` for the element of interest.
7. **Capture** — `agent-browser screenshot <path>` (or `--full` only if the whole page is asked for).
8. **Close** — `agent-browser close`.

Never skip step 1 or step 5. A screenshot taken before the async result lands is not evidence.

## Quick reference

```bash
# Pre-flight
which agent-browser || npm install -g agent-browser
agent-browser install                      # downloads Chromium (first run)

# Navigate + discover
agent-browser open http://localhost:3000
agent-browser snapshot -i --json           # interactive elements with refs

# Interact by ref (preferred for agents)
agent-browser fill @e3 "docs.stripe.com"
agent-browser click @e2
agent-browser press Enter

# Wait for the async result (pick the strongest signal available)
agent-browser wait --text "Bot access"     # wait for text to appear
agent-browser wait "#scan-error"           # wait for a selector
agent-browser wait --load networkidle      # wait for network to settle
agent-browser wait --fn "window.ready === true"

# Scroll + capture
agent-browser scrollintoview "text=Bot access"
agent-browser screenshot after.png
agent-browser close
```

## Isolated sessions (avoid clobbering state)

Use `--session` (or `AGENT_BROWSER_SESSION`) to keep parallel captures independent, e.g. when
grabbing "before" and "after" without cross-contaminating cookies/storage:

```bash
agent-browser --session before open http://localhost:3001   # old build
agent-browser --session after  open http://localhost:3000   # new build
```

## Capturing before/after for a PR

The "after" is the current branch running locally. The "before" needs the pre-change code
running too — check out the earlier commit in a throwaway git worktree and serve it on a second
port, so the working tree is never disturbed:

```bash
git worktree add ../lensy-before <base-commit>
# start the old build on a second port, capture with --session before
# ... then: git worktree remove ../lensy-before
```

Once you have `before.png` and `after.png`, hand them to `frontend/before-after`:
`before-and-after before.png after.png --markdown`, then inject via `gh pr edit`.

## Honesty rule (non-negotiable)

If the scan stalls, errors, or the expected result never renders, STOP and say so. Do not
capture a blank or error state and present it as the change. A screenshot is only evidence if
it actually shows the state you claim. This mirrors the playbook rule: never claim verification
without evidence.

## Error reference

| Error | Fix |
|---|---|
| `command not found` | `npm install -g agent-browser` |
| Chromium missing / launch fails | `agent-browser install` (Linux: `agent-browser install --with-deps`) |
| Element not found | Re-run `snapshot -i --json`; the ref may be stale after a page change |
| Screenshot is blank/empty | You captured before the async result — add a real `wait` on the result |
| Self-signed / local HTTPS errors | add `--ignore-https-errors` |
