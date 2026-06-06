---
description: Automatic code review for spec implementation - Step 16
---

# Spec Implementation - Automatic Code Review

This file contains detailed instructions for performing automatic code review (Step 16) of the spec implementation workflow.

**Table of Contents:**
- [Code Review Process](#code-review-process)
- [Code Quality Analysis](#code-quality-analysis)
- [Spec Compliance Check](#spec-compliance-check)
- [Security Review](#security-review)
- [Performance Review](#performance-review)
- [Documentation Review](#documentation-review)
- [Review Report Generation](#review-report-generation)

## Code Review Process

Perform a comprehensive automatic code review of the implemented code:

**AI Execution Instructions:**

1. **Read the phase file** to understand what was supposed to be implemented
2. **Identify all modified and created files** from the implementation
3. **For each file, perform the following detailed checks:**

## Code Quality Analysis

- Read each modified/created file completely
- Analyze function/method length:
  - Count lines per function/method
  - Flag functions >50 lines as major issues
  - Flag functions >100 lines as critical issues
- Analyze nesting depth:
  - Count indentation levels in conditional/loop blocks
  - Flag nesting >3 levels as major issues
  - Flag nesting >5 levels as critical issues
- Detect duplicate code:
  - Look for repeated code patterns >5 lines
  - Flag as major issue if duplication found
  - Suggest extraction to functions/constants
- Check error handling:
  - Verify all async operations have try/catch or error callbacks
  - Verify all file operations have error handling
  - Verify all network requests have error handling
  - Flag missing error handling as critical issues
- Check naming conventions:
  - Verify variable names follow project conventions (camelCase, snake_case, etc.)
  - Verify function names are descriptive (not single letters except for loop variables)
  - Verify class names follow PascalCase convention
  - Flag unclear names as minor issues
- Check comments:
  - Verify complex logic (>10 lines) has explanatory comments
  - Verify non-obvious algorithms have documentation
  - Flag missing comments as minor issues

## Spec Compliance Check

- Read the phase file's "Implementation Tasks" section
- Parse each task and create a checklist
- For each task:
  - Search the implementation for evidence of completion
  - Verify the implementation matches the task description
  - Mark task as complete or incomplete with notes
- Read "Technical Requirements" section
- For each requirement:
  - Verify the implementation satisfies the requirement
  - Check for required frameworks, libraries, or patterns
  - Mark requirement as met or not met
- Read "Success Criteria" section
- For each criterion:
  - Determine how to verify it (code inspection, test, manual check)
  - Perform the verification
  - Mark criterion as satisfied or not satisfied
- Calculate compliance percentage:
  - Tasks completed: X/Y
  - Requirements met: X/Y
  - Criteria satisfied: X/Y

## Security Review

- Scan for hardcoded secrets:
  - Search for patterns like: `API_KEY = "..."`, `password = "..."`, `secret = "..."`
  - Search for common secret names: api_key, secret, password, token, private_key
  - Flag any hardcoded secrets as critical issues
- Check SQL injection vulnerabilities:
  - Look for string concatenation in SQL queries
  - Look for direct variable interpolation in SQL
  - Flag as critical issue if found
  - Suggest parameterized queries
- Check XSS vulnerabilities:
  - Look for direct HTML rendering of user input
  - Look for `innerHTML` or `dangerouslySetInnerHTML` with user data
  - Flag as critical issue if found
  - Suggest sanitization/escaping
- Check input validation:
  - Verify all user inputs are validated
  - Verify all API parameters are validated
  - Flag missing validation as major issues
- Check data handling:
  - Look for logging of sensitive data (passwords, tokens, PII)
  - Look for console.log of sensitive information
  - Flag as critical issue if found
- Check authentication/authorization:
  - Verify protected routes have authentication checks
  - Verify sensitive operations have authorization checks
  - Flag missing checks as critical issues

## Performance Review

- Analyze loops:
  - Look for nested loops (O(n²) or worse)
  - Check if nested loops can be optimized
  - Flag as major issue if optimization is possible
- Check data structures:
  - Look for inefficient data structure usage (e.g., array for lookups)
  - Suggest more appropriate structures (Set, Map, etc.)
  - Flag as minor issue
- Check database queries:
  - Look for N+1 query patterns
  - Look for queries in loops
  - Flag as major issue if found
  - Suggest batching or eager loading
- Check object passing:
  - Look for large objects passed by value
  - Suggest passing by reference
  - Flag as minor issue
- Check caching:
  - Look for repeated expensive operations
  - Suggest caching if appropriate
  - Flag as minor issue

## Documentation Review

- Check function/method documentation:
  - Verify all public functions have docstrings/comments
  - Verify docstrings include: purpose, parameters, return value
  - Flag missing documentation as minor issues
- Check comment accuracy:
  - Verify comments match the code
  - Flag outdated comments as minor issues
- Check API documentation:
  - Verify public APIs have usage examples
  - Verify API contracts are documented
  - Flag missing API docs as major issues
- Check algorithm documentation:
  - Verify complex algorithms have explanations
  - Verify non-obvious logic has comments
  - Flag missing explanations as minor issues

## Review Report Generation

Generate a review report with:
- Overall quality score (0-100%)
- List of critical issues (must fix)
- List of major issues (should fix)
- List of minor issues (nice to fix)
- Specific file paths and line numbers for each issue
- Approval status: APPROVED, APPROVED WITH CHANGES, or NEEDS REVISION

**Quality Score Calculation:**
- Start with 100%
- Subtract 10% for each critical issue
- Subtract 5% for each major issue
- Subtract 2% for each minor issue
- Minimum score: 0%

**Approval Criteria:**
- APPROVED: Score ≥ 90% and no critical issues
- APPROVED WITH CHANGES: Score 70-89% or 1-2 critical issues
- NEEDS REVISION: Score < 70% or >2 critical issues

**Review Report Format:**
```
=== Code Review Report ===

Overall Quality Score: [X]%
Status: [APPROVED / APPROVED WITH CHANGES / NEEDS REVISION]

Critical Issues: [N]
Major Issues: [N]
Minor Issues: [N]

Critical Issues:
- [file:line] Issue description
- [file:line] Issue description

Major Issues:
- [file:line] Issue description
- [file:line] Issue description

Minor Issues:
- [file:line] Issue description
- [file:line] Issue description

Spec Compliance:
- Tasks completed: [X]/[Y]
- Technical requirements met: [X]/[Y]
- Success criteria satisfied: [X]/[Y]

Recommended Actions:
- [ ] Fix critical issue 1
- [ ] Address major issue 2
- [ ] Consider minor issue 3

Proceed with implementation?
- Type 'approve' to accept and continue
- Type 'fix' to address issues before proceeding
- Type 'retry' to re-implement this phase
```

**Code Review Report Example:**
```
=== Code Review Report ===

Overall Quality Score: 85%
Status: APPROVED WITH CHANGES

Critical Issues: 0
Major Issues: 2
Minor Issues: 3

Major Issues:
- src/auth/UserAuth.tsx:45 - Function too long (65 lines, max 50 recommended)
- src/models/Task.ts:23 - Missing error handling for null values

Minor Issues:
- src/auth/UserAuth.tsx:12 - Unused import 'useEffect'
- src/models/Task.ts:67 - Missing JSDoc comment for public method
- src/services/api.ts:34 - Inconsistent naming convention (camelCase vs snake_case)

Spec Compliance:
- Tasks completed: 8/8
- Technical requirements met: 5/5
- Success criteria satisfied: 4/4

Recommended Actions:
- [ ] Refactor UserAuth.tsx:45 into smaller functions
- [ ] Add null check in Task.ts:23
- [ ] Remove unused import in UserAuth.tsx:12
- [ ] Add JSDoc comment for Task.ts:67
- [ ] Standardize naming in api.ts:34

Proceed with implementation?
- Type 'approve' to accept and continue (minor issues can be addressed later)
- Type 'fix' to address issues before proceeding
- Type 'retry' to re-implement this phase
```

**User Response Handling:**

**If user selects 'approve':**
- Mark review as complete
- Proceed to documentation generation
- Note any approved-with-changes items for future reference

**If user selects 'fix':**
- Implement the recommended fixes
- Re-run code quality checks
- Re-generate review report
- Ask for approval again

**If user selects 'retry':**
- Roll back to checkpoint
- Re-implement the phase with review feedback in mind
