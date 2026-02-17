---
name: guide
description: >
  Generates a comprehensive, human-readable testing guide (guide.md) for new or updated features
  in a SaaS application (frontend + backend). It uses documents from the spec to produce a testing guide.
---

# Feature Testing Guide

A structured framework for producing detailed, human-friendly testing guides that tell a QA tester or team member exactly where to go, what to do, and what to expect when testing a new or updated SaaS feature.

## Philosophy

**The reader knows nothing about this feature.** Write as if the person testing has never seen the feature before. Explicit navigation paths, exact button labels, and concrete expected outcomes — never assume shared context.

**Testing is more than the happy path.** Every guide must cover success scenarios, failure scenarios, edge cases, permission boundaries, and regression risks.

**Screenshots are worth a thousand words, but precise text is worth nearly as much.** Since we can't produce screenshots, compensate with extremely specific navigation instructions and visual element descriptions.

## Discovery Process

### Phase 1: Feature Understanding (Always Start Here)

Gather foundational context before writing anything. Look through all documents related to the feature.

### Phase 2: Navigation & UI Context

Understand where the feature lives in the application:

1. **Entry Point**: How does a user reach this feature? (URL route, menu item, sidebar link, button, etc.)
2. **Full Navigation Path**: Step-by-step from login to the feature (e.g., "Login → Dashboard → Settings tab → Integrations → Add New")
3. **Pages/Screens Involved**: List every screen, modal, drawer, tab, or page that is part of this feature
4. **UI Elements**: Key buttons, forms, dropdowns, toggles, tables, cards involved
5. **Related Pages**: Any other pages that are affected by or display data from this feature

### Phase 3: Backend & Data Context

Understand the technical underpinnings:

1. **API Endpoints**: Which endpoints are involved? (routes, methods)
2. **Data Model**: What entities/records are created, updated, or deleted?
3. **Side Effects**: Does this trigger emails, notifications, webhooks, background jobs, third-party calls?
4. **Dependencies**: Does this depend on other features, services, or configurations being in place?
5. **Feature Flags**: Is this behind a feature flag or environment toggle?

### Phase 4: User Roles & Permissions

1. **Who Can Access**: Which user roles should be able to use this feature?
2. **Who Cannot Access**: Which roles should be blocked? What should they see instead?
3. **Permission Granularity**: Are there different levels of access within the feature? (view-only, edit, admin)
4. **Multi-Tenancy**: Any tenant/organization-level isolation to verify?

### Phase 5: Test Scenarios (Probe for Completeness)

After understanding the feature, probe for:

1. **Happy Path**: The ideal, expected workflow — what does success look like?
2. **Validation Rules**: Required fields, character limits, format constraints, unique constraints
3. **Edge Cases**: Empty states, maximum data, special characters, concurrent edits, slow connections
4. **Error Scenarios**: What happens on API failure, timeout, invalid data, network error?
5. **Boundary Conditions**: First-time use (no data), maximum limits, expired sessions
6. **Regression Risks**: What existing features might break? What should be retested?

### Phase 6: Environment & Prerequisites

1. **Environment**: Which environment should this be tested on? (staging, dev, QA)
2. **Test Data**: Any specific data setup required? (seed data, test accounts, specific configurations)
3. **Credentials**: Test user accounts and roles needed
4. **Browser/Device Requirements**: Any specific browser, resolution, or device requirements?
5. **Pre-conditions**: Any setup steps before testing can begin? (enable a flag, create a record, configure a setting)

## Adaptive Behavior

- If the user provides a PRD, ticket, or technical document — extract answers from it first, then ask only about gaps
- If the user is brief — probe deeper on navigation paths and edge cases, these are the most commonly underspecified
- If the user provides code (routes, components, API handlers) — infer navigation paths, endpoints, and validation rules from the code itself
- If the feature is simple — keep the guide concise, don't pad with unnecessary sections
- If the feature is complex — break the guide into numbered test suites grouped by area

## Output: guide.md

After gathering sufficient information from the spec, generate the guide as a markdown file `guide.md` in the same folder as the feature.

**Critical output rules:**
- Write the file to the working directory as `guide.md`
- Use clear, numbered steps that a person can follow sequentially
- Every step must specify WHERE (navigation) and WHAT (action) and THEN (expected result)
- Include exact routes/URLs when known
- Include exact button/link labels when known
- Use ✅ for expected successes and ❌ for expected failures/blocks

**Use the template in "$ARGUMENTS" as the structural foundation.**

### Guide Quality Checklist

Before delivering, verify the guide includes:

- [ ] Clear prerequisites and environment setup
- [ ] Login instructions with role-specific credentials
- [ ] Step-by-step navigation from login to the feature
- [ ] At least one happy-path test scenario with expected outcomes
- [ ] At least one negative/error test scenario
- [ ] Permission/role-based access verification
- [ ] Edge case scenarios (empty state, limits, special characters)
- [ ] Data persistence verification (refresh page, re-login, check database)
- [ ] Side effect verification (emails, notifications, audit logs)
- [ ] Regression check recommendations
- [ ] A "Report Issues" section explaining how to report bugs found
