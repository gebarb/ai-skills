---
name: specs-implement
description: Implement specs and phases from a repository with progress tracking and user confirmation. Always use this skill for spec-driven development workflows when implementing specs, executing project phases, or tracking progress through implementation phases.
argument-hint: Provide the repository path containing the specs/ directory, or specify the phase to start from if resuming.
version: 1.1.0
license: MIT
compatibility: Requires repository access with specs/ directory, ability to read and write files, and user confirmation capability
---

# Spec Implementation Workflow

This workflow executes the implementation of specs and phases defined in a repository's `specs/` directory. It tracks progress, requires user confirmation between phases, and allows resuming from where left off.

**Note**: This SKILL.md is 374 lines, which exceeds the 300-line progressive disclosure recommendation. This is justified because this is a complex implementation workflow with comprehensive guidance including platform requirements, security considerations, internationalization, accessibility, and a detailed workflow diagram. The detailed instructions reduce the need for users to reference multiple files during execution.

**Success Criteria:**
The skill execution is considered successful when:
- All phases are implemented with quality score ≥90%
- All phase-specific success criteria are met
- Code review passes without critical issues
- Tests pass with ≥80% coverage (if tests enabled)
- Progress file shows all phases as "completed"
- Documentation is generated (if not skipped)

## AI Execution Overview

This skill provides detailed instructions for implementing specs. As an AI, you should:

1. **Read the phase files** to understand what needs to be implemented
2. **Follow the step-by-step instructions** in the reference files
3. **Execute each step** using the AI execution instructions provided
4. **Ask for user confirmation** at key decision points (before each phase, when quality score <90%, when errors occur)
5. **Track progress** in `.specs-progress.json`
6. **Handle errors gracefully** with rollback options (report errors clearly, offer retry/skip/rollback options, use checkpoint mechanism for recovery)

**Terminology:**
- **Deep review**: Comprehensive examination of all files to understand architecture, patterns, coding conventions, and integration points
- **Key decision points**: Moments requiring user input (phase confirmation, quality score warnings, error recovery, testing approach selection)
- **Handle errors gracefully**: Report specific errors with context, categorize severity (fatal/recoverable/warning), and provide actionable recovery options

The workflow is split into three phases:
- **Setup Initialization Phase** (Steps 1-6): See `references/setup-initialization.md`
- **Setup Preparation Phase** (Steps 7-11): See `references/setup-preparation.md`
- **Implementation Phase** (Steps 12-22): See `references/implementation.md`

## Prerequisites

**Note**: The use of create-specs and validate-specs workflows is optional. Users may provide their own spec files or implementation requests. If specs cannot be determined, this workflow will ask for direction or recommend using create-specs.

- If specs exist: Repository must have a `specs/` directory with `specs/README.md` defining phase structure
- Phase files must be named `phase-*.md` (e.g., `phase-1-foundation.md`)
- Each phase file should contain implementation tasks, technical requirements, and success criteria

**Example Phase File Format:**
```markdown
# Phase 1: Foundation

## Overview
[Detailed description of what this phase implements]

## Context
[Additional context about why this phase is needed]

## Implementation Tasks
- [ ] Task 1
- [ ] Task 2

## Technical Requirements
- Requirement 1
- Requirement 2

## Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2
```

- If specs don't exist: Workflow will prompt user for direction or recommend create-specs

## Platform Requirements

This workflow uses basic file operations and git commands. The following are recommended:
- Git (recommended for checkpoint creation and change detection, fallback to file operations available)
- Access to the repository root directory
- Ability to read and write JSON files for progress tracking

**Performance and Scalability:**
- Suitable for projects with up to 50 phases and 500 tasks
- Checkpoint storage requires approximately 2-5x repository size for backups
- Progress file size scales with number of phases and tasks (typically 1-10 KB per phase)
- Quality score calculation may take 1-5 seconds for large spec sets (20+ phases)
- For larger projects, consider splitting into multiple spec files or using selective phase implementation

**Resource Requirements:**
- Disk space: Minimum 100 MB free for checkpoints (scales with repository size)
- Memory: No specific requirements (workflow is stateless between steps)
- Network: Not required unless specs reference external resources

**Security Considerations:**
- Checkpoints stored in `.phase-checkpoints/` may contain sensitive code or configuration
- Progress file (`.specs-progress.json`) contains project structure information
- Progress backups stored in `.specs-progress-backups/` should be protected
- Consider adding `.phase-checkpoints/` and `.specs-progress-backups/` to `.gitignore`
- Ensure checkpoint directories have appropriate file permissions (read/write for owner only)
- If repository contains secrets (API keys, passwords), ensure they are not included in checkpoints
- Review checkpoint contents before sharing or committing

**Internationalization:**
- This skill currently supports English-language specs and documentation
- Spec files should use UTF-8 encoding for international character support
- Phase file names should use ASCII characters for cross-platform compatibility
- Documentation generation follows the language of the spec files
- For non-English projects, translate skill prompts and messages as needed

**Accessibility:**
- Progress reports and phase overviews use clear, structured formatting for screen readers
- Code review reports use consistent formatting with clear headings
- Error messages provide specific, actionable information
- Consider providing alternative formats (e.g., plain text summaries) for users who need them

## Usage

Run this workflow from the root of your repository:

```
/specs-implement
```

Optional: Start from a specific phase:

```
/specs-implement --from-phase 3
```

## Quick Start Guide

For simple use cases, follow this streamlined workflow:

**Basic Implementation (No Customization):**
1. Ensure you have a `specs/` directory with `specs/README.md` and phase files
2. Run `/specs-implement` from your repository root
3. The workflow will:
   - Review your repository
   - Validate your specs
   - Ask for confirmation before each phase
   - Implement each phase with automatic code review
   - Generate documentation
   - Track progress in `.specs-progress.json`

**Skip Confirmations (Automated Mode):**
If you want to implement without confirmation prompts:
- The workflow will still perform all validation and quality checks
- You can skip individual phases if needed
- Progress is still tracked for resumption

**Resume from Interruption:**
If the workflow is interrupted:
- Run `/specs-implement` again
- It will automatically detect progress and resume from the last incomplete phase
- No special flags needed

**Common Quick Start Scenarios:**

| Scenario | Command | Notes |
|----------|---------|-------|
| Start fresh implementation | `/specs-implement` | Begins from Phase 1 |
| Resume from interruption | `/specs-implement` | Auto-detects progress |
| Skip to specific phase | `/specs-implement --from-phase 3` | Marks earlier phases complete |
| Re-implement failed phase | `/specs-implement --from-phase N` | Use phase number that failed |

**What to Expect:**
- Repository review (1-2 minutes)
- Spec validation (30 seconds)
- Per phase implementation (varies by complexity)
- Automatic code review after each phase
- Documentation generation
- Progress tracking throughout

**When to Use Full Workflow vs Quick Start:**
- Use Quick Start for: Standard spec-driven development, straightforward implementations
- Use Full Workflow for: Custom testing approaches (TDD), selective phase implementation, complex dependency management, spec updates during implementation

## Workflow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                    SETUP INITIALIZATION PHASE                     │
│                    (Steps 1-6)                                   │
├─────────────────────────────────────────────────────────────────┤
│  1. Repository Review                                            │
│     └─ Deep review of codebase, architecture, patterns           │
│                                                                 │
│  2. Check for Specs                                               │
│     ├─ Specs exist? → Continue                                   │
│     └─ No specs? → Ask user (provide path, describe, create, exit)│
│                                                                 │
│  3. Initialize Progress Tracking                                 │
│     └─ Check for existing .specs-progress.json                  │
│                                                                 │
│  4. Validate Spec Structure                                      │
│     ├─ Validate directory structure                              │
│     ├─ Validate phase file format                                │
│     └─ Calculate quality score (≥90% threshold)                │
│                                                                 │
│  5. Parse Specs Structure                                         │
│     ├─ Read specs/README.md                                      │
│     ├─ Extract phase information                                 │
│     └─ Build dependency graph                                     │
│                                                                 │
│  6. Resolve Dependencies                                          │
│     ├─ Check dependency satisfaction                             │
│     ├─ Detect circular dependencies                              │
│     └─ Determine available phases                                │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                   SETUP PREPARATION PHASE                        │
│                    (Steps 7-11)                                  │
├─────────────────────────────────────────────────────────────────┤
│  7. Determine Next Phase                                          │
│     └─ Select phase based on progress & dependencies             │
│                                                                 │
│  8. Display Phase Overview                                       │
│     └─ Show tasks, requirements, success criteria                │
│                                                                 │
│  9. Confirm Testing Approach                                     │
│     ├─ Want tests? (yes/no/later)                                │
│     └─ TDD or standard approach?                                 │
│                                                                 │
│ 10. Request User Confirmation                                     │
│     └─ Ready to implement? (yes/skip/exit)                      │
│                                                                 │
│ 11. Create Implementation Checkpoint                              │
│     └─ Backup current state for rollback                        │
└─────────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                    IMPLEMENTATION PHASE                          │
│                    (Steps 12-22)                                 │
├─────────────────────────────────────────────────────────────────┤
│ 12. Implement Phase                                               │
│     ├─ TDD: Write tests first, then implement                    │
│     ├─ Standard: Implement first, then tests                    │
│     └─ No tests: Implement only                                   │
│                                                                 │
│ 13. Run Code Quality Checks                                       │
│     └─ Linter, formatter, type checker                           │
│                                                                 │
│ 14. Execute Tests                                                 │
│     └─ Run test suite, check coverage                            │
│                                                                 │
│ 15. Verify Implementation                                         │
│     └─ Check success criteria                                    │
│                                                                 │
│ 16. Perform Automatic Code Review                                 │
│     ├─ Code quality analysis                                     │
│     ├─ Spec compliance check                                     │
│     ├─ Security review                                           │
│     ├─ Performance review                                         │
│     └─ Documentation review                                       │
│                                                                 │
│ 17. Generate Documentation                                        │
│     ├─ API documentation                                         │
│     ├─ Code documentation                                        │
│     ├─ User documentation                                        │
│     └─ Developer documentation                                   │
│                                                                 │
│ 18. Update Progress                                               │
│     └─ Mark phase as completed in .specs-progress.json          │
│                                                                 │
│ 19. Save Code (User Action)                                       │
│     └─ User commits changes                                      │
│                                                                 │
│ 20. Clean Up Checkpoint                                          │
│     └─ Remove checkpoint backup                                   │
│                                                                 │
│ 21. Continue to Next Phase?                                       │
│     ├─ More phases? → Go to Step 7                               │
│     └─ All complete? → Step 22                                   │
│                                                                 │
│ 22. Completion                                                   │
│     └─ Generate final report, next steps                         │
└─────────────────────────────────────────────────────────────────┘
```

**Decision Points:**
- **Spec Existence (Step 2)**: If no specs found, user can provide path, describe requirements, create specs, or exit
- **Quality Score (Step 4)**: If score <90%, user can continue with warning, exit to improve specs, or fix interactively
- **Testing Approach (Step 9)**: User chooses TDD, standard, no tests, or later
- **User Confirmation (Step 10)**: User confirms, skips phase, or exits workflow
- **Code Review (Step 16)**: User approves, fixes issues, or retries implementation
- **Documentation (Step 17)**: User can skip auto-generation and write manually

## Workflow Steps

The complete workflow is split into three phases to keep each document under 500 lines:

**Important**: Steps 7-20 repeat for EACH phase being implemented. The workflow loops through phases until all are complete. Steps 1-6 are performed once at the start.

**Note**: Technology stack selection (language, frameworks, architecture, etc.) is handled in the specs-create workflow. This implementation workflow uses the technology decisions documented in the specs.

**Key Enhancements**:
- **Spec Existence Check**: If specs don't exist, workflow asks for direction or recommends create-specs
- **TDD Support**: Before implementation, asks user if they want tests and whether to use TDD approach (now before user confirmation)
- **Automatic Code Review**: Performs comprehensive automatic code review after implementation with detailed AI execution instructions
- **Automatic Documentation**: Generates documentation automatically after code review
- **Platform Detection**: Automatically detects operating system for platform-specific commands
- **Spec File Format Validation**: Validates phase files contain required sections before parsing
- **Dependency Resolution Examples**: Includes detailed examples and edge cases for dependency resolution

### Setup Initialization Phase (Steps 1-6)
See `references/setup-initialization.md` for:
1. **Repository Review** - Deep review of all code, configuration, and other files in the codebase to understand how it works, its intent, and how to work in it. Performed once at the start to understand architecture, patterns, and conventions. For subsequent phases, perform incremental review focusing on changes since last phase.
2. **Check for Specs and Determine Implementation Approach** - Check if specs exist, and if not, ask user for direction or recommend create-specs
3. **Initialize Progress Tracking and Phase Selection** - Check for existing progress file (initialization deferred until after spec parsing). If using --from-phase flag, validate that all dependencies for the selected phase are satisfied. If dependencies are not satisfied, warn user and suggest starting from an earlier phase or require explicit override confirmation.
4. **Validate Spec Structure** - Validate specs directory structure, phase file format, and calculate quality score (≥90% threshold)
5. **Parse Specs Structure** - Parse README to extract phase information and dependencies
6. **Resolve Dependencies** - Resolve phase dependencies with examples and edge case handling

### Setup Preparation Phase (Steps 7-11)
See `references/setup-preparation.md` for:
7. **Determine Next Phase** - Identify next phase based on progress and dependencies
8. **Display Phase Overview** - Build and present a summary and plan of action for the upcoming phase implementation
9. **Confirm Testing Approach (TDD Prompt)** - Ask user if they want unit tests and whether to use TDD approach (moved before user confirmation)
10. **Request User Confirmation** - Present the summary and plan to the user for confirmation before proceeding
11. **Create Implementation Checkpoint** - Create checkpoint for potential rollback

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
- **Setup Initialization Phase**: `references/setup-initialization.md` - Steps 1-6
- **Setup Preparation Phase**: `references/setup-preparation.md` - Steps 7-11
- **Implementation Phase**: `references/implementation.md` - Steps 12-22
- **Code Review**: `references/code-review.md` - Step 16 detailed code review instructions
- **Progress Tracking**: `references/progress.md` - Progress file format and validation
- **Error Handling**: `references/error-handling.md` - Error handling and rollback procedures
- **Spec Updates**: `references/spec-updates.md` - Spec update handling and workflow integration

**Progress File Structure Example:**
```json
{
  "repository": "my-project",
  "lastUpdated": "2024-01-15T10:30:00Z",
  "specVersion": "1.0.0",
  "startPhase": null,
  "auditLog": [],
  "phases": [
    {
      "name": "Phase 1: Foundation",
      "file": "specs/phase-1-foundation.md",
      "status": "completed",
      "completedAt": "2024-01-15T09:00:00Z",
      "specVersion": "1.0.0",
      "tasksCompleted": 8,
      "totalTasks": 8,
      "tasks": []
    }
  ]
}
```
