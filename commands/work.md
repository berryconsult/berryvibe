---
name: work
description: Executes the task below completely.
---

<task>
"$ARGUMENTS"
</task>

Executes the task above start to finish according to the following rules:

- Read all referenced files before writing any code.
- Implement fully — no TODOs, placeholders, or partial solutions.
- Verify your work: run linters, type checks, or tests if available.
- First, write all the tests (PBT and unit tests) required to satisfy the requirements.
- Then, implement the code to satisfy the tests.
- You are only done when the task is complete and all the tests pass.
- When done, rename the task file with a `_DONE_` prefix. Ex: `01_create_user.md` -> `_DONE_01_create_user.md`.
