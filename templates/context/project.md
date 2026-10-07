# PROJECT_NAME

Last verified: YYYY-MM-DD at commit <hash>

## What it is

<!-- 2 or 3 lines: what it does, who uses it. Ask the human if the code doesn't make it obvious. -->

## Out of scope

<!-- What this project deliberately doesn't do. Ask the human. -->

## Stack

- 

## Commands

| Task | Command |
|---|---|
| Install | |
| Run locally | |
| All tests | |
| One test file | |
| Lint | |
| Type check | |
| Build | |

## Layout

<!-- One line per important folder or entry point. Pointers, not descriptions of the code. -->
- `src/` - 

## Conventions

<!-- Only ones you can see in the code or the human told you. -->
- 

## Critical flows

<!-- What must never break, written by the human. One line each: the flow, then its test or the manual steps to check it. Every task checks all of them before hand-off (core/impact.md). Ask the human for these during bootstrap. -->
- 

## Concerns

<!-- Side effects scripts/impact.sh looks for, one per line as `- name: `regex``. Add a pattern when you find a new kind of side effect. Examples:
- logging: `logger\.|console\.error`
- analytics: `gtag\(|analytics\.track|posthog\.capture`
- email: `sendEmail\(|resend\.`
- jobs: `queue\.add|cron\.schedule`
- payments: `stripe\.|razorpay`
-->
- 

## Connected systems

<!-- Connections the code doesn't show: webhooks set in a dashboard, other services reading this database, jobs on a server, alerts built on log lines. Ask the human. -->
- 

## Gotchas

<!-- One line each, with a file path. Things that cost time to discover. -->
- 

## Ask the human

<!-- Questions bootstrap couldn't answer. Delete each one once it's answered and written above. -->
- 
