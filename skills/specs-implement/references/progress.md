---
description: Progress file format and validation for spec implementation
---

# Spec Implementation Progress Tracking

This file contains the progress file format and validation for the spec implementation workflow.

## Progress File Format

`.specs-progress.json` structure:

**Audit Logging:**
For compliance and debugging, the workflow maintains an audit log in the progress file:

```json
{
  "repository": "user-provided",
  "lastUpdated": "2024-01-15T10:30:00Z",
  "specVersion": "1.0.0",
  "startPhase": null,
  "auditLog": [
    {
      "timestamp": "2024-01-15T09:00:00Z",
      "action": "workflow_started",
      "details": "Workflow initiated by user"
    },
    {
      "timestamp": "2024-01-15T09:05:00Z",
      "action": "phase_started",
      "phase": "Phase 1: Foundation",
      "details": "Beginning implementation of Phase 1"
    },
    {
      "timestamp": "2024-01-15T09:30:00Z",
      "action": "checkpoint_created",
      "phase": "Phase 1: Foundation",
      "details": "Checkpoint created: phase-1-20240115-093000"
    },
    {
      "timestamp": "2024-01-15T10:00:00Z",
      "action": "phase_completed",
      "phase": "Phase 1: Foundation",
      "details": "Phase 1 completed successfully, 8/8 tasks"
    }
  ],
  "phases": []
}
```

**Audit Log Events:**
- `workflow_started`: Workflow initiated
- `workflow_completed`: All phases completed
- `phase_started`: Phase implementation began
- `phase_completed`: Phase implementation finished
- `phase_skipped`: Phase was skipped by user
- `checkpoint_created`: Checkpoint was created
- `checkpoint_restored`: Rollback to checkpoint performed
- `error_occurred`: Error encountered during execution
- `user_confirmation`: User provided confirmation at decision point
- `spec_version_changed`: Spec version detected as changed

**Audit Log Retention:**
- Keep audit log for the duration of the project
- Audit log grows with each action (typically 1-2 KB per 100 actions)
- No automatic cleanup of audit log entries
- Can be exported for compliance reporting

```json
{
  "repository": "user-provided",
  "lastUpdated": "2024-01-15T10:30:00Z",
  "specVersion": "1.0.0",
  "startPhase": null,
  "phases": [
```

**Field Descriptions:**
- `repository`: Name of the repository
- `lastUpdated`: Timestamp of last progress update (ISO 8601 format)
- `specVersion`: Current spec version from specs/README.md (updated when spec changes are detected)
- `startPhase`: Phase number to start from (null = start from beginning)
- `phases`: Array of phase objects with individual progress tracking
    {
      "name": "Phase 1: Foundation",
      "file": "specs/phase-1-foundation.md",
      "status": "completed",
      "completedAt": "2024-01-15T09:00:00Z",
      "specVersion": "1.0.0",
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
      "name": "Phase 2: First Feature",
      "file": "specs/phase-2-first-feature.md",
      "status": "in-progress",
      "startedAt": "2024-01-15T10:00:00Z",
      "specVersion": "1.0.0",
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
      "name": "Phase 3: Second Feature",
      "file": "specs/phase-3-second-feature.md",
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

**Phase-Level specVersion Field:**
- Each phase object has its own `specVersion` field
- This records the spec version that was used when implementing that specific phase
- When a phase starts, the current spec version from README is locked into this field
- This enables tracking which spec version was used for each phase implementation
- If specs are updated during implementation, the phase's locked version doesn't change
- The root-level `specVersion` field tracks the current/latest spec version in the README

**Task Status Values:**
- `pending`: Task not yet started
- `in-progress`: Task currently being worked on
- `completed`: Task successfully completed
- `skipped`: Task intentionally skipped (with reason)
- `failed`: Task failed (with error details)

## Progress File Schema Validation

To ensure the progress file remains valid, validate the structure:

**AI Execution Instructions for Validation:**

1. **Check if file exists and is valid JSON:**
   - Read the progress file
   - Verify it's valid JSON format
   - If invalid, report error and ask user to fix or restore from backup

2. **Automated Backup Before Writes:**
   - Before any write operation to `.specs-progress.json`:
     - Create backup directory if it doesn't exist: `.specs-progress-backups/`
     - Generate timestamped backup filename: `.specs-progress-backups/specs-progress-YYYYMMDD-HHMMSS.json`
     - Copy current progress file to backup location
     - Keep only the 10 most recent backups (delete older ones)
   - If backup fails:
     - Report warning but proceed with write
     - Note that backup was not created

3. **Validate Before Write:**
   - Before writing, validate the JSON structure
   - Verify all required fields are present
   - Verify all status values are valid
   - If validation fails:
     - Report error with specific validation failure details
     - Do not write the invalid data
     - Ask user how to proceed (fix data, restore from backup, or exit)

4. **Check required fields:**
   - Verify all required fields are present: repository, lastUpdated, specVersion, phases, startPhase
   - If any field is missing, report error and ask user to fix

5. **Validate phase status values:**
   - Check that all phase status values are valid: pending, in-progress, completed, skipped, failed
   - If invalid status found, report error and ask user to fix

6. **Validate task status values:**
   - Check that all task status values are valid: pending, in-progress, completed, skipped, failed
   - If invalid status found, report error and ask user to fix

7. **Validate timestamps:**
   - Check that timestamps follow ISO 8601 format
   - If invalid format found, report error and ask user to fix

8. **Validate phase names:**
   - Check that phase names are unique
   - If duplicate names found, report error and ask user to fix

9. **Validate file paths:**
   - Check that file paths reference existing phase files
   - If file doesn't exist, report error and ask user to fix

10. **Validate startPhase:**
   - Check that startPhase is null or a valid phase number
   - If invalid, report error and ask user to fix

**Validation Checklist:**
- All required fields are present (repository, lastUpdated, specVersion, phases, startPhase)
- Phase status values are valid (pending, in-progress, completed, skipped, failed)
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
