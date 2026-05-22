---
description: Guidelines and best practices for spec creation
---

# Spec Creation Guidelines

This file contains guidelines and best practices for the spec creation workflow.

## Team Usage

For team collaboration:
- Use file-based review for spec review and approval
- Assign reviewers for spec changes
- Use issue templates for spec proposals
- Define approval workflows (e.g., 2 approvals required)
- Document review decisions in change log

## Best Practices

### Phase Definition
- Keep phases focused on one screen or component
- Ensure phases are achievable in 1-3 weeks
- Make dependencies clear and minimal
- Define measurable success criteria
- Include testing requirements
- Validate phase size and complexity

### Task Breakdown
- Break tasks into granular, actionable items
- Group related tasks into categories
- Use checkboxes for tracking
- Include deliverables where appropriate
- Ensure tasks are specific and unambiguous

### Success Criteria
- Make criteria specific and measurable
- Include functional, performance, and quality criteria
- Ensure criteria can be verified
- Align with overall project goals
- Define acceptance criteria for each criterion

### Dependencies
- Minimize cross-phase dependencies
- Clearly state required prerequisites
- Consider parallel execution where possible
- Document integration points
- Validate no circular dependencies exist
- Warn about dependency chains that are too long

### Spec Maintenance
- Review specs regularly (monthly or per milestone)
- Update specs as implementation reveals new requirements
- Document all spec changes in CHANGELOG.md
- Keep specs in sync with actual implementation
- Archive deprecated specs rather than deleting

## Quality Metrics

**Spec Quality Metrics:**
- Phase completeness: % of required fields filled
- Task specificity: % of tasks that are actionable
- Success criteria measurability: % of criteria with action verbs
- Dependency complexity: average number of dependencies per phase
- Phase size appropriateness: % of phases within task count range
- Validation rule compliance: % of validation rules passed

**Quality Gates:**
- All validation rules must pass
- All required fields must be present
- Success criteria must be measurable
- Tasks must be actionable
- No circular dependencies allowed
- Phase sizes must be within recommended range

**Quality Scoring:**
Calculate overall spec quality score:
- 90-100%: Excellent - Ready for implementation
- 75-89%: Good - Minor improvements recommended
- 60-74%: Fair - Significant improvements needed
- Below 60%: Poor - Major revisions required

## Documentation Generation

**Documentation to Create:**
- Changelog tracking spec version changes, breaking changes, and phase modifications
- Progress reports summarizing spec creation status and phase organization

## Notes

- This workflow creates spec files that work with the `../../workflows/implement-specs` workflow
- Specs can be updated after creation if project requirements change
- Update specs as implementation reveals new requirements
- Use iteration mode for refinements without starting over
- Validate spec structure before implementation
- Track quality metrics to ensure spec quality

## Workflow Integration

This workflow is designed to work seamlessly with the `../../workflows/implement-specs` workflow:

**Handoff Process:**
1. Complete spec creation using this workflow
2. Ensure all validation rules pass and quality score ≥ 90%
3. Save specs to the specs/ directory
4. Run `../../workflows/implement-specs` to begin implementation
5. The implementation workflow will parse the specs and track progress

**Cross-Workflow References:**
- Spec creation: `../../workflows/create-specs` workflow
- Implementation: `../../workflows/implement-specs` workflow
- Progress tracking: `.specs-progress.json` (created by implementation workflow)

**Data Flow:**
```
../../workflows/create-specs → specs/ directory → ../../workflows/implement-specs → implementation
                    ↓
              .specs-progress.json (created during implementation)
```

**Best Practices:**
- Document spec version in README.md
- Use spec versioning to track breaking changes
- Coordinate spec updates with implementation progress
- Review implementation feedback to improve future specs
