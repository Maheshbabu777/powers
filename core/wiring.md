---
name: wiring
description: Use when multiple flows duplicate the same operational logic, when deciding what belongs in actions vs shared services, or when adding a feature that shares mechanics with existing ones. Do not use for pure one-off domain logic.
---

# Wiring

> **Stop. Before extracting anything:** if the logic has only one caller, keep it in that caller. Do not extract for a single caller. Over-abstraction is worse than duplication. Come back here only when you have two or more callers doing the same operational work.

Two-layer separation: **actions** orchestrate domain rules (the "why/when"), while a **service layer** centralizes reusable operational mechanics (the "how").

This prevents duplicated code, inconsistent behavior, and bugs fixed in one path but not others.

## When to use

- Multiple callers need the same low-level operation (sandbox creation, email sending, payment processing)
- You're copy-pasting operational logic between action files
- A bug fix in one workflow doesn't propagate to others doing the same thing
- Adding a new feature that shares mechanics with existing flows

**Don't use when:** Logic is truly domain-specific and used by only one caller. Do not extract for a single caller.

## The split

```
Orchestration (Actions)              Service Layer (Shared Mechanics)
├── owns business rules              ├── owns reusable operations
├── owns state transitions           ├── owns provider/SDK interactions
├── owns auth/ownership checks       ├── owns command execution details
├── owns failure classification      ├── owns health checks / readiness
├── owns retries / user-facing errors└── returns structured results
└── calls service functions
```

**Rule of thumb:**
- "What this product flow means" → keep in actions
- "How to do this operation reliably" → move to service layer

## Designing service functions

Design as composable capability blocks, not monoliths:

```
createManagedSandbox(...)
prepareRepo(...)
detectPackageManager(...)
installDependencies(...)
runBuildCommand(...)
startSandboxRuntime(...)
```

Each function should:

- [ ] Accept all required data as explicit parameters
- [ ] Return structured outputs (e.g., `{ ready, previewUrl, proxyPort }`)
- [ ] Never reach into database/state directly
- [ ] Make failure explicit (structured results, not swallowed errors)
- [ ] Let callers choose strict vs relaxed behavior per flow

Check `preferences.md` for project naming and layer conventions.

## Migration checklist

When extracting shared logic:

1. Write the flow in action code first (clear behavior)
2. Mark repeated operational chunks across callers
3. Extract only repeated, non-domain chunks to service
4. Replace one caller → verify → replace remaining callers
5. Keep domain policy in actions (auth, status transitions, error classification)
6. Run verification: typecheck, lint, confirm all flows still work

## Anti-patterns

| Anti-pattern | Problem |
|---|---|
| God service | One huge function hides all control flow |
| Leaky service | Service mutates database tables directly |
| Inconsistent API | Each function uses different argument styles and error semantics |
| Over-abstraction | Extracting logic used by only one caller |

## Example

```ts
// emailService.ts — shared mechanics
export async function sendWelcomeEmail(params: { to: string; name: string }) {
  const html = `<h1>Welcome ${params.name}</h1>`;
  await emailProvider.send(params.to, "Welcome", html);
}

// userSignup.ts — orchestration (owns WHEN to send)
if (user.marketingOptIn) {
  await sendWelcomeEmail({ to: user.email, name: user.name });
}

// adminInvite.ts — different business rule, same mechanic
await sendWelcomeEmail({ to: invitee.email, name: invitee.name });
```

## Mental model

```
New feature?
  → Write in action first
  → See repeated ops? → Extract to service
  → No repetition?   → Keep in action
```

Actions orchestrate domain rules. The service layer centralizes reusable operational mechanics with a composable, explicit-input API.
