---
description: Error handling, rollback, and spec update handling for spec implementation
---

# Spec Implementation Error Handling

This file contains error handling, rollback, and spec update handling for the spec implementation workflow.

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

**Selective Rollback:**
If user chooses selective rollback:
```
=== Selective Rollback ===

Which files/tasks would you like to rollback?

1. Specific files (list modified files)
2. All changes since checkpoint

Select option (1-2):
```

**Note**: Options for task category rollback and last N tasks rollback are not currently available due to limitations in the progress file schema. These may be added in future versions.

Selective rollback allows:
- Reverting only problematic files while keeping successful changes
- Rolling back specific task categories
- Rolling back a specific number of recent tasks
- Preserving work that was successful

**Selective Rollback Implementation:**

**Note**: The helper functions `get_file_mtime` and `iso_to_epoch` used in the following sections are defined later in this document (see "Cross-platform Helper Functions" section below).

**Option 1 - Specific Files:**
```bash
# List modified files since checkpoint (prefer git if available)
if command -v git &> /dev/null && [ -d .git ]; then
  FILES_TO_ROLLBACK=$(git diff --name-only HEAD 2>/dev/null)
else
  # Fallback: use file modification times (cross-platform compatible)
  CHECKPOINT_TIME=$(get_file_mtime ".phase-checkpoints/${CHECKPOINT_NAME}")
  FILES_TO_ROLLBACK=""
  for file in $(find . -type f 2>/dev/null); do
    FILE_TIME=$(get_file_mtime "$file")
    if [ "$FILE_TIME" -gt "$CHECKPOINT_TIME" ]; then
      FILES_TO_ROLLBACK="$FILES_TO_ROLLBACK$file\n"
    fi
  done
fi

# Restore specific files from checkpoint
for file in $FILES_TO_ROLLBACK; do
  cp ".phase-checkpoints/${CHECKPOINT_NAME}/$file" "$file"
done
```

**Option 2 - Task Category:**
- Identify files modified by task category based on phase file task list
- Restore files associated with that category
- **Note**: This option requires tracking which files were created/modified per task category. Currently, the progress file schema does not include file-level tracking. This option is not available in the current implementation.

**Option 3 - Last N Tasks:**
- Track task completion order in progress file
- Identify files modified in last N tasks
- Restore those files from checkpoint
- **Note**: This option requires tracking task completion order and file modifications per task. Currently, the progress file schema does not include this level of detail. This option is not available in the current implementation.

**Option 4 - All Changes Since Checkpoint:**
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

## Spec Update Handling

If specs are updated during implementation:

**When to Run Detection:**
- At the start of each new phase implementation (Step 10)
- Before phase selection (Step 6) to ensure specs haven't changed
- After user confirmation to proceed with a phase
- This ensures spec changes are detected before implementation begins

**Detection:**
- Compare spec file modification time with phase start time
- Compare spec version in progress file with current spec version

**Implementation:**
```bash
#!/bin/bash
set -e  # Exit on error
set -u  # Exit on undefined variable

# Get current spec version from README with flexible parsing
# Supports multiple formats: "Spec Version: X.Y.Z", "Version: X.Y.Z", "vX.Y.Z"
CURRENT_SPEC_VERSION=$(awk '
  /Spec Version:|[Vv]ersion:/{
    match($0, /([0-9]+\.[0-9]+\.[0-9]+)/)
    if (RSTART > 0) {
      print substr($0, RSTART, RLENGTH)
      exit
    }
  }
  /^v[0-9]+\.[0-9]+\.[0-9]+/{
    match($0, /([0-9]+\.[0-9]+\.[0-9]+)/)
    if (RSTART > 0) {
      print substr($0, RSTART, RLENGTH)
      exit
    }
  }
  # Also check for version in YAML frontmatter if present
  /^version:|specVersion:/{
    match($0, /([0-9]+\.[0-9]+\.[0-9]+)/)
    if (RSTART > 0) {
      print substr($0, RSTART, RLENGTH)
      exit
    }
  }
' specs/README.md 2>/dev/null)

# Default to unknown if not found
CURRENT_SPEC_VERSION="${CURRENT_SPEC_VERSION:-unknown}"

# Get spec version from progress file (check if jq is available)
if command -v jq &> /dev/null; then
  PROGRESS_SPEC_VERSION=$(jq -r '.specVersion' .specs-progress.json 2>/dev/null || echo "unknown")
else
  # Fallback: parse JSON with basic tools
  PROGRESS_SPEC_VERSION=$(grep -o '"specVersion"[[:space:]]*:[[:space:]]*"[^"]*"' .specs-progress.json 2>/dev/null | sed 's/.*"specVersion"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/' || echo "unknown")
fi

# Check for spec file modifications
if command -v jq &> /dev/null; then
  PHASE_START_TIME=$(jq -r '.phases[] | select(.status=="in-progress") | .startedAt' .specs-progress.json 2>/dev/null)
else
  # Fallback: parse JSON with basic tools
  PHASE_START_TIME=$(grep -A 10 '"status":"in-progress"' .specs-progress.json 2>/dev/null | grep '"startedAt"' | head -1 | sed 's/.*"startedAt"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/' || echo "")
fi

# Cross-platform function to get file modification time in seconds
# This function attempts multiple methods to get file modification time
# It tries macOS stat, Linux stat, BSD stat, and Python as fallbacks
# Returns 0 if all methods fail
get_file_mtime() {
  local file="$1"
  if command -v stat &> /dev/null; then
    # Try macOS stat first (common on macOS systems)
    if stat -f "%m" "$file" &> /dev/null; then
      stat -f "%m" "$file"
    # Try Linux stat (common on Linux systems)
    elif stat -c "%Y" "$file" &> /dev/null; then
      stat -c "%Y" "$file"
    # Try BSD stat with different format (FreeBSD, etc.)
    elif stat -t "%s" "$file" &> /dev/null; then
      stat -t "%s" "$file"
    else
      # Fallback: use Python if available
      if command -v python3 &> /dev/null; then
        python3 -c "import os, sys; print(int(os.path.getmtime('$file')))" 2>/dev/null || echo "0"
      else
        echo "0"
      fi
    fi
  else
    # Fallback: use Python if available
    if command -v python3 &> /dev/null; then
      python3 -c "import os, sys; print(int(os.path.getmtime('$file')))" 2>/dev/null || echo "0"
    else
      echo "0"
    fi
  fi
}

# Cross-platform function to convert ISO timestamp to seconds
# This function attempts multiple methods to parse ISO 8601 timestamps
# It tries macOS date, GNU date, and Python as fallbacks
# Returns 0 if all methods fail
iso_to_epoch() {
  local iso_time="$1"
  if command -v date &> /dev/null; then
    # Try macOS date (BSD date)
    if date -j -f "%Y-%m-%dT%H:%M:%SZ" "$iso_time" +%s &> /dev/null; then
      date -j -f "%Y-%m-%dT%H:%M:%SZ" "$iso_time" +%s
    # Try Linux date with -d (GNU date)
    elif date -d "$iso_time" +%s &> /dev/null; then
      date -d "$iso_time" +%s
    # Try GNU date with --date (alternative format)
    elif date --date="$iso_time" +%s &> /dev/null; then
      date --date="$iso_time" +%s
    else
      # Fallback: use Python if available
      if command -v python3 &> /dev/null; then
        python3 -c "from datetime import datetime; import sys; print(int(datetime.strptime('$iso_time', '%Y-%m-%dT%H:%M:%SZ').timestamp()))" 2>/dev/null || echo "0"
      else
        echo "0"
      fi
    fi
  else
    # Fallback: use Python if available
    if command -v python3 &> /dev/null; then
      python3 -c "from datetime import datetime; import sys; print(int(datetime.strptime('$iso_time', '%Y-%m-%dT%H:%M:%SZ').timestamp()))" 2>/dev/null || echo "0"
    else
      echo "0"
    fi
  fi
}

# Check if any spec files were modified after phase start (cross-platform compatible)
if [ -n "$PHASE_START_TIME" ]; then
  PHASE_START_SECONDS=$(iso_to_epoch "$PHASE_START_TIME")
  
  if [ "$PHASE_START_SECONDS" != "0" ]; then
    MODIFIED_FILES=""
    for spec_file in specs/*.md; do
      if [ -f "$spec_file" ]; then
        FILE_TIME=$(get_file_mtime "$spec_file")
        if [ "$FILE_TIME" -gt "$PHASE_START_SECONDS" ]; then
          MODIFIED_FILES="$MODIFIED_FILES$spec_file\n"
        fi
      fi
    done
    if [ -n "$MODIFIED_FILES" ]; then
      echo "Spec files modified since phase start:"
      echo -e "$MODIFIED_FILES"
    fi
  fi
fi

# Enhanced detection: Use git diff if available to detect content changes
if [ -d .git ] && command -v git &> /dev/null; then
  # Get git commit hash at phase start (if available in progress file)
  # Compare current HEAD with phase start commit
  # This detects changes even if file modification times were restored
  if [ -n "$PHASE_START_TIME" ]; then
    # Find commit closest to phase start time
    PHASE_COMMIT=$(git rev-list -1 --before="$PHASE_START_TIME" HEAD 2>/dev/null)
    if [ -n "$PHASE_COMMIT" ]; then
      GIT_CHANGED_FILES=$(git diff --name-only "$PHASE_COMMIT" HEAD -- specs/*.md 2>/dev/null)
      if [ -n "$GIT_CHANGED_FILES" ]; then
        echo "Spec files changed in git since phase start:"
        echo "$GIT_CHANGED_FILES"
      fi
    fi
  fi
fi
```

**When Spec Changes Are Detected:**
```
=== Spec Update Detected ===

The following spec files have been modified since implementation started:
- specs/phase-3-third-feature.md (modified 2 hours ago)
- specs/README.md (modified 1 hour ago)

Spec version changed from 1.0.0 to 1.1.0

How would you like to proceed?
- 'continue' to continue with current spec version (may cause conflicts)
- 'restart' to restart current phase with updated spec
- 'merge' to attempt to merge spec changes with current implementation
- 'exit' to stop and review spec changes manually
```

**Update Impact Assessment:**
- Identify which phases are affected by spec changes
- Determine if changes are breaking or non-breaking
- Assess impact on completed phases
- Check if dependencies have changed

**Handling Breaking Changes:**
- If current phase is affected: restart phase implementation
- If completed phases are affected: may require re-implementation
- If dependencies changed: update dependency graph and re-validate
- Update spec version in progress file

**Handling Non-Breaking Changes:**
- Continue with current implementation
- Note changes for next phase
- Update spec version in progress file
- May need to adjust implementation to align with new spec

**Spec Version Locking:**
- Each phase implementation locks to a specific spec version
- Progress file records spec version for each phase
- Prevents mid-implementation spec changes from causing issues

**Spec Version Locking Implementation:**

When starting a phase implementation:
1. Capture the current spec version from specs/README.md
2. Store the spec version in the progress file for that phase:
   ```json
   {
     "name": "Phase 1: Foundation",
     "file": "specs/phase-1-foundation.md",
     "status": "in-progress",
     "startedAt": "2024-01-15T10:00:00Z",
     "specVersion": "1.0.0",
     "tasks": [...]
   }
   ```
3. During implementation, if spec files are modified:
   - Compare current spec version with locked version
   - If versions differ, warn user and offer options
   - Do not automatically update to new spec version

When completing a phase:
1. Verify the phase was implemented against the locked spec version
2. If spec version changed during implementation:
   - Ask user if they want to re-implement with new spec version
   - Or mark phase as complete with old spec version (noted in progress)
3. Update progress file with completion timestamp and final spec version

**Spec Version Mismatch Handling:**
If the locked spec version in the progress file doesn't match the current spec version in README:

- **Minor version change (e.g., 1.0.0 → 1.1.0)**: Warn user but allow continuation. Changes are likely additive.
- **Major version change (e.g., 1.0.0 → 2.0.0)**: Block implementation and require user confirmation. Changes may be breaking.
- **Patch version change (e.g., 1.0.0 → 1.0.1)**: Allow continuation with informational note. Changes are likely bug fixes only.

User options when mismatch detected:
- 'continue' - Proceed with current implementation against old spec version
- 'restart' - Restart phase implementation with new spec version
- 'review' - Stop and review spec changes manually before deciding

**Spec Version Locking Test Scenarios:**
To validate that spec version locking works correctly, test the following scenarios:

1. **Normal Implementation**: 
   - Start phase with spec v1.0.0
   - Complete phase without spec changes
   - Verify progress file records spec v1.0.0

2. **Spec Change During Implementation**:
   - Start phase with spec v1.0.0
   - Update spec to v1.1.0 during implementation
   - Verify warning is displayed
   - Test user options (continue, restart, merge)

3. **Spec Change Between Phases**:
   - Complete Phase 1 with spec v1.0.0
   - Update spec to v1.1.0
   - Start Phase 2
   - Verify version change detection and user confirmation

4. **Breaking Change Detection**:
   - Start phase with spec v1.0.0
   - Update spec to v2.0.0 (breaking change)
   - Verify breaking change warning
   - Test re-implementation flow

**Progress File Schema Update:**
Add `specVersion` field to each phase object in `.specs-progress.json`:
```json
{
  "repository": "user-provided",
  "lastUpdated": "2024-01-15T10:30:00Z",
  "specVersion": "1.0.0",
  "startPhase": null,
  "phases": [
    {
      "name": "Phase 1: Foundation",
      "file": "specs/phase-1-foundation.md",
      "status": "completed",
      "completedAt": "2024-01-15T09:00:00Z",
      "specVersion": "1.0.0",
      "tasksCompleted": 8,
      "totalTasks": 8,
      "tasks": [...]
    }
  ]
}
```

**Spec Version Change Approval:**
When completing a phase and before beginning the next phase, if spec version changes are detected:

```
=== Spec Version Change Detected ===

The spec version has changed from [old version] to [new version].

Would you like to proceed with the new spec version?
- Type 'yes' to proceed with the updated spec
- Type 'no' to continue with the previous spec version
- Type 'exit' to stop and review the changes manually
```

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
→ Phase 3: Third Feature (3/5 tasks)
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

## Customization

This workflow can be customized for different spec structures:

- **Sequential phases**: Phases numbered sequentially (Phase 1, 2, 3, 4...)
- **Categorized phases**: Phases organized by category (e.g., Foundational, Foundation, Core, Enhanced)
- **Custom dependencies**: If phases have complex dependencies beyond sequential

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

## Quality Metrics

**Spec Quality Metrics:**
- Phase completeness: % of required fields filled
- Task specificity: % of tasks that are actionable
- Success criteria measurability: % of criteria with action verbs
- Dependency complexity: average number of dependencies per phase
- Phase size appropriateness: % of phases within task count range

**Implementation Quality Metrics:**
- Code coverage: % of code covered by tests
- Test pass rate: % of tests passing
- Linter issues: number of linter warnings/errors
- Code quality score: composite score based on multiple factors
- Success criteria met: % of success criteria achieved

**Progress Metrics:**
- Phase completion rate: % of phases completed
- Task completion rate: % of tasks completed
- Average phase completion time: time per phase
- Implementation velocity: phases per week

**Quality Gates:**
- Minimum 80% code coverage required
- All tests must pass before phase completion
- No critical linter errors allowed
- All success criteria must be met
- Code must follow project style guidelines

## Documentation Generation

**Documentation to Create:**
- API documentation from code comments and public interfaces
- Architecture diagrams showing component dependencies and data flow
- Changelog tracking changes per phase, breaking changes, and new features
- Progress reports showing completed phases, current status, and upcoming phases
- Test reports showing coverage, results, and performance benchmarks

## Notes

- This workflow does NOT commit code automatically
- User must review and commit each phase
- Progress is tracked locally in `.specs-progress.json`
- The progress file should be committed to the repository for visibility
- Phase files can be updated after completion if needed (will require re-implementation)
- Checkpoints provide safety net for failed implementations
- Code quality checks ensure maintainability
- Test execution validates implementation correctness
- Spec version locking prevents mid-implementation conflicts
- Selective rollback allows fine-grained recovery from errors
- Multi-phase rollback supports recovery from fundamental issues
- Quality metrics provide objective measures of implementation quality

## Troubleshooting Guide

### Common Issues and Solutions

#### specs-create Workflow Issues

**Issue: Quality score is below 90%**
- **Cause**: Missing required fields, unclear success criteria, or too many/few tasks per phase
- **Solution**: 
  - Review phase files and ensure all required sections are present
  - Add action verbs to success criteria (verify, confirm, ensure, validate)
  - Adjust task count to be within 5-15 per phase
  - Reduce number of dependencies per phase to ≤3

**Issue: Circular dependency detected**
- **Cause**: Phase A depends on Phase B, and Phase B depends on Phase A
- **Solution**:
  - Review dependency graph in README Feature Matrix
  - Remove one of the circular dependencies
  - Consider merging phases if they have mutual dependencies
  - Re-validate after fixing

**Issue: Validation fails for phase naming**
- **Cause**: Phase file doesn't follow `phase-[N]-[slug].md` pattern
- **Solution**:
  - Rename phase file to match pattern (e.g., `phase-1-foundation.md`)
  - Ensure phase number is numeric, not alphanumeric (e.g., not `phase-1a-*.md`)
  - Update README references to match new filename

**Issue: Phase file exceeds 500 lines**
- **Cause**: Phase is too large and should be split
- **Solution**:
  - Split phase into multiple sub-phases based on functional areas
  - Ensure each sub-phase can be completed independently
  - Update dependencies accordingly
  - Re-validate after splitting

**Issue: Draft file recovery fails**
- **Cause**: jq not installed or draft file corrupted
- **Solution**:
  - Install jq: `brew install jq` (macOS) or `sudo apt-get install jq` (Linux)
  - If jq unavailable, workflow will use fallback parsing with basic tools
  - If draft file corrupted, delete `.specs-draft.json` and start fresh

#### specs-implement Workflow Issues

**Issue: Specs directory not found**
- **Cause**: specs-create workflow hasn't been run yet
- **Solution**:
  - Run `/specs-create` workflow first to generate specs
  - Ensure specs/ directory exists in repository root

**Issue: Quality score validation fails**
- **Cause**: Specs don't meet quality threshold (≥90%)
- **Solution**:
  - Return to specs-create workflow to improve specs
  - Review which metrics are below threshold
  - Address specific quality issues interactively

**Issue: Phase dependencies not satisfied**
- **Cause**: Trying to implement a phase before its dependencies are complete
- **Solution**:
  - Implement dependencies first
  - Or use `--from-phase` to start from a specific phase (not recommended)
  - Review dependency graph in README

**Issue: Checkpoint creation fails**
- **Cause**: Disk space, permissions, or git issues
- **Solution**:
  - Check disk space: `df -h`
  - Check directory permissions: `ls -la`
  - If git issues, ensure git is initialized: `git init`
  - Workflow will fallback to copy if git archive fails

**Issue: Test framework not detected**
- **Cause**: No test framework configured or tests don't exist
- **Solution**:
  - Set up test framework (Jest, pytest, Go test, etc.)
  - Create test files following framework conventions
  - Add test scripts to package.json or Makefile
  - Or proceed without tests with warning (not recommended for production)

**Issue: Circular dependency check fails**
- **Cause**: Dependency graph has cycles
- **Solution**:
  - Review README Feature Matrix dependencies column
  - Identify circular dependency (e.g., Phase 1 → Phase 2 → Phase 1)
  - Remove one dependency to break the cycle
  - Re-run validation

**Issue: Spec version mismatch detected**
- **Cause**: Specs were updated during implementation
- **Solution**:
  - Review spec changes in CHANGELOG.md
  - If minor version change: Continue with warning
  - If major version change: Restart phase with new spec
  - Or review changes manually before deciding

**Issue: Progress file corrupted**
- **Cause**: JSON syntax error or manual editing error
- **Solution**:
  - Restore from backup: `.specs-progress-backups/`
  - Or delete file and restart implementation (will re-initialize)
  - Validate JSON: `jq empty .specs-progress.json`

**Issue: Selective rollback options not available**
- **Cause**: Progress file schema doesn't track file-level modifications
- **Solution**:
  - Use full rollback instead
  - Or manually identify and revert specific files
  - Future versions may include file-level tracking

#### Integration Issues

**Issue: README parsing fails**
- **Cause**: README format doesn't match expected structure
- **Solution**:
  - Ensure README has "Phase List" section
  - Ensure Feature Matrix table has Dependencies column
  - Use phase names exactly as they appear in phase file titles
  - Re-run specs-create to regenerate README if needed

**Issue: Phase file format incompatibility**
- **Cause**: Phase file doesn't match standardized format
- **Solution**:
  - Ensure all required sections are present (Overview, Context, Implementation Tasks, Technical Requirements, Success Criteria)
  - Use phase file template from specs-create-templates.md
  - Re-generate phase files if needed

#### Performance Issues

**Issue: Quality score calculation is slow**
- **Cause**: Large number of phase files or complex parsing
- **Solution**:
  - This is expected behavior for large projects
  - Consider splitting into smaller spec files if possible
  - No action required if calculation completes within reasonable time

**Issue: Checkpoint cleanup not running**
- **Cause**: Manual cleanup function not called
- **Solution**:
  - Add `cleanup_checkpoints` call after successful phase completion
  - Or manually clean up: `rm -rf .phase-checkpoints/phase-*`
  - Automate with cron job if needed

#### Error Recovery

**Issue: Workflow crashed during implementation**
- **Cause**: Unexpected error or system failure
- **Solution**:
  - Progress is saved in `.specs-progress.json`
  - Run workflow again with `--resume` option
  - Or manually select phase to resume from
  - Checkpoints allow rollback if needed

**Issue: Git stash conflicts during checkpoint**
- **Cause**: Uncommitted changes conflict with stashing
- **Solution**:
  - Commit or discard changes before running workflow
  - Or workflow will proceed with committed state only
  - Checkpoint will include committed state

### Getting Help

If you encounter issues not covered here:
1. Review workflow documentation in {{DOCS_DIR}}/
2. Check error messages for specific guidance
3. Review progress file for current state
4. Use rollback to recover from failed implementations
5. Consider re-running specs-create if specs are problematic

## Workflow Integration

This workflow is designed to work seamlessly with the `/specs-create` workflow:

**Handoff Process:**
1. Complete spec creation using `/specs-create` workflow
2. Ensure specs are saved to the specs/ directory
3. Run `/specs-implement` to begin implementation
4. This workflow parses the specs/ directory and tracks progress
5. Implementation proceeds phase by phase with user confirmation

**Cross-Workflow References:**
- Spec creation: `/specs-create` workflow
- Implementation: `/specs-implement` workflow
- Progress tracking: `.specs-progress.json` (created and updated by this workflow)

**Data Flow:**
```
/specs-create → specs/ directory → /specs-implement → implementation
                    ↓
              .specs-progress.json (created during implementation)
```

**Best Practices:**
- Ensure specs are complete and validated before implementation
- Keep progress file in version control for visibility
- Use schema validation to ensure progress file integrity
- Coordinate spec updates with implementation progress
- Provide feedback to spec creation workflow for improvements
- Use checkpoint branches for safe phase implementation

## Integration Testing

Validate that specs created by `/specs-create` work correctly with `/specs-implement`:

**Pre-Implementation Validation:**
- Verify specs/ directory exists with README.md and phase files
- Validate README format matches expected parsing pattern
- Check that phase files follow standardized format
- Verify phase file naming follows `phase-[N]-[slug].md` pattern
- Ensure dependencies are documented in README Feature Matrix
- Run quality score validation (should match specs-create score)
- Test dependency resolution logic
- Verify no circular dependencies exist

**Integration Test Procedure:**
1. Run `/specs-create` to generate test specs
2. Run `/specs-implement` with validation only (skip actual implementation)
3. Verify README parsing extracts correct phase information
4. Check that dependency resolution identifies correct next phase
5. Confirm progress file initialization succeeds
6. Validate spec version detection works correctly
7. Test checkpoint creation and rollback

**Common Integration Issues:**
- README missing "Phase List" section or Feature Matrix table
- Phase names in dependencies don't match phase file titles
- Phase file naming doesn't follow required pattern
- Missing required sections in phase files
- Circular dependencies in phase structure
- Quality score below 90% threshold
