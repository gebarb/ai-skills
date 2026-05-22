---
description: Guidelines and best practices for spec creation
---

# Spec Creation Guidelines

This file contains guidelines and best practices for the spec creation workflow.

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
- Document integration points
- Validate no circular dependencies exist
- Warn about dependency chains that are too long

### Spec Maintenance
- Review specs regularly (monthly or per milestone)
- Update specs as implementation reveals new requirements
- Document all spec changes in CHANGELOG.md
- Keep specs in sync with actual implementation
- Archive deprecated specs rather than deleting

**Unified Documentation Maintenance Strategy:**
Both create-specs and implement-specs workflows should follow a coordinated documentation maintenance approach:

- **Review Schedule**: Review all documentation (specs, phase files, README, CHANGELOG) monthly or at each major milestone
- **Update Coordination**: When updating specs during implementation, coordinate changes with the progress file to maintain consistency
- **Version Alignment**: Ensure spec versions in README, CHANGELOG, and progress file remain aligned
- **Change Documentation**: Document all changes in the appropriate location (CHANGELOG for spec changes, progress file for implementation changes)
- **Cross-Workflow Updates**: When documentation is updated in one workflow, ensure related documentation in the other workflow is updated accordingly
- **Archive Strategy**: When specs or phases are deprecated, archive them with clear documentation rather than deleting

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

- This workflow creates spec files that work with the `/implement-specs` workflow
- Specs can be updated after creation if project requirements change
- Update specs as implementation reveals new requirements
- Use iteration mode for refinements without starting over
- Validate spec structure before implementation
- Track quality metrics to ensure spec quality

## Integration Testing

After creating specs with `/create-specs`, validate they will work correctly with `/implement-specs`:

**Pre-Implementation Validation Checklist:**
- [ ] Run `/create-specs` workflow to generate specs
- [ ] Verify specs/ directory exists with README.md and phase files
- [ ] Validate all phase files follow the standardized format
- [ ] Check that README.md includes "Phase List" section or Feature Matrix table
- [ ] Verify phase file naming follows `phase-[N]-[slug].md` pattern
- [ ] Ensure dependencies are documented in both phase files and README
- [ ] Run quality score calculation and verify score ≥ 90%
- [ ] Test README parsing by manually extracting phase information
- [ ] Verify no circular dependencies exist in dependency graph
- [ ] Confirm all required sections are present in phase files

**Integration Test Steps:**
1. Create a test spec set using the workflow
2. Run the implement-specs workflow in validation mode (without actual implementation)
3. Verify that phases are parsed correctly from the README
4. Check that dependency resolution works as expected
5. Confirm that progress file initialization succeeds
6. Validate that spec version detection works correctly

**Common Integration Issues:**
- README format doesn't match expected parsing pattern
- Phase file naming doesn't follow required pattern
- Dependencies are not properly documented in README Feature Matrix
- Phase names in dependencies don't match actual phase file titles
- Missing required sections in phase files
- Circular dependencies in phase structure

## Example Workflow Walkthrough

### Complete Example: Creating and Implementing a Simple Web Application

**Step 1: Run create-specs workflow**
```
/create-specs
```

**Step 2: Repository Review**
- Review existing codebase (if any)
- Identify technologies, patterns, and conventions
- Understand project structure

**Step 3: Technology Selection (for new codebase)**
```
=== Technology Stack Selection ===

Since this is a new codebase, please select the following:

1. Programming Language: TypeScript
2. Framework(s): React, Express
3. Database Technology: PostgreSQL
4. Authentication/Authorization Approach: JWT
5. Testing Framework: Jest
6. Deployment Strategy: Docker
7. Other Relevant Technologies: Redux
8. Architectural Decisions: REST API, Monolithic
```

**Step 4: Project Overview**
```
=== Project Overview ===

1. Project Name: Task Management App
2. Project Description: A simple web application for managing tasks
3. Target Platforms: Web
4. Primary Technology Stack: React, Express, PostgreSQL
5. Project Type: Full Stack Web App
6. Key Features:
   - User authentication
   - Task creation and management
   - Task categorization
7. Design/UX Style: Modern, Minimalist
8. Special requirements: Real-time updates
```

**Step 5: Phase Organization**
```
=== Phase Organization ===

How would you like to organize your phases?

Option A: Sequential Phases
Choose Option A
```

**Step 6: Phase Definition**
```
=== Sequential Phase Definition ===

Phase 1: Foundation & Project Setup
- Focus: Technical infrastructure and architecture
- Scope: Project structure, state management, storage, navigation
- Dependencies: None

Phase 2: User Authentication
- Focus: User login and registration
- Scope: Authentication system, JWT tokens, user management
- Dependencies: Phase 1

Phase 3: Task Management Core
- Focus: Task CRUD operations
- Scope: Task models, API endpoints, UI components
- Dependencies: Phase 1, Phase 2

Phase 4: Task Categorization
- Focus: Task categories and filtering
- Scope: Category models, filtering logic, UI enhancements
- Dependencies: Phase 3
```

**Step 7: Phase Detail Gathering**
For each phase, provide detailed information including:
- Overview
- Context
- Implementation Tasks (grouped by category)
- Technical Requirements
- Success Criteria

**Step 8: README Generation**
Workflow generates specs/README.md with:
- Project overview
- Phase organization
- Feature Matrix
- Dependencies
- Technology stack
- Quality gates

**Step 9: Validation**
- Validate phase names are unique
- Validate dependencies reference existing phases
- Check no circular dependencies
- Verify required fields are present
- Calculate quality score (target: ≥90%)

**Step 10: File Generation**
Workflow creates:
- specs/README.md
- specs/CHANGELOG.md
- specs/phase-1-foundation.md
- specs/phase-2-authentication.md
- specs/phase-3-task-management.md
- specs/phase-4-categorization.md

**Step 11: Review and Approve**
Review generated specs and approve.

**Step 12: Run implement-specs workflow**
```
/implement-specs
```

**Step 13: Repository Review**
Review codebase to understand current state.

**Step 14: Validate Spec Structure**
- Check specs/ directory exists
- Verify README.md is present
- Validate phase files exist
- Calculate quality score (should match create-specs score)

**Step 15: Parse Specs**
Parse README.md to extract phase structure and dependencies.

**Step 16: Resolve Dependencies**
- Identify phases with satisfied dependencies
- Phase 1 has no dependencies → ready to implement
- Phase 2 depends on Phase 1 → wait
- Phase 3 depends on Phase 1, Phase 2 → wait
- Phase 4 depends on Phase 3 → wait

**Step 17: Select Phase**
Select Phase 1: Foundation & Project Setup

**Step 18: Create Checkpoint**
Create checkpoint backup before implementation.

**Step 19: Implement Phase**
- Analyze phase file
- Generate code following project patterns
- Implement tasks systematically:
  - Create project structure
  - Configure state management (Redux)
  - Set up database (PostgreSQL)
  - Configure routing

**Step 20: Code Quality Checks**
- Run linter (ESLint)
- Check formatting (Prettier)
- Verify type safety (TypeScript)

**Step 21: Execute Tests**
- Run unit tests with Jest
- Verify test coverage ≥80%

**Step 22: Verify Success Criteria**
- [ ] Project structure created
- [ ] State management configured
- [ ] Database connection established
- [ ] Routing configured

**Step 23: Code Review**
User reviews implementation and approves.

**Step 24: Update Progress**
Mark Phase 1 as completed in .specs-progress.json

**Step 25: Save Code**
User commits changes to repository.

**Step 26: Continue to Next Phase**
Repeat Steps 17-25 for Phase 2, then Phase 3, then Phase 4.

**Step 27: Completion**
All phases complete. Workflow reports success.

**Total Timeline**: Approximately 4-8 weeks (1-3 weeks per phase)

## Workflow Integration

This workflow is designed to work seamlessly with the `/implement-specs` workflow:

**Handoff Process:**
1. Complete spec creation using this workflow
2. Ensure all validation rules pass and quality score ≥ 90%
3. Save specs to the specs/ directory
4. Run `/implement-specs` to begin implementation
5. The implementation workflow will parse the specs and track progress

**Cross-Workflow References:**
- Spec creation: `/create-specs` workflow
- Implementation: `/implement-specs` workflow
- Progress tracking: `.specs-progress.json` (created by implementation workflow)

**Data Flow:**
```
/create-specs → specs/ directory → /implement-specs → implementation
                    ↓
              .specs-progress.json (created during implementation)
```

**Best Practices:**
- Document spec version in README.md
- Use spec versioning to track breaking changes
- Coordinate spec updates with implementation progress
- Review implementation feedback to improve future specs
