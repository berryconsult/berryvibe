---
name: update
description: Updates the PRD with the latest information from the feature/task specification files. Use when the user adds '/update' to the command.
version: 1.0.0
---

# Update PRD

<prd>
"$ARGUMENTS"
</prd>

Updates the PRD with the latest information from the features specification files.

## Workflow

1. **Receive input**: User provides a directory path or list of files containing task/feature specs
2. **Read each file**: Parse the spec to extract implementation requirements, data models, edge cases, validation rules, and any existing PBT specs
3. **Update the PRD**: Update the PRD with the latest information from the feature/task specification files
