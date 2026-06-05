---
description: Implement specs and phases from a repository - Implementation Phase (Steps 12-21)
---

# Spec Implementation Workflow - Implementation Phase

This is the implementation phase of the specs-implement workflow, covering Steps 12-21: Implement phase (with TDD support if selected), code quality checks, test execution, verification, automatic code review, documentation generation, progress update, save code, cleanup checkpoint, continue to next phase, and completion.

**Note**: Technology stack selection (language, frameworks, architecture, etc.) is handled in the specs-create workflow. This implementation workflow uses the technology decisions documented in the specs.

For the complete workflow, see:
- Setup Phase: `{{DOCS_DIR}}/specs-implement/setup.md` (Steps 1-11)
- Implementation Phase: This file (Steps 12-21)

## Workflow Steps

### 12. Implement Phase

If user confirms, read the phase file and implement it using the following methodology:

**Implementation Methodology:**

**Check Testing Approach:**
Before implementing, check the testing approach selected in Step 10 (Setup Phase):
- If TDD mode: Write tests first, then implement code to make tests pass
- If standard mode: Write implementation first, then write tests
- If no tests: Skip test creation entirely

**TDD Implementation Flow (if selected):**
1. Write failing tests for the implementation tasks
2. Run tests to confirm they fail
3. Implement minimal code to make tests pass
4. Run tests to confirm they pass
5. Refactor code while keeping tests passing
6. Repeat for each task

**Standard Implementation Flow (if selected):**
1. Implement the code according to the phase specification
2. Write tests after implementation is complete
3. Run tests to verify implementation

**No Tests Flow (if selected):**
1. Implement the code according to the phase specification
2. Skip test creation
3. Proceed to verification

**Common Implementation Steps:**

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

### 13. Run Code Quality Checks

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

### 14. Execute Tests

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

### 15. Verify Implementation

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

### 16. Perform Automatic Code Review

Perform a comprehensive automatic code review of the implemented code:

**Review Scope:**
- Code quality and maintainability
- Adherence to project conventions and patterns
- Security vulnerabilities
- Performance considerations
- Spec compliance verification
- Documentation completeness

**Automated Review Checks:**

1. **Code Quality Analysis:**
   - Check code complexity and cyclomatic complexity
   - Identify code smells and anti-patterns
   - Verify proper error handling
   - Check for potential bugs or edge cases
   - Validate naming conventions

2. **Spec Compliance Check:**
   - Verify all implementation tasks from the phase are completed
   - Check that technical requirements are met
   - Validate success criteria are satisfied
   - Ensure no deviations from the spec without justification

3. **Security Review:**
   - Check for common security vulnerabilities (SQL injection, XSS, etc.)
   - Validate input sanitization
   - Check authentication/authorization implementation
   - Review sensitive data handling
   - Verify dependency security (if applicable)

4. **Performance Review:**
   - Identify potential performance bottlenecks
   - Check for inefficient algorithms or data structures
   - Review database query optimization (if applicable)
   - Check memory usage patterns
   - Identify unnecessary computations

5. **Documentation Review:**
   - Verify code comments are present and helpful
   - Check that public APIs are documented
   - Validate inline documentation accuracy
   - Ensure complex logic is explained

**Review Report Generation:**
Generate a comprehensive review report with:
- Summary of findings (critical, major, minor issues)
- Specific issues with file locations and line numbers
- Recommendations for fixes
- Overall quality score
- Approval status (approve, approve with changes, needs revision)

**Automatic Issue Resolution:**
- For minor issues (style, formatting): Auto-fix if possible
- For major issues (logic, security): Report and recommend fixes
- For critical issues (blocking): Block phase completion until resolved

**Review Outcome:**
```
=== Code Review Report ===

Overall Quality Score: [X]%
Status: [APPROVED / APPROVED WITH CHANGES / NEEDS REVISION]

Critical Issues: [N]
Major Issues: [N]
Minor Issues: [N]

[Detailed findings...]

Recommended Actions:
- [ ] Fix critical issue 1
- [ ] Address major issue 2
- [ ] Consider minor issue 3

Proceed with implementation?
- Type 'approve' to accept and continue
- Type 'fix' to address issues before proceeding
- Type 'retry' to re-implement this phase
```

**If user selects 'approve':**
- Mark review as complete
- Proceed to documentation generation
- Note any approved-with-changes items for future reference

**If user selects 'fix':**
- Implement the recommended fixes
- Re-run code quality checks
- Re-generate review report
- Ask for approval again

**If user selects 'retry':**
- Roll back to checkpoint
- Re-implement the phase with review feedback in mind

### 17. Generate Documentation

Automatically generate documentation for the implemented code:

**Documentation Types to Generate:**

1. **API Documentation:**
   - Extract API endpoints, methods, and signatures
   - Generate documentation for public interfaces
   - Include request/response formats
   - Add usage examples
   - Document authentication/authorization requirements

2. **Code Documentation:**
   - Generate inline code comments if missing
   - Create README files for new modules/components
   - Document complex algorithms and business logic
   - Add architecture diagrams where appropriate

3. **User Documentation:**
   - Generate user guides for new features
   - Create usage documentation
   - Add screenshots or examples where applicable
   - Document configuration options

4. **Developer Documentation:**
   - Update project README with new features
   - Document setup/installation changes
   - Add contribution guidelines for new code
   - Document environment variables and configuration

**Documentation Generation Process:**

1. **Analyze Implemented Code:**
   - Identify new files and modified files
   - Extract public APIs, classes, and functions
   - Identify configuration changes
   - Determine documentation requirements

2. **Generate Documentation Files:**
   - Create or update API documentation
   - Generate code comments where needed
   - Create user guides for new features
   - Update project-level documentation

3. **Validate Documentation:**
   - Ensure documentation is accurate and complete
   - Check for consistency with implementation
   - Verify examples work correctly
   - Validate links and references

**Documentation Output:**
```
=== Documentation Generation ===

Generated documentation:
- API docs: docs/api/[feature].md
- Code docs: Updated inline comments in [files]
- User guide: docs/user/[feature].md
- Project README: Updated with new features

Documentation coverage: [X]%
```

**Documentation Storage:**
- Store generated documentation in appropriate directories (docs/, README.md, inline comments)
- Commit documentation changes with the implementation
- Ensure documentation is versioned with the code

**Skip Documentation Option:**
If the user prefers to write documentation manually, provide an option to skip automatic generation:
```
Would you like to generate documentation automatically?
- Type 'yes' to generate documentation automatically
- Type 'no' to skip and write documentation manually
```

**If user selects 'no':**
- Skip automatic documentation generation
- Add a reminder to create documentation before deployment
- Proceed to progress update
- Note that documentation should be created before production deployment

### 18. Update Progress

If user approves:

- Update `.specs-progress.json` to mark the phase as completed
- Record completion timestamp
- Update specVersion field with the version used for implementation
- Save the progress file

### 19. Save Code (User Action)

Instruct the user to save the changes:

```
Please save the changes for this phase:

- [Brief summary of what was implemented]
- [Key features added]
- [Files created/modified]

After saving, type 'continue' to proceed to the next phase.
```

### 20. Clean Up Checkpoint

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

### 21. Continue to Next Phase

Repeat steps 7-20 for the next incomplete phase.

### 22. Completion

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
