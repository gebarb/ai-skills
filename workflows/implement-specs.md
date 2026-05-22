---
name: implement-specs
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
/implement-specs
```

Optional: Start from a specific phase:

```
/implement-specs --from-phase 3
```

## Workflow Steps

The complete workflow is split into two phases to keep each document under 500 lines:

**Note**: Technology stack selection (language, frameworks, architecture, etc.) is handled in the create-specs workflow. This implementation workflow uses the technology decisions documented in the specs.

### Setup Phase (Steps 1-9)
See `docs/specs-references/implement-specs-setup.md` for:
1. Repository Review (Required First Step)
2. Initialize Progress Tracking and Phase Selection
3. Validate Spec Structure
4. Parse Specs Structure
5. Resolve Dependencies
6. Determine Next Phase
7. Display Phase Overview
8. Request User Confirmation
9. Create Implementation Checkpoint

### Implementation Phase (Steps 10-19)
See `docs/specs-references/implement-specs-implementation.md` for:
10. Implement Phase
11. Run Code Quality Checks
12. Execute Tests
13. Verify Implementation
14. Request Code Review
15. Update Progress
16. Save Code (User Action)
17. Clean Up Checkpoint
18. Continue to Next Phase
19. Completion

## Reference Materials

For detailed progress tracking, error handling, and guidelines, see:
- **Setup Phase**: `docs/specs-references/implement-specs-setup.md` - Steps 1-9
- **Implementation Phase**: `docs/specs-references/implement-specs-implementation.md` - Steps 10-19
- **Progress Tracking**: `docs/specs-references/implement-specs-progress.md` - Progress file format and validation
- **Error Handling**: `docs/specs-references/implement-specs-handling.md` - Error handling, rollback, and spec updates
