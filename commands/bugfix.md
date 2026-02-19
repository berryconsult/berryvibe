---
name: bugfix
description: >
  Systematic debugging and bug-fixing skill with built-in knowledge capture. Use when asked to debug,
  fix bugs, troubleshoot errors, investigate failures, diagnose issues, or resolve unexpected behavior
  in code. Triggers on: "debug this", "fix this bug", "why is this failing",
  "investigate this error", "troubleshoot", "this isn't working", "unexpected behavior", "something broke",
  "help me fix", "diagnose this issue", stack traces, error messages, or any code that produces wrong output.
---

# Bugfix

Fix the bug. Understand why. Make sure it never happens again.

## Principles

- **Understand before you fix.** No code changes until you can explain WHY it's broken.
- **Reproduce first.** If you can't trigger it, you can't verify the fix.
- **Minimal changes only.** Fix the bug, nothing else. Refactor separately.
- **Respect blast radius.** Fix in the lowest-impact file possible. Never modify core/shared/base infrastructure to fix a bug in a consumer of that infrastructure.
- **Document every fix.** The postmortem is mandatory, not optional.

## Workflow

### 1. Understand

Gather context before touching code:

- Read the full error message / stack trace carefully
- Clarify: what SHOULD happen vs what ACTUALLY happens
- Determine scope: regression? new feature? edge case?
- Check recent changes with `git log` / `git diff` if relevant

Output a brief summary:
```
🐛 Bug: [one-line description]
Expected: [what should happen]
Actual:   [what happens instead]
Error:    [key error message if any]
```

### 2. Reproduce

- Find the minimal path to trigger the bug
- Run it and confirm the bug appears
- If you can't reproduce: ask for more context, check environment, check for timing/race conditions

### 3. Diagnose

Pick the right strategy:

| Situation | Strategy |
|-----------|----------|
| "It worked before" | **Binary search** — git bisect or review recent commits |
| Logic bug | **Trace execution** — follow data flow, add logging at decision points |
| Complex / unclear | **Hypothesize & test** — form theory, test it, pivot if wrong |
| No idea | **Divide & conquer** — split system in half, narrow down |

**Usual suspects:**

| Category | Look For |
|----------|----------|
| Null/undefined | Missing null checks, optional chaining, default values |
| Async/timing | Missing await, unhandled promises, race conditions |
| Off-by-one | Loop bounds, array indices, fence-post errors |
| Type coercion | Loose equality, implicit conversions |
| State mutation | Shared refs, missing deep copies, stale closures |
| API contract | Changed response shape, outdated types, schema drift |
| Environment | Env vars, paths, permissions, dependency versions |

### 4. Fix

1. Explain the root cause in plain language FIRST
2. Apply the minimal code change
3. Add defensive measures only if they prevent this class of bug
4. Do NOT refactor alongside the fix

```
🔧 Root Cause: [one sentence]
   Fix: [what changed and why]
```

### 4.5 Scope Check (before writing any code)

Before touching any file, classify it:

| File type | Examples | Can you modify it? |
|-----------|----------|-------------------|
| **Isolated** | test files, single-use utils, leaf components | ✅ Yes |
| **Shared** | helpers used by 5+ modules, config files | ⚠️ Only if the bug lives there |
| **Core/Base** | BaseService, DB connectors, auth middleware, core types | 🚫 Only as a last resort |

**Rules:**
1. Fix at the **call site** before touching the **definition**.
2. If the bug requires modifying a core/base file, **stop and explain why** before proceeding — get explicit confirmation.
3. If you changed a shared or core file, document it prominently in the postmortem under a `⚠️ High-blast-radius change` section.

> A test file has a circular import? Fix the import in the test. Don't refactor BaseService.

### 5. Verify

- Re-run the reproduction — bug must be gone
- Run existing tests — nothing else should break
- Test nearby edge cases
- Write a regression test if applicable

### 6. Document (MANDATORY)

After every fix, save a postmortem to `.context/[feature-name]/bugfix_YYYY-MM-DD_short-description.md`.

**Template:**

```markdown
# [Short title]

**Date:** YYYY-MM-DD | **Category:** [null/undefined | async/timing | off-by-one | type coercion | state mutation | api contract | environment | logic error | config | dependency | other]
**Tags:** `tag1` `tag2` `tag3`

## Problem
[What broke and how it manifested. Include error message.]

## Root Cause
[WHY it happened. Go one level deeper than the symptom.]

## Fix
- **[file]**: [what changed and why]

## Prevention
- [ ] [Concrete action to prevent this class of bug]
- [ ] [Test, lint rule, or checklist item]

> **Rule of thumb:** [One memorable sentence to remember, e.g. "Always null-check DB results before accessing properties."]
```

## When You're Stuck

1. Read the error message again. Slowly.
2. Check the most recent change.
3. Simplify the reproduction.
4. Add logging at boundaries.
5. Check types and null/undefined.
6. Check async ordering.
7. Check the environment.
8. Rubber-duck it — explain the problem out loud.

Now go fix that shit, Padawan.
