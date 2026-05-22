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

**Selective Rollback:**
If user chooses selective rollback:
```
=== Selective Rollback ===

Which files/tasks would you like to rollback?

1. Specific files (list modified files)
2. Specific task category (e.g., UI components, data models)
3. Last N tasks
4. All changes since checkpoint

Select option (1-4):
```

Selective rollback allows:
- Reverting only problematic files while keeping successful changes
- Rolling back specific task categories
- Rolling back a specific number of recent tasks
- Preserving work that was successful

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

**Detection:**
- Compare spec file modification time with phase start time
- Compare spec version in progress file with current spec version

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
- User must explicitly approve spec version changes

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
✓ Phase 0: Foundation (8/8 tasks)
✓ Phase 1: First Feature (5/5 tasks)
✓ Phase 2: Second Feature (6/6 tasks)
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

- **Sequential phases**: Phases numbered sequentially (Phase 0, 1, 2, 3...)
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
- Parallel implementation can speed up development when dependencies allow
- Selective rollback allows fine-grained recovery from errors
- Multi-phase rollback supports recovery from fundamental issues
- Quality metrics provide objective measures of implementation quality

## Workflow Integration

This workflow is designed to work seamlessly with the `../../workflows/create-specs` workflow:

**Handoff Process:**
1. Complete spec creation using `../../workflows/create-specs` workflow
2. Ensure specs are saved to the specs/ directory
3. Run `../../workflows/implement-specs` to begin implementation
4. This workflow parses the specs/ directory and tracks progress
5. Implementation proceeds phase by phase with user confirmation

**Cross-Workflow References:**
- Spec creation: `../../workflows/create-specs` workflow
- Implementation: `../../workflows/implement-specs` workflow
- Progress tracking: `.specs-progress.json` (created and updated by this workflow)

**Data Flow:**
```
../../workflows/create-specs → specs/ directory → ../../workflows/implement-specs → implementation
                    ↓
              .specs-progress.json (created during implementation)
```

**Best Practices:**
- Ensure specs are complete and validated before implementation
- Keep progress file in version control for team visibility
- Use schema validation to ensure progress file integrity
- Coordinate spec updates with implementation progress
- Provide feedback to spec creation workflow for improvements
- Use checkpoint branches for safe phase implementation
