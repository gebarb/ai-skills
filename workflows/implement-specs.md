---
description: Implement specs and phases from a repository with progress tracking and user confirmation
---

# Spec Implementation Workflow

This workflow executes the implementation of specs and phases defined in a repository's `specs/` directory. It tracks progress, requires user confirmation between phases, and allows resuming from where left off.

## Prerequisites

- Repository must have a `specs/` directory
- `specs/README.md` must exist and define phase structure
- Phase files must be named `phase-*.md` (e.g., `phase-0-foundation.md`)
- Each phase file should contain implementation tasks, technical requirements, and success criteria

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

### 1. Initialize Progress Tracking and Phase Selection

Check for existing progress file (`.specs-progress.json`) and determine implementation scope.

```bash
# Check if progress file exists
if [ ! -f .specs-progress.json ]; then
  echo "No existing progress found. Starting fresh."
  # Will be created in step 2
else
  echo "Found existing progress. Will resume from last completed phase."
fi
```

**Phase Selection:**
Ask the user to choose implementation scope:

```
=== Implementation Scope ===

How would you like to proceed?

1. Implement all phases (from beginning)
2. Start from a specific phase
3. Resume from existing progress (if available)

Select option (1-3):
```

**If option 1 (Implement all phases):**
- Proceed with normal implementation from phase 0 or first phase

**If option 2 (Start from specific phase):**
```
=== Select Starting Phase ===

Available phases:
- Phase 0: Foundation
- Phase 1: First Feature
- Phase 2: Second Feature
- Phase 3: Third Feature
...

Enter phase number to start from (e.g., 0, 1, 2, 3):
```

After selection:
- Mark all phases before the selected phase as completed in progress file
- Set selected phase as "in-progress"
- Validate that dependencies for selected phase are satisfied
- If dependencies not satisfied, warn user and suggest starting from earlier phase

**If option 3 (Resume from existing progress):**
- Load existing progress file
- Find first incomplete phase with satisfied dependencies
- Proceed with that phase

**Note**: For team collaboration:
- Use file-based review for spec review and approval
- Assign reviewers for spec changes
- Use issue templates for spec proposals
- Define approval workflows (e.g., 2 approvals required)
- Document review decisions in change log
- Coordinate progress tracking via project management tools

### 2. Validate Spec Structure

Before parsing, validate that the specs directory has the expected structure:

- Check that `specs/` directory exists
- Verify `specs/README.md` is present and readable
- Validate that phase files referenced in README exist
- Check that each phase file has required sections (Overview, Context, Implementation Tasks, Technical Requirements, Success Criteria)
- Ensure phase file naming follows `phase-*.md` pattern
- Detect spec version from README or CHANGELOG.md if available

If validation fails, report the specific issues and ask user how to proceed:
- 'fix' to manually correct the issues
- 'exit' to stop the workflow

### 3. Parse Specs Structure

Read the `specs/README.md` to understand the phase structure and dependencies.

**Parsing Strategy:**

For **sequential** READMEs:
- Look for numbered phase lists (Phase 0, Phase 1, etc.)
- Extract phase names and file paths from list items
- Dependencies are implicit (previous phases)

For **categorized** READMEs:
- Parse category sections (e.g., Foundational, Foundation, Core)
- Extract phase names from tables or lists within categories
- Dependencies may be explicit in dependency columns

- Extract phase names and their file paths
- Identify phase order and dependencies (if specified)
- Build dependency graph
- Validate no circular dependencies exist
- Create or update `.specs-progress.json` with all phases

### 4. Resolve Dependencies

Before selecting the next phase, resolve dependencies:

- Check if all dependencies for pending phases are satisfied
- Identify phases that can be started (all dependencies complete)
- If multiple phases are available, present options to user:
  - Auto-select first in order
  - Let user choose which to implement
  - Implement multiple phases in parallel (if dependencies allow)
- If a phase's dependencies are not complete, skip it for now

**Dependency Resolution Rules:**
- Phases with no dependencies can be started immediately
- Phases with dependencies must wait for all dependencies to complete
- If dependencies are marked as skipped, warn user before proceeding
- Circular dependencies should have been caught in validation step

**Parallel Phase Support:**
When multiple phases have all dependencies satisfied, you can implement them in parallel:

```
=== Parallel Phase Detection ===

The following phases have all dependencies satisfied and can be implemented in parallel:

1. Phase 2: Feature A (no dependencies)
2. Phase 3: Feature B (depends on Phase 0, completed)
3. Phase 4: Feature C (depends on Phase 1, completed)

Would you like to:
- 'sequential' to implement one phase at a time (default)
- 'parallel' to implement multiple phases simultaneously
- 'select' to choose which phase to implement next
```

**Parallel Implementation Considerations:**
- Each parallel phase gets its own checkpoint branch
- Track progress separately for each parallel phase
- Merge parallel phases in dependency order when complete
- Watch for conflicts between parallel implementations
- If conflicts occur, resolve before merging
- Parallel phases should not modify the same files

**Conflict Detection for Parallel Work:**
- Review phase files to identify which files each phase will modify
- If phases modify the same files, recommend sequential implementation
- Check if phases have conflicting dependencies
- Warn if parallel phases might create merge conflicts
- Suggest sequential implementation if high conflict risk

### 5. Determine Next Phase

Based on `.specs-progress.json`, resolved dependencies, and user's phase selection, identify the next phase to implement.

- If all phases are complete, report completion and exit
- If user selected a specific phase in step 1, use that phase (validate dependencies first)
- If some phases are complete, find the first incomplete phase with satisfied dependencies
- If no progress file exists, start with the first phase
- If user skipped phases, confirm they want to proceed with available phases
- If multiple phases are available for parallel implementation, present parallel option

**Phase Selection Override:**
If user selected a specific phase in step 1:
- Validate that all dependencies for the selected phase are satisfied
- If dependencies not satisfied, warn user and suggest starting from earlier phase
- Ask user to confirm or change selection
- Mark earlier phases as completed in progress file if user confirms

**Phase Selection Options:**
1. **Sequential**: Implement phases one at a time in dependency order
2. **Parallel**: Implement multiple phases simultaneously when dependencies allow
3. **Selective**: User chooses which phase to implement next from available options

### 6. Display Phase Overview

Before implementing, show the user what will be implemented:

```
=== Phase: [Phase Name] ===
File: specs/[phase-file].md
Status: [pending/in-progress/completed]

Description:
[Brief description from phase file]

Implementation Tasks:
- [ ] Task 1
- [ ] Task 2
...

Technical Requirements:
- Requirement 1
- Requirement 2
...

Success Criteria:
- [ ] Criterion 1
- [ ] Criterion 2
...
```

### 7. Request User Confirmation

Ask the user to confirm before proceeding:

```
Ready to implement [Phase Name]?
- Type 'yes' to proceed
- Type 'skip' to skip this phase
- Type 'exit' to stop the workflow
```

### 8. Create Implementation Checkpoint

Before implementing, create a checkpoint for potential rollback:

**Checkpoint Strategy:**
- Create a backup of current code state before phase implementation
- Store backup in `.phase-checkpoints/` directory
- Name checkpoints with phase number and timestamp
- Clean up stale checkpoints periodically

This allows rollback if implementation fails.

### 9. Implement Phase

If user confirms, read the phase file and implement it using the following methodology:

**Implementation Methodology:**

1. **Analyze the Phase File:**
   - Read and parse the phase file completely
   - Extract all implementation tasks grouped by category
   - Identify technical requirements and constraints
   - Note success criteria for verification

2. **Identify Implementation Scope:**
   - Determine which files need to be created
   - Determine which files need to be modified
   - Identify any new directories or structures needed
   - Check for conflicts with existing code

3. **Generate Code Following Project Patterns:**
   - Examine existing code structure and patterns
   - Follow established naming conventions
   - Maintain consistency with existing architecture
   - Use appropriate design patterns (MVC, repository pattern, etc.)

4. **Implement Tasks Systematically:**
   - Start with foundational tasks (models, services)
   - Move to UI components
   - Implement business logic
   - Add integration points
   - Report progress as each task completes

5. **Handle Errors Gracefully:**
   - If a task fails, report the specific error
   - Show context of what was being implemented
   - Offer options: retry, skip task, or rollback to checkpoint
   - Log errors for debugging

**Example Implementation Flow:**
```
Reading phase file: specs/phase-1-feature-name.md

=== Task 1/8: UI Component Creation ===
- Creating feature_screen.dart... ✓
- Adding input fields... ✓
- Implementing selection UI... ✓

=== Task 2/8: Data Model Enhancement ===
- Expanding relevant model... ✓
- Adding new attributes... ✓

[Continue for all tasks]
```

### 10. Run Code Quality Checks

After implementation, run code quality checks:

- **Linting**: Run linter (e.g., `flutter analyze`, `eslint`)
- **Formatting**: Check code formatting (e.g., `dart format`, `prettier`)
- **Type Checking**: Verify type safety (if applicable)
- **Import Validation**: Check for unused imports or missing dependencies

Report any issues found:
- Categorize issues by severity (error, warning, info)
- If issues are minor, offer to auto-fix
- If issues are major, ask user how to proceed
- All issues must be resolved before proceeding

**Issue Severity Levels:**
- **Error**: Blocks compilation or runtime (must fix)
- **Warning**: Potential issues (should fix)
- **Info**: Style or best practice suggestions (optional)

### 11. Execute Tests

Run tests to verify implementation:

**Test Categories:**
- **Unit Tests**: Test individual functions, classes, and components in isolation
- **Integration Tests**: Test interactions between multiple components
- **Widget/UI Tests**: Test UI components and user interactions
- **End-to-End Tests**: Test complete user flows (if applicable)
- **Performance Tests**: Test performance characteristics (if specified)

**Test Execution:**
- Run unit tests for newly created code
- Run integration tests if applicable
- Run widget/UI tests if applicable
- Check test coverage meets requirements (if specified in phase)
- Generate coverage report

**Test Coverage Requirements:**
- Minimum 80% code coverage for new code (unless specified otherwise in phase)
- Critical paths must have 100% coverage
- Edge cases and error paths should be tested

Report test results:
- Show total tests run, passed, failed, skipped
- Show coverage percentage
- If all tests pass: proceed to verification
- If tests fail: show failing tests with error messages and ask how to proceed
  - 'fix' to attempt to fix failing tests
  - 'skip' to proceed despite failures (not recommended)
  - 'rollback' to revert to checkpoint

**Test Failure Triage:**
- Identify root cause of failure
- Determine if failure is in implementation or test itself
- If test is incorrect, update test
- If implementation is incorrect, fix implementation
- Re-run tests after fixes

### 12. Verify Implementation

After implementation, verify the success criteria:

- Check each success criterion systematically
- Report which criteria are met
- Report any issues or missing criteria
- For each criterion:
  - [ ] Criterion 1: [status] - [notes]
  - [ ] Criterion 2: [status] - [notes]
  - [ ] Criterion 3: [status] - [notes]

**Verification Methods:**
- Manual testing (if applicable)
- Automated test execution
- Code review against spec requirements
- Performance benchmarking (if specified)
- User acceptance testing (if applicable)

**If Criteria Not Met:**
- Identify which criteria are not met
- Determine why (implementation issue, spec issue, or testing issue)
- Offer options:
  - 'fix' to address missing criteria
  - 'adjust' to modify success criteria (if spec issue)
  - 'proceed' to continue with warnings (not recommended)

### 13. Request Code Review

Ask the user to review the implemented code:

```
Phase [Phase Name] implementation complete.

Please review the changes:
- Check the implementation against the spec
- Verify all success criteria are met
- Test the implementation if applicable

When ready:
- Type 'approve' to mark this phase as complete and proceed
- Type 'retry' to re-implement this phase
- Type 'exit' to stop the workflow (progress will be saved)
```

### 14. Update Progress

If user approves:

- Update `.specs-progress.json` to mark the phase as completed
- Record completion timestamp
- Save the progress file

### 15. Save Code (User Action)

Instruct the user to save the changes:

```
Please save the changes for this phase:

- [Brief summary of what was implemented]
- [Key features added]
- [Files created/modified]

After saving, type 'continue' to proceed to the next phase.
```

### 16. Clean Up Checkpoint

After successful save, clean up the checkpoint:

**Cleanup Strategy:**
- Remove checkpoint backup from `.phase-checkpoints/` directory
- Keep only the most recent checkpoint if needed for reference
- Delete stale checkpoints periodically

### 17. Continue to Next Phase

Repeat steps 3-12 for the next incomplete phase.

### 18. Completion

When all phases are complete:

```
=== All Phases Complete ===

All specs and phases have been successfully implemented!

Progress saved to: .specs-progress.json

Next steps:
- Review the complete implementation
- Run comprehensive tests
- Deploy to production
```

## Reference Materials

For detailed progress tracking, error handling, and guidelines, see:
- **Progress Tracking**: `.windsurf/docs/specs-references/implement-specs-progress.md` - Progress file format and validation
- **Error Handling**: `.windsurf/docs/specs-references/implement-specs-handling.md` - Error handling, rollback, and spec updates
