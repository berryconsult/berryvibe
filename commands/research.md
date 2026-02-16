---
name: research
description: Conduct a deep, thorough code analysis and research session. Use when the user adds '/research' to the command.
version: 1.0.0
---

You are tasked with conducting a deep, thorough code analysis and research session. This is not a superficial code review - you must understand the code at a fundamental level, including all its complexities, edge cases, interactions, potential issues, data flows, and business logic related to the feature the user is asking about.

Your goal is to deeply understand the code related to this research. Follow these guidelines:

**Depth Requirements:**

- Read ALL relevant files completely, not just function signatures
- Trace through entire execution flows from start to finish
- Understand how different components interact with each other
- Identify all dependencies, both explicit and implicit
- Look for edge cases, error handling, and failure modes
- Understand the "why" behind implementation decisions, not just the "what"
- Identify patterns, anti-patterns, and architectural decisions
- Look for potential bugs, race conditions, or logical inconsistencies
- Understand data flows and state management
- Identify any caching layers, middleware, or cross-cutting concerns

**Analysis Process:**

1. Start by identifying all files relevant to your research focus
2. Read each file thoroughly, understanding every function and its purpose
3. Map out how components connect and communicate
4. Trace through complete user/data flows from beginning to end
5. Look for inconsistencies, duplications, or potential issues
6. Consider what could go wrong and how errors are handled
7. Identify any gaps in logic or missing error handling

**What to Document:**

- Overall architecture and how components fit together
- Detailed explanation of key functions and their responsibilities
- Complete flow diagrams (in text/markdown format) showing execution paths
- All dependencies and interactions between components
- Data structures and how data transforms through the system
- Error handling mechanisms and failure modes
- Any bugs, potential bugs, or code smells you discover
- Edge cases and how they're handled (or not handled)
- Performance considerations and bottlenecks
- Any technical debt or areas needing improvement
- Specific findings related to your research focus
- All business cases and implicit rules

**Critical:** Do not stop your research until you have:

- Read every relevant file completely
- Traced every relevant execution path
- Understood all interactions and dependencies
- Identified all potential issues related to your research focus
- Can explain the system confidently and completely

When you have completed your deep research, write a comprehensive, detailed report in a file called `research.md`. Structure your report with clear sections using markdown formatting:

- Executive Summary (high-level overview of findings)
- Architecture Overview (how the system is structured)
- Detailed Component Analysis (deep dive into each relevant component)
- Flow Analysis (complete execution flows with step-by-step breakdowns)
- Issues and Bugs Found (any problems discovered)
- Dependencies and Interactions (how components connect)
- Edge Cases and Error Handling (how the system handles unusual situations)
- Conclusions

Your report should be detailed enough that someone reading it can understand the system without looking at the code. Include code snippets where relevant to illustrate your points.

Write your complete research findings to the file `research.md`. Do not just provide a summary in chat - the full detailed report must be saved to the file.

You can create a folder in `.context/` with the feature name like `.context/feature-name/research.md` or append to a feature folder the user is referencing already with a `interview.md` file.

Begin your deep research now.
