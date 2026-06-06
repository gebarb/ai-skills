---
description: Implement specs and phases from a repository - Setup Preparation Phase (Steps 7-11)
---

# Spec Implementation Workflow - Setup Preparation Phase

This is the setup preparation phase of the specs-implement workflow, covering Steps 7-11: Phase determination, overview display, testing approach confirmation, user confirmation, and checkpoint creation.

**Table of Contents:**
- [Workflow Steps](#workflow-steps)
  - [7. Determine Next Phase](#7-determine-next-phase)
  - [8. Display Phase Overview](#8-display-phase-overview)
  - [9. Confirm Testing Approach (TDD Prompt)](#9-confirm-testing-approach-tdd-prompt)
  - [10. Request User Confirmation](#10-request-user-confirmation)
  - [11. Create Implementation Checkpoint](#11-create-implementation-checkpoint)
- [Continue to Implementation Phase](#continue-to-implementation-phase)

**Note**: Technology stack selection (language, frameworks, architecture, etc.) is handled in the specs-create workflow. This implementation workflow uses the technology decisions documented in the specs.

For the complete workflow, see:
- Setup Initialization Phase: `setup-initialization.md` (Steps 1-6)
- Setup Preparation Phase: This file (Steps 7-11)
- Implementation Phase: `implementation.md` (Steps 12-22)

## Workflow Steps

### 7. Determine Next Phase

Based on `.specs-progress.json`, resolved dependencies, and user's phase selection, identify the next phase to implement.

- If all phases are complete, report completion and exit
- If user selected a specific phase in step 3, use that phase (validate dependencies first)
- If some phases are complete, find the first incomplete phase with satisfied dependencies
- If no progress file exists, start with the first phase
- If user skipped phases, confirm they want to proceed with available phases

**Phase Selection Override:**
If user selected a specific phase in step 3:
- Validate that all dependencies for the selected phase are satisfied
- If dependencies not satisfied, warn user and suggest starting from earlier phase
- Ask user to confirm or change selection
- Mark earlier phases as completed in progress file if user confirms

**Phase Selection Options:**
1. **Sequential**: Implement phases one at a time in dependency order
2. **Selective**: User chooses which phase to implement next from available options

### 8. Display Phase Overview

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

### 9. Confirm Testing Approach (TDD Prompt)

Before requesting user confirmation, ask about the testing approach. This ensures the user sees the complete implementation plan (including testing approach) before confirming.

```
=== Testing Approach ===

Would you like unit tests created for this phase implementation?

- Type 'yes' to create comprehensive unit tests
- Type 'no' to skip unit test creation
- Type 'later' to create tests later (not recommended for production code)
```

**Guidance on Testing Approach Selection:**
- **Use TDD (test-driven development)** when:
  - Implementing complex business logic with clear requirements
  - Working on critical paths where correctness is essential
  - The phase has well-defined success criteria that can be tested
  - You want to ensure testability from the start
  - The project has a strong testing culture

- **Use standard approach (implementation first, then tests)** when:
  - Implementing UI components that require visual verification
  - Working on exploratory or experimental features
  - The requirements are still evolving
  - You need to see the implementation to understand what to test
  - Time constraints favor rapid prototyping

- **Skip tests** when:
  - The phase is purely configuration or documentation
  - You're creating a proof-of-concept or prototype
  - Tests will be added in a dedicated testing phase later
  - (Note: Not recommended for production code)

**If user selects 'yes':**
Ask about TDD approach:
```
Would you like to use Test-Driven Development (TDD)?

- Type 'tdd' to use TDD approach (write tests first, then implementation)
- Type 'standard' to write implementation first, then tests
```

**If user selects 'tdd':**
- Set implementation mode to TDD
- Tests will be written before implementation code
- Implementation will be driven by making tests pass
- This ensures tests drive the design

**If user selects 'standard':**
- Set implementation mode to standard
- Implementation will be written first
- Tests will be written after implementation
- This is the traditional approach

**If user selects 'no':**
- Skip unit test creation
- Note that this is not recommended for production code
- Proceed to user confirmation
- Consider adding tests later before deployment

**If user selects 'later':**
- Skip unit test creation for now
- Add a reminder to create tests before deployment
- Proceed to user confirmation
- Note that tests should be created before production deployment

**Testing Approach Storage:**
Store the chosen testing approach in the progress file or temporary state for the current phase to ensure the implementation follows the selected approach.

### 10. Request User Confirmation

After the testing approach is confirmed, ask the user to confirm before proceeding:

```
Ready to implement [Phase Name] with [testing approach]?
- Type 'yes' to proceed
- Type 'skip' to skip this phase
- Type 'exit' to stop the workflow
```

**Input Validation:**
- If user provides invalid input (not 'yes', 'skip', or 'exit'):
  - Display error message: "Invalid input. Please type 'yes', 'skip', or 'exit'."
  - Re-prompt for valid input
  - Allow up to 3 invalid attempts before offering to exit
- If user provides partial match (e.g., 'y' instead of 'yes'):
  - Accept partial match if unambiguous
  - Confirm interpretation with user if ambiguous
- If user provides no input (empty):
  - Re-prompt with clarification
  - Allow up to 3 empty responses before offering to exit

**Timeout Handling:**
- If user does not respond within 5 minutes:
  - Display timeout message: "No response received. Waiting for user input..."
  - Wait an additional 5 minutes
  - If still no response after 10 minutes total:
    - Offer options:
      - 'continue' to proceed with default action (typically 'yes' for confirmations)
      - 'exit' to stop the workflow and save progress
      - 'wait' to continue waiting for user input
- If user selects 'continue':
  - Proceed with default action and document the timeout in progress file
- If user selects 'exit':
  - Save current progress and exit workflow
- If user selects 'wait':
  - Continue waiting for user input (no timeout limit)

### 11. Create Implementation Checkpoint

Before implementing, create a checkpoint for potential rollback:

**AI Execution Instructions:**

1. **Create checkpoint directory:**
   - Create `.phase-checkpoints/` directory if it doesn't exist

2. **Create timestamped checkpoint:**
   - Generate a timestamp in format: YYYYMMDD-HHMMSS
   - Create checkpoint name: `phase-{PHASE_NUMBER}-{TIMESTAMP}`
   - Create checkpoint directory: `.phase-checkpoints/{CHECKPOINT_NAME}/`

3. **Create backup:**
   - **If git repository exists:**
     - Use `git archive` to create a clean backup of committed state
     - If there are uncommitted changes, note them to the user
     - Store the archive in the checkpoint directory
   - **If no git repository:**
     - Copy all files to the checkpoint directory
     - Exclude the `.phase-checkpoints/` directory itself

4. **Verify checkpoint:**
   - Confirm the checkpoint was created successfully
   - Report the checkpoint location to the user

5. **Handle checkpoint creation failure:**
   - If checkpoint creation fails:
     - Report the specific error to the user
     - Offer options:
       - 'continue' to proceed without checkpoint (with warning)
       - 'retry' to attempt checkpoint creation again
       - 'exit' to stop the workflow
     - If user chooses to continue without checkpoint:
       - Document that no checkpoint is available for this phase
       - Proceed with implementation but note that rollback will not be possible

6. **Store checkpoint info:**
   - Record the checkpoint name in the progress file or temporary state
   - This will be used for rollback if needed

**Checkpoint Strategy:**
- Create a backup of current code state before phase implementation
- Store backup in `.phase-checkpoints/` directory
- Name checkpoints with phase number and timestamp
- Clean up stale checkpoints periodically

**Checkpoint Cleanup:**
- **Automatic cleanup**: After each successful phase completion, automatically clean up the checkpoint for that phase
- **Periodic cleanup**: Keep only the 5 most recent checkpoints in `.phase-checkpoints/` directory
  - Run automatic cleanup after each phase completion
  - Delete older checkpoints to prevent disk space accumulation
- **Manual cleanup**: Users can manually clean up checkpoints using:
  ```bash
  # Clean up all checkpoints (platform-agnostic)
  rm -rf .phase-checkpoints/phase-*

  # Clean up specific checkpoint
  rm -rf .phase-checkpoints/phase-3-20240115-103045
  ```

**Checkpoint Cleanup Timing:**
The workflow uses a two-tier cleanup strategy:
1. **Immediate cleanup**: After successful phase completion, the checkpoint for that specific phase is removed
2. **Periodic maintenance**: After each phase completion, the workflow checks the total number of checkpoints and keeps only the 5 most recent

This ensures:
- Checkpoints don't accumulate indefinitely
- Recent checkpoints are available for reference
- Disk space is managed automatically
- Users can still manually clean up if needed

**Audit Log Retention:**
The audit log in `.specs-progress.json` grows with each action. To manage this:
- No automatic cleanup of audit log entries (preserves complete history)
- Audit log typically grows to 1-2 KB per 100 actions
- For long-running projects, consider manual cleanup of old audit entries
- Export audit log for compliance reporting if needed
- Audit log can be truncated manually by editing the progress file (with caution)

## Continue to Implementation Phase

For the implementation steps (Steps 12-22), see `implementation.md`.
