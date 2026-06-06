---
description: Implement specs and phases from a repository - Implementation Phase (Steps 12-21)
---

# Spec Implementation Workflow - Implementation Phase

This is the implementation phase of the specs-implement workflow, covering Steps 12-21: Implement phase (with TDD support if selected), code quality checks, test execution, verification, automatic code review, documentation generation, progress update, save code, cleanup checkpoint, continue to next phase, and completion.

**Table of Contents:**
- [Workflow Steps](#workflow-steps)
  - [12. Implement Phase](#12-implement-phase)
  - [13. Run Code Quality Checks](#13-run-code-quality-checks)
  - [14. Execute Tests](#14-execute-tests)
  - [15. Verify Implementation](#15-verify-implementation)
  - [16. Perform Automatic Code Review](#16-perform-automatic-code-review)
  - [17. Generate Documentation](#17-generate-documentation)
  - [18. Update Progress](#18-update-progress)
  - [19. Save Code (User Action)](#19-save-code-user-action)
  - [20. Clean Up Checkpoint](#20-clean-up-checkpoint)
  - [21. Continue to Next Phase](#21-continue-to-next-phase)
  - [22. Completion](#22-completion)
- [Reference Materials](#reference-materials)

**Note**: Technology stack selection (language, frameworks, architecture, etc.) is handled in the specs-create workflow. This implementation workflow uses the technology decisions documented in the specs.

For the complete workflow, see:
- Setup Phase: `setup.md` (Steps 1-11)
- Implementation Phase: This file (Steps 12-21)

## Workflow Steps

### 12. Implement Phase

If user confirms, read the phase file and implement it using the following methodology:

**AI Execution Instructions:**

1. **Check Testing Approach:**
   - Review the testing approach selected in Step 10 (Setup Phase)
   - If TDD mode: Write tests first, then implement code to make tests pass
   - If standard mode: Write implementation first, then write tests
   - If no tests: Skip test creation entirely

2. **Analyze the Phase File:**
   - Read the phase file completely
   - Extract all implementation tasks grouped by category
   - Identify technical requirements and constraints
   - Note success criteria for verification

3. **Identify Implementation Scope:**
   - Determine which files need to be created
   - Determine which files need to be modified
   - Identify any new directories or structures needed
   - Check for conflicts with existing code

4. **Generate Code Following Project Patterns:**
   - Examine existing code structure and patterns
   - **Identify naming conventions** by reviewing existing files:
     - Variable naming: camelCase, snake_case, or PascalCase?
     - File naming: kebab-case, camelCase, or snake_case?
     - Class/function naming conventions
     - Directory structure patterns
   - **Identify architectural patterns**:
     - Is there a clear separation of concerns (MVC, MVVM, layered architecture)?
     - Are services/repositories used for data access?
     - Is dependency injection used?
     - Are there specific patterns for state management?
   - **Identify coding standards**:
     - Comment style and documentation requirements
     - Error handling patterns
     - Logging conventions
     - Testing patterns
   - Document findings before implementing
   - Follow established naming conventions
   - Maintain consistency with existing architecture
   - Use appropriate design patterns (MVC, repository pattern, etc.)

5. **Implement Tasks Systematically:**
   - Start with foundational tasks (models, services)
   - Move to UI components
   - Implement business logic
   - Add integration points
   - Report progress as each task completes

6. **Handle Errors Gracefully:**
   - If a task fails, report the specific error
   - Show context of what was being implemented
   - Offer options: retry, skip task, or rollback to checkpoint

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

**AI Execution Instructions:**

1. **Identify the project type** to determine which tools to use:
   - Check for presence of configuration files:
     - `pubspec.yaml` → Flutter/Dart
     - `package.json` → JavaScript/TypeScript/Node.js
     - `requirements.txt`, `setup.py`, `pyproject.toml` → Python
     - `go.mod` → Go
     - `pom.xml` → Java/Maven
     - `build.gradle` → Java/Gradle
     - `Cargo.toml` → Rust
     - `Gemfile` → Ruby
   - Check file extensions in the codebase:
     - `.dart` files → Dart
     - `.js`, `.ts`, `.jsx`, `.tsx` files → JavaScript/TypeScript
     - `.py` files → Python
     - `.go` files → Go
   - If project type cannot be determined, ask user to specify
   - Flutter/Dart: Use `flutter analyze` and `dart format`
   - JavaScript/TypeScript: Use `eslint` and `prettier`
   - Python: Use `pylint`, `flake8`, or `black`
   - Go: Use `gofmt` and `go vet`
   - Other: Use appropriate linters for the language

2. **Run linter:**
   - Execute the appropriate linter command
   - Capture all output
   - Categorize issues by severity (error, warning, info)

3. **Check formatting:**
   - Run the appropriate formatter
   - Check if files need formatting
   - If auto-fix is available, offer to run it

4. **Verify type safety** (if applicable):
   - Run type checker (e.g., `tsc` for TypeScript, `mypy` for Python)
   - Report any type errors

5. **Check imports:**
   - Identify unused imports
   - Identify missing dependencies
   - Report any import issues

6. **Report results to user:**
   - Show total issues found by severity
   - Show specific file locations for each issue
   - Offer to auto-fix minor issues
   - For major issues, ask user how to proceed
   - All critical errors must be resolved before proceeding

**Issue Severity Levels:**
- **Error**: Blocks compilation or runtime (must fix)
- **Warning**: Potential issues (should fix)
- **Info**: Style or best practice suggestions (optional)

### 14. Execute Tests

Run tests to verify implementation:

**AI Execution Instructions:**

1. **Test Existence Check:**
   - Check if a test framework is configured and tests exist:
     - Check for `package.json` with test scripts (JavaScript/TypeScript)
     - Check for `pytest.ini`, `setup.py`, or `tests/` directory (Python)
     - Check for `*_test.go` files (Go)
     - Check for `Makefile` with test targets
     - Check for other project-specific test indicators
   - If no test framework detected:
     - Warn user that no test framework was detected
     - Ask user to confirm:
       - 'continue' to proceed without tests (not recommended for production code)
       - 'setup' to set up a test framework first
       - 'exit' to stop and set up testing manually
     - If user chooses 'continue', proceed to verification with warning
     - If user chooses 'setup', provide guidance on setting up appropriate test framework
   - If test framework detected: Proceed to run tests

2. **Run Tests:**
   - Execute the appropriate test command for the project type:
     - JavaScript/TypeScript: `npm test` or `yarn test`
     - Python: `pytest` or `python -m pytest`
     - Go: `go test ./...`
     - Flutter/Dart: `flutter test`
     - Other: Use appropriate test command
   - Capture all test output

3. **Check Test Coverage** (if applicable):
   - Run coverage command for the project type
   - Check if coverage meets requirements (minimum 80% unless specified otherwise in phase)
   - Generate coverage report

4. **Report Test Results:**
   - Show total tests run, passed, failed, skipped
   - Show coverage percentage
   - If all tests pass: proceed to verification
   - If tests fail: show failing tests with error messages and ask how to proceed
     - 'fix' to attempt to fix failing tests
     - 'skip' to proceed despite failures (not recommended)
     - 'rollback' to revert to checkpoint
   - If no tests were run (no test framework): note this and proceed to verification with a warning

**Test Categories:**
- **Unit Tests**: Test individual functions, classes, and components in isolation
- **Integration Tests**: Test interactions between multiple components
- **Widget/UI Tests**: Test UI components and user interactions
- **End-to-End Tests**: Test complete user flows (if applicable)
- **Performance Tests**: Test performance characteristics (if specified)

**Test Coverage Requirements:**
- Minimum 80% code coverage for new code (unless specified otherwise in phase)
- Critical paths must have 100% coverage
- Edge cases and error paths should be tested

**Test Failure Triage:**
- Identify root cause of failure
- Determine if failure is in implementation or test itself
- If test is incorrect, update test
- If implementation is incorrect, fix implementation
- Re-run tests after fixes

### 15. Verify Implementation

After implementation, verify the success criteria:

**AI Execution Instructions:**

1. **Read the phase file** to get the success criteria
2. **Check each success criterion systematically:**
   - For each criterion in the phase file:
     - Determine how to verify it (manual testing, automated test, code review, etc.)
     - Perform the verification
     - Record the result (met/not met)
     - Add notes if applicable
3. **Report verification results:**
   - Show which criteria are met
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

Perform a comprehensive automatic code review of the implemented code.

For detailed code review instructions including code quality analysis, spec compliance check, security review, performance review, and documentation review, see `code-review.md`.

**AI Execution Instructions:**

1. **Read the phase file** to understand what was supposed to be implemented
2. **Identify all modified and created files** from the implementation
3. **Follow the detailed review process in `code-review.md`** to perform:
   - Code quality analysis
   - Spec compliance check
   - Security review
   - Performance review
   - Documentation review
4. **Generate a review report** with quality score and approval status
5. **Handle user response** (approve, fix, or retry)

### 17. Generate Documentation

Automatically generate documentation for the implemented code:

**AI Execution Instructions:**

1. **Identify what was implemented** by reviewing the phase file and modified files
2. **Generate the following documentation types:**

**API Documentation (if applicable):**
- Read all newly created or modified API-related files (controllers, routes, handlers)
- For each public API endpoint/function:
  - Extract the function signature
  - Identify parameters and their types
  - Identify return values and their types
  - Document the purpose and behavior
  - Add usage examples if appropriate
- Create or update `docs/api/` directory with documentation files
- Use markdown format with clear sections for each endpoint

**Code Documentation:**
- Review all newly created or modified code files
- For each file:
  - Add file-level header comments explaining the file's purpose
  - For each function/method/class:
    - Add doc comments explaining purpose, parameters, return values
    - Add inline comments for complex logic
    - Ensure existing comments are accurate
- For new modules/components, create a README.md in the module directory explaining:
  - Purpose of the module
  - How to use it
  - Dependencies
  - Examples

**User Documentation (if applicable):**
- Identify user-facing features from the phase implementation
- For each user-facing feature:
  - Create a user guide in `docs/user/` directory
  - Include:
    - Feature description
    - How to use the feature
    - Screenshots or examples (if applicable)
    - Configuration options
    - Common use cases

**Developer Documentation:**
- Update the project README.md with:
  - New features added in this phase
  - Any setup/installation changes
  - New dependencies added
  - Environment variables or configuration changes
- Update CONTRIBUTING.md if new contribution guidelines are needed
- Document any new development workflows or patterns introduced

3. **Validate the generated documentation:**
- Ensure all documentation is accurate and complete
- Check that code examples would actually work
- Verify all links and references are correct
- Ensure documentation is consistent with the implementation

4. **Handle Documentation Conflicts:**
   - Check if documentation files already exist before generating
   - If conflicts are detected:
     - Report the conflict to the user with file paths
     - Show a diff of existing vs. proposed changes
     - Offer options:
       - 'merge' to intelligently merge changes (preserve existing content, add new content)
       - 'overwrite' to replace existing documentation with generated content
       - 'skip' to skip documentation generation for conflicting files
       - 'backup' to create backup of existing files before overwriting
   - If user chooses 'merge':
     - Preserve existing sections that are still valid
     - Add new sections for newly implemented features
     - Update outdated sections with new information
     - Mark conflicts with TODO comments for manual review
   - If user chooses 'backup':
     - Create backup with timestamp: `docs/api/FILENAME.backup-YYYYMMDD-HHMMSS.md`
     - Proceed with overwriting
   - Document the conflict resolution choice in the progress file

4. **Generate a documentation summary report:**
```
=== Documentation Generation ===

Generated documentation:
- API docs: [list of files created/updated]
- Code docs: [list of files with comments added]
- User guide: [list of user guides created]
- Project README: Updated with [new features]

Documentation coverage: [X]%
```

**Documentation Storage:**
- Store API documentation in `docs/api/` directory
- Store user documentation in `docs/user/` directory
- Store code documentation inline in source files
- Update project-level documentation in repository root
- Commit documentation changes with the implementation

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

**AI Execution Instructions:**

1. **Read the current progress file** (`.specs-progress.json`)
2. **Update the phase status:**
   - Find the phase that was just completed
   - Change status from "in-progress" to "completed"
   - Add completion timestamp (current time in ISO 8601 format)
   - Update specVersion field with the version used for implementation
3. **Save the updated progress file**
4. **Report the update to the user**

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

**AI Execution Instructions:**

1. **Remove the checkpoint** for the completed phase:
   - Delete the checkpoint directory from `.phase-checkpoints/`
   - Confirm deletion was successful

2. **Optional: Clean up old checkpoints:**
   - List all checkpoints in `.phase-checkpoints/`
   - Sort by timestamp (newest first)
   - Keep the 5 most recent checkpoints
   - Delete the rest to prevent accumulation

**Cleanup Strategy:**
- Remove checkpoint backup from `.phase-checkpoints/` directory
- Keep only the most recent checkpoint if needed for reference
- Delete stale checkpoints periodically

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

**AI Execution Instructions:**

1. **Check if there are more phases** to implement:
   - Read the progress file
   - Check if any phases have status "pending"
2. **If there are more phases:**
   - Go back to Step 7 (Determine Next Phase) in setup.md
   - Select the next phase to implement
   - Continue with the implementation process
3. **If all phases are complete:**
   - Proceed to Step 22 (Completion)

### 22. Completion

When all phases are complete:

**AI Execution Instructions:**

1. **Verify all phases are complete:**
   - Read the progress file
   - Confirm all phases have status "completed"
2. **Generate completion report:**
   - Show total phases completed
   - Show total tasks completed
   - Show implementation timeline (if tracked)
3. **Provide next steps:**
   - Review the complete implementation
   - Run comprehensive tests
   - Deploy to production

**Completion Report:**
```
=== All Phases Complete ===

All specs and phases have been successfully implemented!

Progress saved to: .specs-progress.json

Total Phases: [N]
Total Tasks: [N]
Implementation Time: [duration]

Next steps:
- Review the complete implementation
- Run comprehensive tests
- Deploy to production
```

## Reference Materials

For detailed progress tracking, error handling, and guidelines, see:
- **Progress Tracking**: `progress.md` - Progress file format and validation
- **Error Handling**: `handling.md` - Error handling, rollback, and spec updates
