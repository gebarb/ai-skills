---
name: specs-validate
description: Validate specs through comprehensive multi-perspective review before implementation. Use this skill when the user asks to validate specs, review project plans, or check specs before implementation, mentions spec validation or quality assurance for specs, or wants to identify issues, bugs, or gaps in project specifications.
argument-hint: Provide the repository path containing the specs/ directory to validate, or specify particular concerns or areas of focus.
version: 1.0.0
compatibility: Requires repository access with specs/ directory, ability to read markdown files, and web access for Step 0 (optional but recommended)
---

# Spec Validation Workflow

This workflow performs a comprehensive validation of specs created by the `specs-create` workflow before implementation. It uses a multi-perspective review approach (applying 3 conceptual subagent perspectives sequentially) to identify issues, bugs, gaps, and provide recommendations.

**Note:** The "subagents" mentioned in this workflow are conceptual perspectives applied sequentially by the main agent, not actual parallel processes. This approach ensures comprehensive coverage from different analytical viewpoints (Technical/Architecture, Implementation Feasibility, and Completeness/Gaps).

## Prerequisites

- Repository must have a `specs/` directory
- `specs/README.md` must exist and define phase structure
- Phase files must be named `phase-*.md` (e.g., `phase-1-foundation.md`)
- Specs should be complete and ready for implementation review

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

The workflow will validate all phases in the specs directory.

## Workflow Steps

The complete workflow is organized into review phases that simulate multiple analytical perspectives:

### Initial Assessment Phase (Steps 1-3)
See `references/initial.md` for:
1. Repository Review (Required First Step)
2. Spec Structure Validation
3. Spec Completeness Check

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

For detailed validation criteria, review templates, and guidelines, see:
- **Initial Assessment**: `references/initial.md` - Steps 1-3
- **Multi-Perspective Review**: `references/review.md` - Steps 4-6
- **Synthesis**: `references/synthesis.md` - Steps 7-9
- **User Interaction**: `references/interaction.md` - Steps 10-12
- **Finalization**: `references/finalization.md` - Steps 13-14
- **Templates**: `references/templates.md` - Report templates and checklists
- **Guidelines**: `references/guidelines.md` - Validation criteria and best practices

## Integration in Development Lifecycle

This workflow is designed to run between `specs-create` and `specs-implement`:

1. `/specs-create` - Generate comprehensive specs
2. `/specs-validate` - Validate and refine specs (this workflow)
3. `/specs-implement` - Implement validated specs

This ensures that specs are thoroughly reviewed and polished before implementation begins, reducing the likelihood of rework and implementation issues.
