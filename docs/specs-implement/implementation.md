---
description: Implement specs and phases from a repository - Implementation Phase (Steps 10-19)
---

# Spec Implementation Workflow - Implementation Phase

This is the implementation phase of the specs-implement workflow, covering Steps 10-19: Implement phase, code quality checks, test execution, verification, code review, progress update, save code, cleanup checkpoint, continue to next phase, and completion.

**Note**: Technology stack selection (language, frameworks, architecture, etc.) is handled in the specs-create workflow. This implementation workflow uses the technology decisions documented in the specs.

For the complete workflow, see:
- Setup Phase: `{{DOCS_DIR}}/specs-implement/setup.md` (Steps 1-9)
- Implementation Phase: This file (Steps 10-19)

## Workflow Steps

### 10. Implement Phase

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

### 11. Run Code Quality Checks

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

### 12. Execute Tests

**Unit Test Prompt:**
Before running tests, ask the user if they want to include unit tests for this phase:

```
=== Unit Test Creation ===

Would you like to include unit tests for this phase implementation?

- Type 'yes' to create comprehensive unit tests
- Type 'no' to skip unit test creation
- Type 'later' to create tests later (not recommended for production code)
```

**If user selects 'yes':**
- Create comprehensive unit tests for all new code
- Ensure tests cover:
  - Happy paths (expected functionality)
  - Edge cases and boundary conditions
  - Error handling and failure scenarios
  - Integration points with other components
- Run tests and ensure all pass before proceeding
- If tests fail, fix implementation or tests until all pass
- Generate test coverage report
- Verify coverage meets requirements (minimum 80% for new code, 100% for critical paths)

**If user selects 'no':**
- Skip unit test creation
- Note that this is not recommended for production code
- Proceed to verification step
- Consider adding tests later before deployment

**If user selects 'later':**
- Skip unit test creation for now
- Add a reminder to create tests before deployment
- Proceed to verification step
- Note that tests should be created before production deployment

Run tests to verify implementation:

**Test Existence Check:**
Before running tests, check if a test framework is configured and tests exist:
```bash
# Check for common test frameworks
TEST_FRAMEWORK_FOUND=false

# Check for package.json with test scripts
if [ -f package.json ] && grep -q '"test"' package.json; then
  TEST_FRAMEWORK_FOUND=true
fi

# Check for pytest (Python)
if [ -f pytest.ini ] || [ -f setup.py ] || [ -d tests ]; then
  TEST_FRAMEWORK_FOUND=true
fi

# Check for Go tests (limit to project root to avoid false positives)
if [ -d . ] && find . -maxdepth 2 -name "*_test.go" | grep -q .; then
  TEST_FRAMEWORK_FOUND=true
fi

# Check for other common test indicators
if [ -f Makefile ] && grep -q "test" Makefile; then
  TEST_FRAMEWORK_FOUND=true
fi

if [ "$TEST_FRAMEWORK_FOUND" = false ]; then
  echo "No test framework detected. Skipping test execution."
  echo "Note: It is recommended to set up a test framework for production code."
  # Proceed to verification step
else
  echo "Test framework detected. Running tests..."
fi
```

**Test Categories:**
- **Unit Tests**: Test individual functions, classes, and components in isolation
- **Integration Tests**: Test interactions between multiple components
- **Widget/UI Tests**: Test UI components and user interactions
- **End-to-End Tests**: Test complete user flows (if applicable)
- **Performance Tests**: Test performance characteristics (if specified)

**Test Execution:**
- If test framework is detected: Run unit tests for newly created code
- Run integration tests if applicable
- Run widget/UI tests if applicable
- Check test coverage meets requirements (if specified in phase)
- Generate coverage report
- If no test framework is detected: Skip test execution with a warning and proceed to verification

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
- If no tests were run (no test framework): note this and proceed to verification with a warning

**Test Failure Triage:**
- Identify root cause of failure
- Determine if failure is in implementation or test itself
- If test is incorrect, update test
- If implementation is incorrect, fix implementation
- Re-run tests after fixes

### 13. Verify Implementation

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

### 14. Request Code Review

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

### 15. Update Progress

If user approves:

- Update `.specs-progress.json` to mark the phase as completed
- Record completion timestamp
- Update specVersion field with the version used for implementation
- Save the progress file

### 16. Save Code (User Action)

Instruct the user to save the changes:

```
Please save the changes for this phase:

- [Brief summary of what was implemented]
- [Key features added]
- [Files created/modified]

After saving, type 'continue' to proceed to the next phase.
```

### 17. Clean Up Checkpoint

After successful save, clean up the checkpoint:

**Cleanup Strategy:**
- Remove checkpoint backup from `.phase-checkpoints/` directory
- Keep only the most recent checkpoint if needed for reference
- Delete stale checkpoints periodically

**Automated Cleanup:**
After successful phase completion, run automated checkpoint cleanup to prevent accumulation of old checkpoints:
```bash
# Automated checkpoint cleanup - keep only last 5 checkpoints
cleanup_checkpoints() {
  if [ -d .phase-checkpoints ]; then
    # List checkpoints sorted by name (which includes timestamp), keep last 5
    ls -t .phase-checkpoints/ | tail -n +6 | while read checkpoint; do
      echo "Cleaning up old checkpoint: $checkpoint"
      rm -rf ".phase-checkpoints/$checkpoint"
    done
  fi
}

# Run cleanup after successful phase completion
cleanup_checkpoints
```

**Manual Cleanup:**
If automated cleanup is not desired, checkpoints can be cleaned manually:
```bash
# Clean up all checkpoints
rm -rf .phase-checkpoints/phase-*

# Clean up specific checkpoint
rm -rf .phase-checkpoints/phase-3-20240115-103045
```

### 18. Continue to Next Phase

Repeat steps 6-18 for the next incomplete phase.

### 19. Completion

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
- **Progress Tracking**: `{{DOCS_DIR}}/specs-implement/progress.md` - Progress file format and validation
- **Error Handling**: `{{DOCS_DIR}}/specs-implement/handling.md` - Error handling, rollback, and spec updates
