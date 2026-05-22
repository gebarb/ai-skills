---
description: Templates for spec creation workflow
---

# Spec Creation Templates

This file contains templates for the spec creation workflow.

## Phase File Template

Each phase file will follow this standardized structure (compatible with `/implement-specs` workflow):

```markdown
# Phase [N]: [Phase Name]

## Overview
[Detailed description of what this phase implements and its purpose]

## Context
[Additional context about why this phase is needed and what problems it solves]

## Reference Material
[References to main specs, documentation, or external resources]

## Implementation Tasks

### 1. [Task Category]
**Tasks:**
- [ ] Specific task 1
- [ ] Specific task 2
- [ ] Specific task 3

**Deliverables:**
- Deliverable 1
- Deliverable 2

### 2. [Task Category]
**Tasks:**
- [ ] Specific task 1
- [ ] Specific task 2

**Deliverables:**
- Deliverable 1

## Technical Requirements
- **Framework**: [Technology]
- **State Management**: [Pattern]
- **Storage**: [Solution]
- **Navigation**: [Solution]
- [Additional requirements]

## Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Dependencies
List any phases that must be completed before this phase can be implemented:
- Phase 1: [Phase Name] (required for [reason])
- Phase 2: [Phase Name] (required for [reason])
- None (if this phase has no dependencies)

## Next Phase Preparation
[How this phase prepares for the next phase]

## Optional Sections
### Testing Strategy
[Testing approach and test types]

### Risks & Mitigations
- Risk: [Description]
  - Mitigation: [Strategy]

### Estimated Timeline
[Time estimate]

### Notes
[Additional context and considerations]
```

**File Naming Requirements:**
- Phase files must be named `phase-[N]-[slug].md` where:
  - `[N]` is the numeric phase number (e.g., 1, 2, 3)
  - `[slug]` is a lowercase, hyphenated description (e.g., foundation, user-auth)
  - Examples: `phase-1-foundation.md`, `phase-2-user-auth.md`
  - **NOT** valid: `phase-1a-*.md`, `phase-A-foundation.md`
- This naming pattern is required for compatibility with the `/implement-specs` workflow

**Phase Numbering for Categorized Phases:**
- For Option B (Categorized phases): Phase numbers must be globally sequential (1, 2, 3, 4...) regardless of category
- Categories group phases logically for organization, but numbering remains sequential across all phases
- Example: Category A might have phases 1-3, Category B might have phases 4-7
- The numeric prefix `[N]` in the filename must be globally unique and sequential across all phases

**Format Notes:**
- Use "Overview" for the main description
- Use "Context" for additional context about why the phase is needed
- Include "Deliverables" subsections under each task category
- Technical requirements should use bold labels with colons
- Success criteria must be specific and measurable
- Optional sections can be added as needed
- This format is compatible with the `/implement-specs` workflow

**Required for implement-specs compatibility:**
- All required sections (Overview, Context, Implementation Tasks, Technical Requirements, Success Criteria) must be present
- Phase file naming must follow the `phase-[N]-[slug].md` pattern with numeric phase number
- Success criteria should use action verbs (verify, confirm, ensure, validate) for measurability

## README.md Template

The README will be generated with sections appropriate to your project structure:

```markdown
# [Project Name] - Development Roadmap

## Overview
[Project description and phase organization approach]

**Spec Version:** [version number, e.g., 1.0.0]

## Project Structure

### Phase Organization
[List of phases with descriptions]

### Dependencies & Timeline
[Timeline and dependency information]

## Phase Dependencies

### Critical Path
[Dependency tree or diagram]

### Phase List (for implement-specs parsing)
```
Phase 1: [Phase Name] - specs/phase-1-[slug].md
Phase 2: [Phase Name] - specs/phase-2-[slug].md
Phase 3: [Phase Name] - specs/phase-3-[slug].md
...
```

### Dependency Information
For sequential phases: Dependencies are implicit (previous phases)
For categorized phases: See category sections below for explicit dependencies

## Feature Matrix

| Phase | Screen/Component | Category | Dependencies |
|-------|------------------|----------|--------------|
| Phase 1 | [Component] | [Category] | None |
| Phase 2 | [Component] | [Category] | Phase 1 |
| Phase 3 | [Component] | [Category] | Phase 1, Phase 2 |
| ... | ... | ... | ... |

## Development Strategy

### [Strategy Name]
[Description of development approach]

## Technology Stack Evolution

### [Phase Category]
[Dependencies and packages]

## Quality Gates

### Phase Completion Criteria
[Criteria for each phase category]

## Resource Planning

### Skill Requirements
[Skills needed for development]

## Milestone Planning

### Major Milestones
[Key milestones and their completion criteria]

## Risk Management

### [Risk Category]
[Risks and mitigations]

## Success Metrics

### [Metric Category]
[Metrics to track]

## Next Steps

### Immediate Actions
[Action items to start]

### Long-term Planning
[Long-term considerations]

## Documentation Maintenance

[Review and update schedule]
```
