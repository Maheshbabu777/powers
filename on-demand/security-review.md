---
name: security-review
description: Use when the user asks for a security review, or when the change clearly touches auth, payments, secrets, sensitive data, or public API surface.
---

# Security Review

This skill is **on-demand**. Do not load it for every task. Load it when:
- The user explicitly asks for a security review
- The change touches auth, authorization, sessions, secrets, payments, or sensitive data
- The user says "harden", "review security", or similar

## Checklist

### Authentication & Authorization
- [ ] Are auth checks present on every protected route/endpoint?
- [ ] Is authorization checked (not just authentication) — does the user have the right *role/permission*?
- [ ] Are auth tokens validated server-side, not just client-side?
- [ ] Are session tokens rotated on privilege change (login, role change)?
- [ ] Is there protection against session fixation?

### Input Handling
- [ ] Are all user inputs validated and sanitized server-side?
- [ ] Is there protection against SQL injection, NoSQL injection?
- [ ] Is there protection against XSS (stored, reflected, DOM-based)?
- [ ] Is there CSRF protection on state-changing requests?
- [ ] Are file uploads validated (type, size, content)?
- [ ] Are redirects validated against an allowlist?

### Secrets & Configuration
- [ ] Are secrets stored in environment variables or a secrets manager, never in code?
- [ ] Are API keys, tokens, and credentials excluded from version control?
- [ ] Are default credentials changed?
- [ ] Is debug mode disabled in production?

### Data Exposure
- [ ] Are API responses minimal — no extra fields leaked?
- [ ] Are error messages generic to users, detailed only in logs?
- [ ] Are sensitive fields (passwords, tokens, PII) excluded from logs?
- [ ] Is data encrypted in transit (HTTPS) and at rest where required?
- [ ] Are database queries scoped to prevent unauthorized data access?

### Common Web/API Issues
- [ ] Are rate limits in place for auth endpoints and public APIs?
- [ ] Are CORS origins restricted to known domains?
- [ ] Are security headers set (CSP, X-Frame-Options, etc.)?
- [ ] Are dependencies checked for known vulnerabilities?
- [ ] Is there protection against mass assignment / over-posting?

### AI/LLM-Specific (when applicable)
- [ ] Are prompts sanitized to prevent injection?
- [ ] Is tool/function calling scoped to authorized actions?
- [ ] Are model outputs validated before use in downstream systems?
- [ ] Are retrieval sources access-controlled?

## Severity Guide

| Severity | Meaning | Action |
|---|---|---|
| Critical | Exploitable now, high impact | Blocks release. Fix immediately. |
| High | Exploitable with effort, significant impact | Blocks release by default. Human can override with record. |
| Medium | Limited exploitability or impact | Fix before release when practical. |
| Low | Minor, defense-in-depth | Track and fix when convenient. |

## When to escalate

- You find a critical or high severity issue → stop and report
- You're unsure whether something is a real vulnerability → report it with your uncertainty, don't dismiss it
- The fix requires architectural changes → stop, document, and ask for direction
- You find evidence of an active compromise → stop everything and report immediately

## Output

For each finding, use the finding template in `templates/finding.md`.
