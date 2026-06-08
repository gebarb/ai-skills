---
name: specs-validate
description: Validate specs through comprehensive multi-perspective review before implementation. Use when validating specs, reviewing project plans, or identifying issues in project specifications.
argument-hint: Provide the repository path containing the specs/ directory to validate, or specify particular concerns or areas of focus.
version: 1.1.0
license: MIT
compatibility: Requires repository access with specs/ directory, ability to read markdown files, and bash shell (version 4.0+)
---

# Spec Validation Workflow

This workflow performs a comprehensive validation of specs created by the `specs-create` workflow before implementation. It uses a multi-perspective review approach (applying 3 conceptual subagent perspectives sequentially) to identify issues, bugs, gaps, and provide recommendations.

**Note:** The "subagents" mentioned in this workflow are conceptual perspectives applied sequentially by the main agent, not actual parallel processes. This approach ensures comprehensive coverage from different analytical viewpoints (Technical/Architecture, Implementation Feasibility, and Completeness/Gaps).

## Prerequisites

- Repository must have a `specs/` directory
- `specs/README.md` must exist and define phase structure
- Phase files must be named `phase-*.md` (e.g., `phase-1-foundation.md`)
- Specs should be complete: all phases defined, success criteria specified, technical requirements documented, and acceptance criteria clear

## Platform Requirements

This workflow uses bash scripts for spec validation and analysis. The following are required:
- Bash shell (version 4.0+ recommended)
- Standard Unix tools: awk, grep, find, wc, sed
- jq (recommended for JSON parsing, fallback methods available)
- Access to the repository root directory

## Usage

Run this workflow from the root of your repository:

```
/specs-validate
```

The workflow will validate all phases in the specs directory matching the pattern `phase-*.md`.

## Workflow Steps

The complete workflow is organized into review phases that simulate multiple analytical perspectives:

### Initial Assessment Phase (Steps 1-3)
See `references/initial.md` for:
1. Repository Review (Required First Step) - **STOP if specs/ directory missing or structure invalid**
2. Spec Structure Validation - **STOP if structure validation fails**
3. Spec Completeness Check - **STOP if completeness < 70%**

### Multi-Perspective Review Phase (Steps 4-6)
See `references/review.md` for:
4. **Subagent 1**: Technical & Architecture Review
   - Analyze technology stack choices
   - Review architectural decisions
   - Identify technical inconsistencies
   - Assess scalability and performance considerations

5. **Subagent 2**: Implementation Feasibility Review
   - Evaluate task breakdown and sequencing
   - Identify dependencies and potential blockers
   - Assess time estimates and resource requirements
   - Check for missing implementation details

6. **Subagent 3**: Completeness & Gaps Review
   - Verify all requirements are addressed
   - Identify missing edge cases
   - Check for ambiguous specifications
   - Validate success criteria and acceptance criteria

**Note:** Apply each subagent perspective with fresh context (re-read specs as if for the first time).

### Synthesis Phase (Steps 7-9)
See `references/synthesis.md` for:
7. Aggregate and Correlate Findings
8. Prioritize Issues and Recommendations
9. Generate Validation Report

### User Interaction Phase (Steps 10-12)
See `references/interaction.md` for:
10. Present Validation Report to User
11. Gather User Feedback and Decisions
12. Implement Approved Changes

### Finalization Phase (Steps 13-14)
See `references/finalization.md` for:
13. Re-validate Modified Specs
14. Generate Final Validation Summary

## Reference Materials

**Read these files during execution:**
- Before Step 1: `references/initial.md` - Initial Assessment guidance
- Before Step 4: `references/review.md` - Multi-Perspective Review guidance
- Before Step 7: `references/synthesis.md` - Synthesis guidance
- Before Step 10: `references/interaction.md` - User Interaction guidance
- Before Step 13: `references/finalization.md` - Finalization guidance

**Reference for templates and criteria:**
- `references/templates.md` - Report templates and checklists
- `references/guidelines.md` - Validation criteria and best practices

## Integration in Development Lifecycle

This workflow is designed to run between `specs-create` and `specs-implement`:

1. `/specs-create` - Generate comprehensive specs
2. `/specs-validate` - Validate and refine specs (this workflow)
3. `/specs-implement` - Implement validated specs

This ensures that specs are thoroughly reviewed and polished before implementation begins, reducing the likelihood of rework and implementation issues.

## Success Criteria

Validation is successful when:
- All structural checks pass (specs/ directory exists, README.md present, phase files follow naming convention)
- Completeness score ≥ 80%
- No critical (P0) issues found
- High priority (P1) issues ≤ 3
- Dependencies are validated and acyclic
- Success criteria and acceptance criteria are defined for all phases

## Error Handling

If validation fails at any step:

**Missing specs/ directory:**
- Error: "specs/ directory not found. Please run /specs-create first to generate specs."
- Action: Stop workflow and recommend specs-create

**Invalid structure:**
- Error: "Spec structure validation failed. [Specific issue]"
- Action: Fix structure issues and re-run validation

**Completeness < 70%:**
- Error: "Spec completeness is [X]%, below 70% threshold. Major gaps identified."
- Action: Return to specs-create to address gaps, or manually add missing elements

**Critical issues found:**
- Error: "[X] critical issues found that must be fixed before implementation."
- Action: Address critical issues before proceeding to implementation

**Missing reference files:**
- Error: "Reference file [filename] not found."
- Action: Ensure all reference files exist in references/ directory

## Troubleshooting

**Common Issues:**

**Validation takes too long:**
- For large specs, consider validating specific phases only
- Use the argument-hint to specify areas of focus

**Phase files not detected:**
- Ensure phase files follow pattern `phase-*.md`
- Check that files are in the specs/ directory

**Completeness score seems incorrect:**
- Review the completeness criteria in references/initial.md
- Manually verify required elements are present

**Bash tools unavailable:**
- The workflow requires bash, awk, grep, find, wc, sed
- If on Windows, use WSL or Git Bash
- jq is recommended but fallback methods are available

**Reference files confusing:**
- Start with guidelines.md for overview
- Use templates.md for report structure
- Each reference file corresponds to a specific phase

## Edge Cases

**Empty specs/ directory:**
- Treat as validation failure
- Recommend running specs-create first

**Malformed phase files:**
- Report specific formatting issues
- Provide guidance on correct format

**Circular dependencies:**
- Flag as critical issue
- Require resolution before implementation

**Missing success criteria in phases:**
- Flag as high priority issue
- Require addition before implementation

**Partial phase completion:**
- Validate only completed phases
- Note incomplete phases in report

## Example Validation Report Output

```
=== Spec Validation Complete ===

📊 Executive Summary
-------------------
Overall Health Score: 85%
Critical Issues: 0
High Priority: 2
Medium Priority: 4
Low Priority: 3

Recommendation: GO WITH CONDITIONS

🚨 Critical Issues (Must Fix)
------------------------------
None

⚠️  High Priority Issues (Should Fix)
-------------------------------------
1. Missing success criteria in Phase 2
   - Impact: Cannot validate completion
   - Recommended Fix: Add success criteria to Phase 2

2. Technology stack not specified
   - Impact: Implementation ambiguity
   - Recommended Fix: Document technology choices in README

📋 Recommendations
------------------
1. Add success criteria to Phase 2 before implementation
2. Document technology stack in specs/README.md
3. Consider adding edge case handling for error scenarios

🚀 Next Steps
-------------
Address high priority issues, then proceed to /specs-implement
```
