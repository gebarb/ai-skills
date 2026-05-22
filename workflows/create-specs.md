---
description: Create comprehensive design and spec plans for a project with phases and implementation details
---

# Spec Creation Workflow

This workflow guides you through creating a comprehensive design and spec plan for your project. It generates a `specs/` directory with a README.md and individual phase files based on your project requirements.

## Prerequisites

- Clear understanding of your project's goals and features
- Basic knowledge of the technology stack you'll use
- Ideas about how to break down the project into phases

## Usage

Run this workflow from the root of your repository:

```
/create-specs
```

## Workflow Steps

### 1. Project Overview Gathering

First, gather basic project information:

**Note**: For team collaboration:
- Use pull requests for spec review and approval
- Assign reviewers for spec changes
- Use issue templates for spec proposals
- Define approval workflows (e.g., 2 approvals required)
- Document review decisions in commit messages
- Use branch protection rules for main branch

```
=== Project Overview ===

Please provide the following information:

1. Project Name:
   [Enter your project name]

2. Project Description:
   [Brief description of what this project does]

3. Target Platforms:
   [e.g., iOS, Android, Web, Desktop]

4. Primary Technology Stack:
   [e.g., Flutter, React Native, React, etc.]

5. Project Type:
   [e.g., Mobile App, Web App, Desktop App, Full Stack, etc.]

6. Key Features (list 3-5 main features):
   - Feature 1
   - Feature 2
   - Feature 3
   ...

7. Design/UX Style:
   [e.g., Minimalist, Modern, Corporate, Playful, etc.]

8. Any special requirements or constraints:
   [e.g., Offline-first, Real-time, High security, etc.]
```

### 2. Phase Organization Strategy

Choose how you want to organize your phases:

```
=== Phase Organization ===

How would you like to organize your phases?

Option A: Sequential Phases
- Phase 0: Foundation
- Phase 1: First screen/feature
- Phase 2: Second screen/feature
- ...and so on

Option B: Categorized Phases
- Foundational Specs (Phase 0 specs)
- Foundation Phases (architecture, setup)
- Core Screen Phases (main features)
- Enhanced Screen Phases (advanced features)
- Professional Tool Phases (specialized features)

Option C: Custom Organization
- Define your own categories and phase structure

Choose Option A, B, or C:
```

### 3. Phase Definition

Based on your organization choice, define your phases:

**Phase Sizing Guidance:**

**Time-Based Sizing:**
- Each phase should be completable in 1-3 weeks
- Phases should focus on one screen or component
- Avoid phases that are too large (over 3 weeks) or too small (under 3 days)
- Consider team size and availability when sizing phases
- Account for testing and review time in estimates

**Quantitative Metrics:**
- Task count: 5-15 tasks per phase (ideal range)
- Task categories: 2-4 categories per phase
- Success criteria: 3-7 criteria per phase
- Dependencies: 0-3 direct dependencies per phase
- Complexity indicators:
  - Simple: 5-8 tasks, 0-1 dependencies, familiar patterns
  - Medium: 9-12 tasks, 1-2 dependencies, some new concepts
  - Complex: 13-15 tasks, 2-3 dependencies, significant new architecture

**Sizing Checklist:**
- [ ] Phase has clear, focused scope
- [ ] Task count is within 5-15 range
- [ ] Dependencies are minimal and clear
- [ ] Success criteria are specific and measurable
- [ ] Estimated completion time is 1-3 weeks
- [ ] Phase can be completed independently (after dependencies)
- [ ] Testing requirements are defined

**Examples:**
- Well-sized: Phase with 8 tasks, 1 dependency, clear scope, 1 week estimate
- Too large: Phase with 20 tasks, 4 dependencies, broad scope, 4 week estimate
- Too small: Phase with 2 tasks, no dependencies, trivial scope, 1 day estimate

#### For Option A (Sequential):

```
=== Sequential Phase Definition ===

List your phases in order. For each phase, provide:

Phase N: [Phase Name]
- Focus: [What this phase implements]
- Scope: [Brief description of what's included]
- Dependencies: [Which phases must be completed first, if any]

Example:
Phase 0: Foundation & Project Setup
- Focus: Technical infrastructure and architecture
- Scope: Project structure, state management, storage, navigation
- Dependencies: None

Phase 1: First Screen/Feature
- Focus: Initial user-facing feature
- Scope: UI components, data models, business logic
- Dependencies: Phase 0

Continue listing all phases...
```

#### For Option B (Categorized):

```
=== Categorized Phase Definition ===

Define your categories and phases within each:

Category 1: [Category Name]
- Description: [What this category covers]
- Phases:
  - Phase N: [Phase Name] - [Brief description]
  - Phase N: [Phase Name] - [Brief description]

Category 2: [Category Name]
- Description: [What this category covers]
- Phases:
  - Phase N: [Phase Name] - [Brief description]
  - Phase N: [Phase Name] - [Brief description]

Example:
Foundational Specs (Architecture & Standards)
- Description: Core data models, validation rules, error handling
- Phases:
  - Phase 0: Feature A - Core data model definitions
  - Phase 0: Feature B - Validation rules and utilities
  - Phase 0: Feature C - Error handling strategy

Foundation Phases (Setup & Architecture)
- Description: Project setup, design system, navigation
- Phases:
  - Phase 1: Feature D - Project initialization
  - Phase 2: Feature E - Theming and components
  - Phase 3: Feature F - Platform-specific icons
  - Phase 4: Feature G - Routing setup

Continue for all categories...
```

#### For Option C (Custom):

```
=== Custom Phase Definition ===

Describe your custom organization structure:

[Your custom organization description]

Then list all phases with their details:

Phase N: [Phase Name]
- Category: [If applicable]
- Focus: [What this phase implements]
- Scope: [Brief description]
- Dependencies: [Required phases]
```

### 4. Phase Detail Gathering

For each phase, gather detailed information:

```
=== Phase Detail: [Phase Name] ===

File: phase-[N]-[slug].md

1. Overview:
   [Detailed description of what this phase implements and its purpose]

2. Context:
   [Additional context about why this phase is needed and what problems it solves]

3. Reference Material:
   [References to main specs, documentation, or external resources]

4. Implementation Tasks:
   Break down into categories. For each category, list specific tasks with checkboxes.
   
   Category 1: [Category Name]
   - [ ] Task 1
   - [ ] Task 2
   - [ ] Task 3
   
   Category 2: [Category Name]
   - [ ] Task 1
   - [ ] Task 2

5. Technical Requirements:
   - Framework/Technology
   - Key dependencies
   - Platform-specific requirements
   - Performance requirements

6. Success Criteria:
   List all criteria that must be met for this phase to be considered complete:
   - [ ] Criterion 1
   - [ ] Criterion 2
   - [ ] Criterion 3

7. Next Phase Preparation:
   [How this phase prepares for the next phase]

8. Additional Sections (optional):
   - Testing Strategy
   - Risks & Mitigations
   - Estimated Timeline
   - Notes
```

Repeat this for all phases.

**Dependency Validation:**
As you define each phase, validate dependencies (see detailed validation rules in Step 6).

### 5. README.md Generation

Generate the comprehensive README.md with:

```
=== README.md Structure ===

The README will include:

1. Overview
   - Project description
   - Phase organization approach
   - Development strategy

2. Project Structure
   - Phase organization
   - Dependencies & timeline
   - Phase dependencies (critical path)

3. Feature Matrix
   - Table showing phases, screens/components, categories, and dependencies

4. Development Strategy
   - Approach (granular, progressive, etc.)
   - Risk mitigation
   - Quality gates

5. Technology Stack Evolution
   - Dependencies for each phase/category

6. Quality Gates
   - Phase completion criteria
   - Code coverage requirements
   - Performance benchmarks

7. Resource Planning
   - Team structure
   - Skill requirements

8. Milestone Planning
   - Major milestones
   - Timeline

9. Risk Management
   - Technical risks
   - Business risks
   - Timeline risks

10. Success Metrics
    - Development metrics
    - Product metrics
    - Business metrics

11. Next Steps
    - Immediate actions
    - Long-term planning

12. Documentation Maintenance
    - Review schedule
```

### 6. Validate Spec Structure

Before generating files, validate the spec structure:

**Validation Rules:**
- Phase names must be unique across all phases
- All dependencies must reference existing phases by name
- At least one phase must be defined
- Required fields for all phases: Overview, Context, Implementation Tasks, Technical Requirements, Success Criteria
- Phase numbering must be consistent (no gaps in sequential numbering)
- No circular dependencies allowed (A depends on B, B depends on A)
- README structure must match chosen organization strategy
- Success criteria must be measurable (contain action verbs like "verify", "confirm", "ensure", "validate")
- Task descriptions must be actionable and specific
- Technical requirements must not be empty

**Dependency Validation:**
- Ensure all referenced dependencies exist
- Check for circular dependencies
- Warn if a phase has more than 3 direct dependencies (may indicate need for refactoring)
- Suggest parallel execution opportunities for phases with no dependencies
- Validate dependency chains are not excessively long (>5 phases)

If validation fails, report specific issues with:
- Issue description
- Affected phase(s)
- Severity level (error/warning/info)
- Suggested fix

Offer options:
- 'fix' to correct the issues interactively
- 'continue' to proceed with warnings
- 'exit' to stop and review manually

### 7. Spec Readiness Assessment

Before generating files, assess whether specs are ready for implementation:

**Spec Readiness Checklist:**
- [ ] All validation rules pass
- [ ] Quality score ≥ 90%
- [ ] All dependencies are satisfied
- [ ] Success criteria are measurable
- [ ] Tasks are actionable and specific
- [ ] Technical requirements are complete
- [ ] Team review completed (if applicable)
- [ ] Migration strategy documented (if breaking changes)

**Quality Score Calculation:**
- Phase completeness: 20% (all required fields filled)
- Task specificity: 20% (tasks are actionable)
- Success criteria measurability: 20% (criteria have action verbs)
- Dependency complexity: 15% (minimal dependencies, no circular deps)
- Phase size appropriateness: 15% (5-15 tasks per phase)
- Validation rule compliance: 10% (all rules pass)

**Readiness Decision:**
- If score ≥ 90%: Ready for implementation
- If score 75-89%: Minor improvements recommended before implementation
- If score < 75%: Significant improvements required before implementation

### 8. File Generation

Create the directory structure and files:

```
=== File Generation ===

Creating:
- specs/
  - README.md
  - phase-0-[slug].md
  - phase-1-[slug].md
  - phase-2-[slug].md
  - ...
```

### 9. Review and Refine

Review the generated specs:

```
=== Review ===

Please review the generated spec files:

1. Check specs/README.md for completeness
2. Review each phase-*.md file for accuracy
3. Verify phase dependencies are correct
4. Ensure success criteria are measurable
5. Check that implementation tasks are actionable
6. Validate that specs match the standardized format
7. Ensure all required sections are present

Would you like to:
- 'approve' to finalize the specs
- 'edit' to make changes to specific files
- 'iterate' to enter iteration mode for refinements
- 'regenerate' to start over with different inputs
```

**Spec Review Checklist:**

**README.md:**
- [ ] Overview section is complete and accurate
- [ ] Phase organization matches actual phase files
- [ ] Dependencies & timeline section is accurate
- [ ] Feature matrix includes all phases
- [ ] Development strategy is clearly defined
- [ ] Technology stack evolution is documented
- [ ] Quality gates are specified
- [ ] Resource planning is included (if applicable)
- [ ] Milestone planning is defined
- [ ] Risk management section is complete
- [ ] Success metrics are measurable
- [ ] Next steps are actionable
- [ ] Documentation maintenance schedule is defined

**Phase Files:**
- [ ] Phase name is descriptive and unique
- [ ] Overview clearly describes phase purpose
- [ ] Context explains why phase is needed
- [ ] Reference material is provided (if applicable)
- [ ] Implementation tasks are:
  - [ ] Grouped into logical categories
  - [ ] Specific and actionable
  - [ ] Within 5-15 tasks per phase
  - [ ] Have clear deliverables
- [ ] Technical requirements are complete
- [ ] Success criteria are:
  - [ ] Specific and measurable
  - [ ] Within 3-7 criteria per phase
  - [ ] Include action verbs
- [ ] Dependencies are accurate and minimal
- [ ] Next phase preparation is described
- [ ] Optional sections are included as needed

**Overall Structure:**
- [ ] All phase files follow standardized format
- [ ] Phase numbering is consistent
- [ ] No circular dependencies exist
- [ ] Dependency chains are not excessively long
- [ ] Phase sizes are appropriate
- [ ] All required fields are present
- [ ] Validation rules pass
- [ ] Specs are ready for implementation

### 10. Iteration Mode

If you choose 'iterate', you can refine the specs:

```
=== Iteration Mode ===

What would you like to modify?

1. Add new phase
2. Remove existing phase
3. Edit phase details
4. Reorder phases
5. Modify dependencies
6. Update README structure
7. Exit iteration mode

Select option (1-7):
```

**Iteration Tracking:**
- Each iteration creates a draft state of the spec
- Iterations are not committed until approved
- Changes are tracked in memory during iteration session
- Exit iteration mode to commit or discard changes

**Modification Details:**

**1. Add new phase:**
- Provide phase name, focus, scope, and dependencies
- Specify phase number or position in sequence
- Follow phase sizing guidelines
- Re-validate after addition

**2. Remove existing phase:**
- Select phase to remove
- Confirm impact on dependent phases
- Update or remove dependencies in other phases
- Re-validate after removal

**3. Edit phase details:**
- Select phase to edit
- Choose section to modify (overview, tasks, requirements, etc.)
- Apply changes
- Re-validate after editing

**4. Reorder phases:**
- Select phases to reorder
- Specify new order
- Update dependencies if needed
- Re-validate after reordering

**5. Modify dependencies:**
- Select phase to modify dependencies for
- Add or remove dependencies
- Validate no circular dependencies introduced
- Re-validate after modification

**6. Update README structure:**
- Modify README sections
- Update phase organization
- Update feature matrix
- Re-validate after update

**7. Exit iteration mode:**
- Show summary of all changes made
- Option to:
  - 'approve' to commit all changes
  - 'discard' to revert all changes
  - 'continue' to keep iterating

After each modification, re-validate the spec structure and show updated summary.

### 11. Finalization

Once approved, the specs are ready for implementation using the `/implement-specs` workflow.

**Save the Specs:**
- Ensure all spec files are saved in the `specs/` directory
- Verify the README.md is complete
- Confirm all phase files are present and properly formatted

## Reference Materials

For detailed templates, maintenance strategies, and guidelines, see:
- **Templates**: `.windsurf/docs/specs-references/create-specs-templates.md` - Phase file and README templates
- **Maintenance**: `.windsurf/docs/specs-references/create-specs-maintenance.md` - Migration, versioning, and import/export
- **Guidelines**: `.windsurf/docs/specs-references/create-specs-guidelines.md` - Team usage, best practices, and quality metrics
