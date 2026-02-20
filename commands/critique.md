---
name: critique
description: Critique a requirements document. Use when the user adds '/critique' to the command.
version: 1.0.0
---

# Requirements Document Critic

Systematic requirements document analysis from a senior system architect's perspective.

You should critique the requirements document based on this documentation:

<context>
"$ARGUMENTS"
</context>

## Philosophy

- **Assume competence.** Surface blind spots, not fault.
- **Every issue needs a "so what."** Explain concrete impact: "This will cause X when Y happens."
- **Prioritize ruthlessly.** Max 10 CRITICAL, max 20 HIGH. Group the rest by theme.
- **Be specific.** Quote sections, name fields, reference endpoints.

## Workflow

### 1. Structural Scan

Check for missing/incomplete sections: executive summary, data models, state machines, API spec, user flows, UI specs, authorization, error handling, success metrics. Flag missing sections as CRITICAL.

Instant red flags: "TBD"/"TODO", enums without definitions, state machines without terminal states, APIs without error responses, forms without validation rules, FKs without cascade behavior, delete ops without soft/hard clarification, time logic without timezone handling, batch ops without partial failure handling.

### 2. Deep Analysis

Read the document through each lens:

| Lens               | Key questions                                                                                                                                                     |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Data Model**     | PKs defined? Types specific (not just "string")? Constraints? FKs with cascade rules? Audit fields? Relationships with cardinality?                               |
| **State Machines** | Initial state? Terminal states? All transitions with triggers and side effects? Error/cancelled states?                                                           |
| **API Design**     | Method + route + auth + request schema + response schema + error responses for every endpoint? Pagination on lists? Consistent naming?                            |
| **Security**       | Auth on every endpoint? Ownership model (horizontal access)? Input validation server-side? Rate limiting? PII identified?                                         |
| **Error Handling** | What if: field missing, validation fails, entity not found, no permission, duplicate key, external service down, timeout, partial batch failure, concurrent edit? |
| **Concurrency**    | Optimistic locking for editable entities? Idempotency for mutations? Double-submit prevention?                                                                    |
| **Performance**    | Paginated lists? Indexed filter fields? N+1 query risks? Size limits (uploads, batches, request bodies)?                                                          |
| **Integrations**   | Timeouts? Retry policy? Fallback? Rate limit handling? Webhook idempotency?                                                                                       |

### 3. Cross-Reference

- **Contradictions:** Section A says X, Section B implies not-X
- **Orphaned references:** Mentions of entities/fields/endpoints that don't exist elsewhere
- **Terminology drift:** Same concept, different names in different places
- **API vs UI mismatch:** Feature in one but not the other

### 4. Output

Extract feature name from file path (e.g. `planning/features/auth/requirements.md` → `auth`).
Save to `planning/[feature-name]/critique.md`.

## Output Format

```markdown
# PRD Critique: [Document Name]

**Review Date:** [date]
**Reviewer:** Claude (System Architect Analysis)

## Executive Assessment

[2-3 sentences on quality and readiness]

**Overall Readiness:** Ready for Implementation | Needs Revisions | Major Gaps

**Strengths:**

- [What's well done — be specific]

**Summary:** [N] critical, [N] high, [N] medium/low issues, [N] open questions

---

## Critical Issues

### [CRIT-1] [Title]

**Location:** [Section/entity/endpoint]
**Issue:** [What's wrong or missing]
**Impact:** When [scenario], [consequence] because [reason].
**Evidence:** [Quote or describe the gap]
**Recommendation:** [Specific fix]

---

## High Priority Issues

### [HIGH-1] [Title]

**Location:** [Reference]
**Issue:** [Description]
**Impact:** [Consequence]
**Recommendation:** [Action]

---

## Medium & Low Issues

Group by theme (Data Model, API, Security, etc.) in table format:

| ID    | Issue   | Location | Recommendation |
| ----- | ------- | -------- | -------------- |
| MED-1 | [Brief] | [Ref]    | [Brief fix]    |

---

## Open Questions

1. **[Topic]:** [Question] — _Why it matters: [context]_

---

## Summary

| Category   | Count |
| ---------- | ----- |
| Critical   | N     |
| High       | N     |
| Medium/Low | N     |
| Questions  | N     |
```

## Severity Guide

| Level        | Means                                                    | Examples                                                                                               |
| ------------ | -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| **CRITICAL** | Blocks implementation or risks data loss/security breach | Missing cascade rules, no auth on endpoints, undefined PK, unreachable terminal state                  |
| **HIGH**     | Causes significant rework if found late                  | Ambiguous state transitions, missing error handling, no pagination, undefined concurrent edit behavior |
| **MEDIUM**   | Technical debt                                           | Missing indexes, inconsistent naming, no audit fields, empty states undefined                          |
| **LOW**      | Polish                                                   | Documentation clarity, optional enhancements, convention suggestions                                   |

# Output

Create a new file called `critique.md` in the same directory as the requirements document.

## Scope Calibration

Before raising any issue, ask: **"Would a reasonable team actually change this based on my feedback?"**

**Calibrate severity to feature complexity.** A CRUD form for internal use doesn't need rate limiting analysis. A public payments endpoint does. Match depth to risk.

**The 80/20 rule applies.** Raise the 20% of issues that cause 80% of real-world pain. Skip the rest.

**Suppress by default:**
- Issues that only matter at scale the product hasn't reached
- "Best practice" violations with no concrete failure scenario for this specific context
- Defensive architecture for edge cases the team can handle reactively
- Enhancements that belong in a future iteration, not the current spec

**Stop when:** All CRITICAL and HIGH issues are documented, and the remaining issues are either low-risk or low-probability. A 6-item critique that unblocks the team is better than a 40-item critique that paralyzes it.
