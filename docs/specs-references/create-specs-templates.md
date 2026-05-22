---
description: Templates for spec creation workflow
---

# Spec Creation Templates

This file contains templates for the spec creation workflow.

## Phase File Template

Each phase file will follow this standardized structure (compatible with `../../workflows/implement-specs` workflow):

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

**Format Notes:**
- Use "Overview" for the main description
- Use "Context" for additional context about why the phase is needed
- Include "Deliverables" subsections under each task category
- Technical requirements should use bold labels with colons
- Success criteria must be specific and measurable
- Optional sections can be added as needed
- This format is compatible with the `../../workflows/implement-specs` workflow

## README.md Template

The README will be generated with sections appropriate to your project structure:

```markdown
# [Project Name] - Development Roadmap

## Overview
[Project description and phase organization approach]

## Project Structure

### Phase Organization
[List of phases with descriptions]

### Dependencies & Timeline
[Timeline and dependency information]

## Phase Dependencies

### Critical Path
[Dependency tree or diagram]

## Feature Matrix

| Phase | Screen/Component | Category | Dependencies |
|-------|------------------|----------|--------------|
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

### Team Structure
[Recommended team composition]

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
