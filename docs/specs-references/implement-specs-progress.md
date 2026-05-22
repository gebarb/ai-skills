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

**Validation Checklist:**
- All required fields are present (repository, lastUpdated, specVersion, phases, startPhase)
- Phase status values are valid (pending, in-progress, completed, skipped, failed)
- Task status values are valid (pending, in-progress, completed, skipped, failed)
- Timestamps follow ISO 8601 format
- Phase names are unique
- File paths reference existing phase files
- startPhase is null or a valid phase number

**Automated Validation:**
Implement automated schema validation when reading or writing the progress file:
```bash
# Validate progress file structure before use
validate_progress_file() {
  local progress_file="$1"
  
  # Check if file exists and is valid JSON
  if ! jq empty "$progress_file" 2>/dev/null; then
    echo "Error: Progress file is not valid JSON"
    return 1
  fi
  
  # Check required fields
  required_fields=("repository" "lastUpdated" "specVersion" "phases" "startPhase")
  for field in "${required_fields[@]}"; do
    if ! jq -e ".has(\"$field\")" "$progress_file" > /dev/null; then
      echo "Error: Missing required field: $field"
      return 1
    fi
  done
  
  # Validate phase status values
  invalid_statuses=$(jq -r '.phases[] | select(.status != "pending" and .status != "in-progress" and .status != "completed" and .status != "skipped" and .status != "failed") | .name' "$progress_file")
  if [ -n "$invalid_statuses" ]; then
    echo "Error: Invalid phase status values found for: $invalid_statuses"
    return 1
  fi
  
  echo "Progress file validation passed"
  return 0
}

# Run validation before using progress file
if [ -f .specs-progress.json ]; then
  if ! validate_progress_file .specs-progress.json; then
    echo "Error: Progress file validation failed. Please check .specs-progress.json"
    exit 1
  fi
fi
```

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
