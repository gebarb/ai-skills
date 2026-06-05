---
name: specs-implement
description: Implement specs and phases from a repository with progress tracking and user confirmation
---

# Spec Implementation Workflow

This workflow executes the implementation of specs and phases defined in a repository's `specs/` directory. It tracks progress, requires user confirmation between phases, and allows resuming from where left off.

## Prerequisites

**Note**: The use of create-specs and validate-specs workflows is optional. Users may provide their own spec files or implementation requests. If specs cannot be determined, this workflow will ask for direction or recommend using create-specs.

- If specs exist: Repository must have a `specs/` directory with `specs/README.md` defining phase structure
- Phase files must be named `phase-*.md` (e.g., `phase-1-foundation.md`)
- Each phase file should contain implementation tasks, technical requirements, and success criteria
- If specs don't exist: Workflow will prompt user for direction or recommend create-specs

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

**Key Enhancements**:
- **Spec Existence Check**: If specs don't exist, workflow asks for direction or recommends create-specs
- **TDD Support**: Before implementation, asks user if they want tests and whether to use TDD approach
- **Automatic Code Review**: Performs comprehensive automatic code review after implementation
- **Automatic Documentation**: Generates documentation automatically after code review

### Preparation Phase (Steps 1-11)
See `references/setup.md` for:
1. **Repository Review** - Deep review of all code, configuration, and other files in the codebase to understand how it works, its intent, and how to work in it. This is performed for each phase since the codebase state changes after implementation.
2. **Check for Specs and Determine Implementation Approach** - Check if specs exist, and if not, ask user for direction or recommend create-specs
3. Initialize Progress Tracking and Phase Selection
4. Validate Spec Structure
5. Parse Specs Structure
6. Resolve Dependencies
7. Determine Next Phase
8. **Display Phase Overview** - Build and present a summary and plan of action for the upcoming phase implementation
9. **Request User Confirmation** - Present the summary and plan to the user for confirmation before proceeding
10. **Confirm Testing Approach (TDD Prompt)** - Ask user if they want unit tests and whether to use TDD approach before implementation begins
11. Create Implementation Checkpoint

### Implementation Phase (Steps 12-22)
See `references/implementation.md` for:
12. Implement Phase (with TDD support if selected)
13. Run Code Quality Checks
14. Execute Tests
15. Verify Implementation
16. **Perform Automatic Code Review** - Comprehensive automatic code review with quality analysis, security review, performance review, and spec compliance
17. **Generate Documentation** - Automatically generate API docs, code docs, user guides, and developer documentation
18. Update Progress
19. Save Code (User Action)
20. Clean Up Checkpoint
21. Continue to Next Phase
22. Completion

## Reference Materials

For detailed progress tracking, error handling, and guidelines, see:
- **Setup Phase**: `references/setup.md` - Steps 1-11
- **Implementation Phase**: `references/implementation.md` - Steps 12-22
- **Progress Tracking**: `references/progress.md` - Progress file format and validation
- **Error Handling**: `references/handling.md` - Error handling, rollback, and spec updates
