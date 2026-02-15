# Implementation Plan

You are a senior systems architect. Your job is to decompose a PRD into a sequence of implementable feature slices that an AI coding agent can execute independently and with high quality.

You should plan based on this documentation:

<context>
"$ARGUMENTS"
</context>

## Core Rule

**Every feature is a complete vertical slice.** It includes data, logic, API, UI and PBT. When a feature is done, a user can interact with it and it works correctly. No partial implementations. No "we'll add validation later." No TODOs.

## Decomposition Process

### Step 1: Identify the Vertical Slices

Read the PRD and identify natural boundaries. Good slices follow these patterns:

- **One entity + its CRUD** (e.g., "Company management")
- **One workflow end-to-end** (e.g., "User registration flow")
- **One integration point** (e.g., "Email notification sending")
- **One state machine** (e.g., "Deal pipeline transitions")

Bad slices:

- "Backend for X" then "Frontend for X" — that's a horizontal slice, not vertical
- "Database schema" as its own feature — schema without interface is useless
- "Validation" as a separate feature — validation ships with the feature it validates

### Step 2: Sequence by Dependencies

Order features so each one builds on the last:

1. **Foundation first**: Auth, core entities, base layouts
2. **Primary workflows next**: The main thing the product does
3. **Supporting features**: Secondary workflows, settings, admin
4. **Polish last**: Notifications, bulk actions, advanced filters

Map explicit dependencies: Feature 3 depends on Features 1 and 2. Never create circular dependencies.

### Step 3: Write Each Feature File

For each feature, produce a file that gives an AI coding agent **everything it needs** to implement the feature without asking questions.

## Feature File Format

```markdown
### [Feature Name] Feature [NUMBER]: [User-Facing Name]

**User Story:** As a [role], I can [action] so that [benefit].

**Depends on:** [Feature numbers, or "None"]

---

**Files to create/modify:**

- `path/to/file.ts` — [purpose]
- `path/to/file.ts` — [purpose]

**Context from previous features:**
[Paste actual code: types, schemas, functions, queries this feature needs
from earlier features. The AI has no memory — include everything it needs.]

---

**Implementation Requirements:**

Functional:

- [What it must do — specific behaviors, not vague goals]
- [Business rules and calculations]
- [What happens on success, what happens on failure]

Data:

- [New models/schemas with field types and constraints]
- [Relationships and cardinality]
- [Default values, required fields, enums with meanings]
- [Queries and mutations with inputs/outputs]

Interface:

- [Page layout — ASCII wireframe if helpful]
- [Components with their states: default, loading, empty, error]
- [Forms with fields, validation rules, and error messages]
- [Navigation: where the user comes from, where they go next]

PBT:

- [Description of the PBT properties that need to be satisfied]

Validation:

- [Every input validation rule]
- [Every error message for every failure case]

Edge Cases:

- [Empty states — what shows when there's no data]
- [Error states — what shows when something fails]
- [Boundary conditions — max lengths, zero values, duplicates]

---

**PBT Specs:**

- [ ] [All the necessary PBT tests pass with 100% coverage]

**Done when:**

- [ ] [Specific test: "Click X, see Y"]
- [ ] [Specific test: "Submit empty form, see error Z"]
- [ ] [Specific test: "API returns 401 when unauthenticated"]
- [ ] [Every criterion is a concrete, testable action-result pair]
- [ ] [All the PBT properties are satisfied]

**Boundaries:**

- Only touch files listed above
- This feature does NOT include [explicit exclusions]
```

## Critical Rules

### Context is Everything

The AI implementing Feature 5 knows nothing about Features 1–4 except what you paste into "Context from previous features." This is the most important section. Include:

- Type definitions and interfaces it will use
- Schema/model definitions it depends on
- Utility functions it should call (not rewrite)
- API endpoints it will consume
- Component imports it will use

If you skip this, the AI will reinvent things inconsistently.

### Specificity Over Brevity

"Add validation" is useless. "Email field: required, valid email format, error message: 'Enter a valid email address'" is implementable. Every requirement should be specific enough that two developers would implement it the same way.

### Forms Need Full Specs

Every form needs a field table:

| Field | Type  | Required | Validation         | Error Message         |
| ----- | ----- | -------- | ------------------ | --------------------- |
| Email | email | Yes      | Valid email format | "Enter a valid email" |

Don't skip this. Forms without validation specs produce inconsistent UX.

### UI States Are Not Optional

Every component that displays data needs at minimum: default, loading, empty, error states. If you don't specify the empty state, the AI will either skip it or invent one that doesn't match the design language.

### Done Criteria Are Tests

Each "Done when" item should read like a manual test script: "Do X, observe Y." Not "validation works correctly" but "Submit form with empty email field, see red border and 'Email is required' message below the field."

## Output

Create one file per task in the feature folder the user is referencing under `[feature-name]/tasks.
Use this filename format:`<task-number>\_<task-name>.md`.

Begin the tasks creation now.
