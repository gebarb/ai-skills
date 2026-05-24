---
name: validate-specs
description: Validate specs through comprehensive multi-perspective review before implementation
---

# Spec Validation Workflow

This workflow performs a comprehensive validation of specs created by the `create-specs` workflow before implementation. It uses a multi-perspective review approach (applying 3 conceptual subagent perspectives sequentially) to identify issues, bugs, gaps, and provide recommendations.

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
/validate-specs
```

The workflow will validate all phases in the specs directory.

## Workflow Steps

The complete workflow is organized into review phases that simulate multiple analytical perspectives:

### Initial Assessment Phase (Steps 1-3)
See `docs/specs-references/validate-specs-initial.md` for:
1. Repository Review (Required First Step)
2. Spec Structure Validation
3. Spec Completeness Check

### Multi-Perspective Review Phase (Steps 4-6)
See `docs/specs-references/validate-specs-review.md` for:
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
See `docs/specs-references/validate-specs-synthesis.md` for:
7. Aggregate and Correlate Findings
8. Prioritize Issues and Recommendations
9. Generate Validation Report

### User Interaction Phase (Steps 10-12)
See `docs/specs-references/validate-specs-interaction.md` for:
10. Present Validation Report to User
11. Gather User Feedback and Decisions
12. Implement Approved Changes

### Finalization Phase (Steps 13-14)
See `docs/specs-references/validate-specs-finalization.md` for:
13. Re-validate Modified Specs
14. Generate Final Validation Summary

## Reference Materials

For detailed validation criteria, review templates, and guidelines, see:
- **Initial Assessment**: `docs/specs-references/validate-specs-initial.md` - Steps 1-3
- **Multi-Perspective Review**: `docs/specs-references/validate-specs-review.md` - Steps 4-6
- **Synthesis**: `docs/specs-references/validate-specs-synthesis.md` - Steps 7-9
- **User Interaction**: `docs/specs-references/validate-specs-interaction.md` - Steps 10-12
- **Finalization**: `docs/specs-references/validate-specs-finalization.md` - Steps 13-14
- **Templates**: `docs/specs-references/validate-specs-templates.md` - Report templates and checklists
- **Guidelines**: `docs/specs-references/validate-specs-guidelines.md` - Validation criteria and best practices

## Integration in Development Lifecycle

This workflow is designed to run between `create-specs` and `implement-specs`:

1. `/create-specs` - Generate comprehensive specs
2. `/validate-specs` - Validate and refine specs (this workflow)
3. `/implement-specs` - Implement validated specs

This ensures that specs are thoroughly reviewed and polished before implementation begins, reducing the likelihood of rework and implementation issues.
