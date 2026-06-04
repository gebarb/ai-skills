---
name: specs-implement
description: Implement specs and phases from a repository with progress tracking and user confirmation
---

# Spec Implementation Workflow

This workflow executes the implementation of specs and phases defined in a repository's `specs/` directory. It tracks progress, requires user confirmation between phases, and allows resuming from where left off.

## Prerequisites

- Repository must have a `specs/` directory
- `specs/README.md` must exist and define phase structure
- Phase files must be named `phase-*.md` (e.g., `phase-1-foundation.md`)
- Each phase file should contain implementation tasks, technical requirements, and success criteria

## Platform Requirements

This workflow uses bash scripts for dependency validation and progress tracking. The following are required:
- Bash shell (version 4.0+ required for circular dependency check)
- Standard Unix tools: awk, grep, find, wc, sed
- jq (recommended for JSON parsing, fallback methods available)
- Git (recommended for checkpoint creation, fallback to copy available)
- Access to the repository root directory

For systems without bash 4.0+ or with different shells (e.g., sh, dash), the circular dependency check may fail. Consider upgrading bash or using an alternative dependency validation method.

## Usage

Run this workflow from the root of your repository:

```
/specs-implement
```

Optional: Start from a specific phase:

```
/specs-implement --from-phase 3
```

## Workflow Steps

The complete workflow is split into two phases to keep each document under 500 lines:

**Important**: All steps below are performed for EACH phase being implemented. The workflow loops through phases until all are complete.

**Note**: Technology stack selection (language, frameworks, architecture, etc.) is handled in the specs-create workflow. This implementation workflow uses the technology decisions documented in the specs.

### Preparation Phase (Steps 1-9)
See `{{DOCS_DIR}}/specs-implement/setup.md` for:
1. **Check for Existing Progress State** - Determine if this is a fresh start or a resume operation from a previous checkpoint
2. **Repository Review** - Deep review of all code, configuration, and other files in the codebase to understand how it works, its intent, and how to work in it. This is performed for each phase since the codebase state changes after implementation.
3. Initialize Progress Tracking and Phase Selection
4. Validate Spec Structure
5. Parse Specs Structure
6. Resolve Dependencies
7. Determine Next Phase
8. **Display Phase Overview** - Build and present a summary and plan of action for the upcoming phase implementation
9. **Request User Confirmation** - Present the summary and plan to the user for confirmation before proceeding

### Implementation Phase (Steps 10-19)
See `{{DOCS_DIR}}/specs-implement/implementation.md` for:
10. Create Implementation Checkpoint
11. Implement Phase
12. Run Code Quality Checks
13. Execute Tests
14. Verify Implementation
15. Request Code Review
16. Update Progress
17. Save Code (User Action)
18. Clean Up Checkpoint
19. Continue to Next Phase

## Reference Materials

For detailed progress tracking, error handling, and guidelines, see:
- **Setup Phase**: `{{DOCS_DIR}}/specs-implement/setup.md` - Steps 1-9
- **Implementation Phase**: `{{DOCS_DIR}}/specs-implement/implementation.md` - Steps 10-19
- **Progress Tracking**: `{{DOCS_DIR}}/specs-implement/progress.md` - Progress file format and validation
- **Error Handling**: `{{DOCS_DIR}}/specs-implement/handling.md` - Error handling, rollback, and spec updates
