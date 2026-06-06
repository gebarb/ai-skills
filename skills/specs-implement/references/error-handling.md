---
description: Error handling and rollback for spec implementation
---

# Spec Implementation Error Handling

This file contains error handling and rollback procedures for the spec implementation workflow.

**Table of Contents:**
- [Error Handling](#error-handling)
- [Selective Rollback](#selective-rollback)
- [Multi-Phase Rollback](#multi-phase-rollback)
- [Resuming from Interruption](#resuming-from-interruption)

## Error Handling

If an error occurs during implementation:

1. Report the error clearly to the user
2. Show which task failed
3. Provide context about what was being implemented
4. Show relevant error messages or stack traces
5. Categorize the error (fatal, recoverable, warning)
6. Ask user how to proceed:
   - 'retry' to attempt the task again
   - 'skip' to skip the failing task (with warning)
   - 'rollback' to revert to checkpoint and try different approach
   - 'selective-rollback' to revert specific files/tasks
   - 'exit' to stop and save progress

**Additional Edge Cases:**

**Disk Space Exhaustion:**
- If checkpoint creation fails due to insufficient disk space:
  - Report available disk space and required space
  - Offer options:
    - 'cleanup' to remove old checkpoints and retry
    - 'continue' to proceed without checkpoint (with warning)
    - 'exit' to stop and free up disk space manually
  - If user chooses 'cleanup':
    - Remove all checkpoints except the most recent
    - Retry checkpoint creation

**Spec File Deletion During Implementation:**
- If a spec file is deleted during implementation:
  - Detect missing file when attempting to read phase file
  - Report which file is missing
  - Offer options:
    - 'restore' to restore from git history if available
    - 'exit' to stop and investigate
    - 'skip' to skip the affected phase (not recommended)

**File Lock Issues:**
- If progress file or checkpoint files are locked by another process:
  - Report which file is locked and by which process (if detectable)
  - Wait up to 30 seconds for lock to release
  - If lock doesn't release:
    - Offer options:
      - 'retry' to wait another 30 seconds
      - 'force' to attempt to override lock (risky)
      - 'exit' to stop and resolve lock manually

**Git Repository State Issues:**
- If git repository has uncommitted changes during checkpoint creation:
  - Warn user about uncommitted changes
  - Offer options:
    - 'commit' to commit changes first
    - 'stash' to stash changes temporarily
    - 'continue' to proceed with committed state only
    - 'exit' to stop and handle changes manually

**Error Categories:**
- **Fatal**: Cannot proceed without fixing (e.g., compilation error, missing dependency)
- **Recoverable**: Can work around or fix with minimal changes
- **Warning**: Non-critical issue that should be addressed but doesn't block progress

**Error Recovery Examples:**

**Example 1: Compilation Error (Fatal)**
```
=== Error: Compilation Failed ===

Task: Create user authentication component
File: src/auth/UserAuth.tsx
Error: TS2307: Cannot find module '@types/react' or its corresponding type declarations.

This is a fatal error. The module is missing and compilation cannot proceed.

Options:
- 'retry' after installing missing dependencies
- 'exit' to stop and manually fix dependencies
```

**Example 2: Test Failure (Recoverable)**
```
=== Error: Test Failed ===

Task: Implement user login validation
File: src/auth/login.test.ts
Error: 2 of 5 tests failed:
  - test('valid credentials') failed: Expected true, got false
  - test('invalid password') failed: Timeout after 5000ms

This is a recoverable error. The implementation may have bugs.

Options:
- 'retry' after fixing the implementation
- 'skip' this task and continue (not recommended)
- 'rollback' to checkpoint and try different approach
```

**Example 3: Linter Warning (Warning)**
```
=== Warning: Code Style Issues ===

Task: Create data model for tasks
File: src/models/Task.ts
Warning: 3 linter warnings found:
  - Line 15: Unused variable 'tempData'
  - Line 23: Missing semicolon
  - Line 45: Function too long (45 lines, max 30)

These are non-critical warnings but should be addressed.

Options:
- 'continue' to proceed (warnings will be fixed later)
- 'retry' after fixing the warnings
- 'skip' this task
```

## Selective Rollback

If user chooses selective rollback:
```
=== Selective Rollback ===

Which files/tasks would you like to rollback?

1. Specific files (list modified files)
2. All changes since checkpoint

Select option (1-2):
```

**AI Execution Instructions for Selective Rollback:**

**Option 1 - Specific Files:**
1. List all files modified since the checkpoint was created:
   - If git repository exists: Use `git diff --name-only HEAD` to get modified files
   - If no git repository: Compare file modification times with checkpoint timestamp
2. Present the list of modified files to the user
3. Ask user which files to rollback
4. Restore selected files from the checkpoint directory
5. Verify the restore was successful

**Option 2 - All Changes Since Checkpoint:**
- Same as full rollback (see Rollback Process below)

**Rollback Process:**
If user chooses full rollback:
- Restore from checkpoint backup
- Remove checkpoint backup after successful rollback

If user chooses selective rollback:
- Restore specific files from checkpoint backup
- Keep successful changes
- Remove only problematic files

Then offer options:
- 'retry' to attempt implementation again
- 'skip' to skip this phase entirely
- 'continue' to proceed with partial implementation
- 'exit' to stop workflow

## Multi-Phase Rollback

If you need to rollback multiple completed phases:

**Rollback Scenarios:**
- Critical bug discovered in an earlier phase
- Spec changes require re-implementation of multiple phases
- Architecture decision needs to be revisited
- Testing reveals fundamental issues

**Rollback Process:**
```
=== Multi-Phase Rollback ===

Which phases would you like to rollback?

1. Last N phases (e.g., last 2 phases)
2. Specific phases (select from list)
3. Rollback to specific milestone
4. Rollback to specific phase

Select option (1-4):
```

**Rollback to Specific Phase:**
- Identify the checkpoint for target phase
- Restore from checkpoint backup
- Update progress file to mark phases as pending
- (phases after target phase become pending again)

**Rollback Impact Analysis:**
- Identify all phases that will be affected
- Check for dependencies on rolled-back phases
- Warn about cascading effects
- Suggest which phases need re-implementation

**Progress File Update:**
- Mark rolled-back phases as pending
- Clear task progress for rolled-back phases
- Update completion timestamps
- Preserve history of what was completed (for reference)

**Re-Implementation Strategy:**
- After rollback, offer to re-implement phases
- Can re-implement with updated specs if available
- Can skip phases that are no longer needed
- Can modify implementation approach based on lessons learned

## Resuming from Interruption

If the workflow is interrupted:

1. Progress is saved in `.specs-progress.json`
2. Next run will resume from the last incomplete phase
3. User can choose to:
   - Continue from where left off
   - Re-implement the current phase (useful if partial implementation was done)
   - Skip to a specific phase
   - Resume from specific task within current phase

**Progress Visualization:**
Display current progress status:
```
=== Implementation Progress ===
Total Phases: 15
Completed: 5 (33%)
In Progress: 1
Pending: 9

Completed Phases:
✓ Phase 1: Foundation (8/8 tasks)
✓ Phase 2: First Feature (5/5 tasks)
✓ Phase 3: Second Feature (6/6 tasks)
...

Current Phase:
 Phase 3: Third Feature (3/5 tasks)
  ✓ Task 1: Create data model
  ✓ Task 2: Implement UI
  ✓ Task 3: Add business logic
  ○ Task 4: Write tests
  ○ Task 5: Documentation

Remaining Phases:
○ Phase 4: Fourth Feature
○ Phase 5: Fifth Feature
...
```

**Resume Options:**
- 'continue' to resume from last incomplete task
- 'task' to resume from specific task number
- 'phase' to re-implement entire current phase
- 'skip' to skip current phase and move to next

## Partial Phase Resumption

When a phase is partially implemented and the workflow is interrupted, you have several options for resuming:

**Scenario 1: Resume from Last Incomplete Task**
```
=== Partial Phase Detected ===

Phase 3: Third Feature is partially complete (3/5 tasks completed)
Last completed: Task 3 - Add business logic
Next task: Task 4 - Write tests

Resume options:
- 'continue' to resume from Task 4 (recommended)
- 'task' to specify a different task number
- 'phase' to re-implement entire Phase 3
- 'skip' to skip Phase 3 and move to Phase 4
```

**Scenario 2: Resume from Specific Task**
If you want to resume from a specific task (e.g., if the last task was problematic):
```
=== Resume from Specific Task ===

Phase 3: Third Feature (3/5 tasks completed)

Available tasks:
- Task 1: Create data model (completed)
- Task 2: Implement UI (completed)
- Task 3: Add business logic (completed)
- Task 4: Write tests (pending)
- Task 5: Documentation (pending)

Enter task number to resume from (1-5):
```

**Scenario 3: Re-implement Entire Phase**
If the partial implementation has issues or you want a fresh start:
```
=== Re-implement Phase ===

Phase 3: Third Feature is partially complete (3/5 tasks)

Re-implementing will:
- Roll back to the checkpoint for Phase 3
- Mark all tasks as pending
- Start implementation from Task 1

Proceed with re-implementation?
- 'yes' to re-implement Phase 3
- 'no' to choose a different option
```

**Scenario 4: Skip Partial Phase**
If the partial implementation is not critical or will be addressed later:
```
=== Skip Partial Phase ===

Phase 3: Third Feature is partially complete (3/5 tasks)

Skipping will:
- Mark Phase 3 as 'skipped' in progress file
- Move to Phase 4
- Note that Phase 3 dependencies may affect later phases

Proceed with skip?
- 'yes' to skip Phase 3
- 'no' to choose a different option
```

**Partial Phase Resumption Procedure:**

**AI Execution Instructions:**

1. **Detect Partial Phase:**
   - Read `.specs-progress.json`
   - Check if any phase has status "in-progress"
   - Count completed tasks vs total tasks for that phase
   - If tasksCompleted < totalTasks, phase is partial

2. **Assess Implementation State:**
   - Check if checkpoint exists for the partial phase
   - Identify which files were modified/created
   - Determine if the partial implementation is usable
   - Check for compilation errors or test failures

3. **Present Resume Options:**
   - Show current progress status
   - List completed and pending tasks
   - Offer resume options based on assessment
   - Warn about dependencies if skipping

4. **Handle User Selection:**
   - **If 'continue':** Resume from next pending task
   - **If 'task N':** Resume from specified task number
   - **If 'phase':** Roll back to checkpoint and re-implement entire phase
   - **If 'skip':** Mark phase as skipped and move to next phase

5. **Update Progress File:**
   - If resuming from task: Update task statuses accordingly
   - If re-implementing: Reset all tasks to pending
   - If skipping: Mark phase status as "skipped"
   - Add audit log entry for resumption action

**Partial Phase Validation:**

Before resuming, validate the partial implementation:

**Check Compilation:**
- Run language-specific compiler/linter
- Check for syntax errors
- Verify imports are valid
- Report any compilation errors

**Check Tests:**
- Run existing tests if available
- Check for test failures
- Identify which tests pass/fail
- Report test status to user

**Check Dependencies:**
- Verify partial implementation doesn't break dependent phases
- Check if skipped tasks are critical for next phases
- Warn about potential issues

**Partial Phase Best Practices:**

**When to Continue:**
- Partial implementation is stable and compiles
- Completed tasks are working correctly
- Remaining tasks are independent of completed ones
- No major issues with the partial implementation

**When to Re-implement:**
- Partial implementation has compilation errors
- Completed tasks have bugs or issues
- Architecture decisions need to be revisited
- Partial implementation is not salvageable

**When to Skip:**
- Phase is optional or can be deferred
- Partial implementation will be addressed in a later phase
- Phase features are not critical for current work
- User wants to proceed with a different approach

**Partial Phase Rollback:**

If re-implementing a partial phase:

1. **Restore Checkpoint:**
   - Locate checkpoint for the partial phase
   - Restore files from checkpoint
   - Verify restoration was successful

2. **Reset Progress:**
   - Set all task statuses to "pending"
   - Clear completion timestamps
   - Reset phase status to "pending"
   - Update audit log

3. **Re-implement:**
   - Start implementation from Task 1
   - Follow normal implementation flow
   - Create new checkpoint before implementation

**Partial Phase Example:**

```
=== Partial Phase Resumption Example ===

Phase: Phase 3 - User Authentication
Status: Partial (4/7 tasks completed)
Checkpoint: phase-3-20240115-143022

Completed Tasks:
✓ Task 1: Create user model
✓ Task 2: Implement authentication service
✓ Task 3: Add login UI component
✓ Task 4: Add registration UI component

Pending Tasks:
○ Task 5: Implement password reset
○ Task 6: Add session management
○ Task 7: Write authentication tests

Assessment:
- Compilation: No errors
- Tests: Not yet run
- Dependencies: Phase 4 depends on Phase 3

Recommendation: Continue from Task 5

Options:
- 'continue' to resume from Task 5 (recommended)
- 'task 6' to skip Task 5 and resume from Task 6
- 'phase' to re-implement entire Phase 3
- 'skip' to skip Phase 3 (not recommended - Phase 4 depends on it)
```
