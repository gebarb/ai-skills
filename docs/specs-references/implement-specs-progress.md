---
description: Progress file format and validation for spec implementation
---

# Spec Implementation Progress Tracking

This file contains the progress file format and validation for the spec implementation workflow.

## Progress File Format

`.specs-progress.json` structure:

```json
{
  "repository": "user-provided",
  "lastUpdated": "2024-01-15T10:30:00Z",
  "specVersion": "1.0.0",
  "startPhase": null,
  "phases": [
    {
      "name": "Phase 0: Foundation",
      "file": "specs/phase-0-foundation.md",
      "status": "completed",
      "completedAt": "2024-01-15T09:00:00Z",
      "tasksCompleted": 8,
      "totalTasks": 8,
      "tasks": [
        {
          "description": "Create project structure",
          "category": "Setup",
          "status": "completed",
          "completedAt": "2024-01-15T09:05:00Z"
        },
        {
          "description": "Configure state management",
          "category": "Setup",
          "status": "completed",
          "completedAt": "2024-01-15T09:15:00Z"
        }
      ]
    },
    {
      "name": "Phase 1: First Feature",
      "file": "specs/phase-1-first-feature.md",
      "status": "in-progress",
      "startedAt": "2024-01-15T10:00:00Z",
      "tasksCompleted": 3,
      "totalTasks": 5,
      "tasks": [
        {
          "description": "Create data model",
          "category": "Models",
          "status": "completed",
          "completedAt": "2024-01-15T10:05:00Z"
        },
        {
          "description": "Implement UI component",
          "category": "UI",
          "status": "in-progress"
        },
        {
          "description": "Add business logic",
          "category": "Logic",
          "status": "pending"
        }
      ]
    },
    {
      "name": "Phase 2: Second Feature",
      "file": "specs/phase-2-second-feature.md",
      "status": "pending",
      "tasks": []
    }
  ]
}
```

**Start Phase Field:**
- `startPhase`: The phase number to start implementation from (null for all phases)
- When set, all phases before this number are marked as completed
- Used when user selects "Start from specific phase" option

**Task Status Values:**
- `pending`: Task not yet started
- `in-progress`: Task currently being worked on
- `completed`: Task successfully completed
- `skipped`: Task intentionally skipped (with reason)
- `failed`: Task failed (with error details)

## Progress File Schema Validation

To ensure the progress file remains valid, validate the structure:

**Validation Checklist:**
- All required fields are present (repository, lastUpdated, specVersion, phases)
- Phase status values are valid (pending, in-progress, completed, skipped)
- Task status values are valid (pending, in-progress, completed, skipped, failed)
- Timestamps follow ISO 8601 format
- Phase names are unique
- File paths reference existing phase files
- startPhase is null or a valid phase number

## Progress File Backup and Restore

To protect against data loss, implement backup and restore procedures:

**Backup Strategy:**
- Manual backup before major changes
- Keep backups for 30 days (or as per project requirements)
- Store backups in `.specs-progress-backups/` directory

**Restore Scenarios:**
1. **Corrupted progress file**: Restore from most recent backup
2. **Wrong phase marked complete**: Restore to previous state and correct
3. **Spec version mismatch**: Restore to match spec version or update progress
4. **Team sync issue**: Restore from shared backup or reconcile manually

## Phase File Format

Each phase file should follow this standardized structure:

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
