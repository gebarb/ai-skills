---
description: Spec update handling and workflow integration for spec implementation
---

# Spec Implementation - Spec Updates and Integration

This file contains spec update handling, quality metrics, documentation generation, troubleshooting, and workflow integration for the spec implementation workflow.

**Table of Contents:**
- [Spec Update Handling](#spec-update-handling)
- [Quality Metrics](#quality-metrics)
- [Documentation Generation](#documentation-generation)
- [Notes](#notes)
- [Troubleshooting Guide](#troubleshooting-guide)
- [Workflow Integration](#workflow-integration)
- [Integration Testing](#integration-testing)

## Spec Update Handling

If specs are updated during implementation:

**When to Run Detection:**
- At the start of each new phase implementation (Step 7)
- Before phase selection (Step 6) to ensure specs haven't changed
- After user confirmation to proceed with a phase
- This ensures spec changes are detected before implementation begins

**AI Execution Instructions for Detection:**

1. **Get current spec version from README:**
   - Read `specs/README.md`
   - Look for version in common formats:
     - "Spec Version: X.Y.Z"
     - "Version: X.Y.Z"
     - "vX.Y.Z"
     - YAML frontmatter: `version:` or `specVersion:`
   - Extract the version number (e.g., "1.0.0")
   - Default to "unknown" if not found

2. **Get spec version from progress file:**
   - Read `.specs-progress.json`
   - Extract the `specVersion` field
   - Default to "unknown" if not found

3. **Check for spec file modifications:**
   - If git repository exists:
     - Get the phase start time from progress file (`.phases[].startedAt` for in-progress phase)
     - Find the git commit closest to that time
     - Run `git diff --name-only [commit] HEAD -- specs/*.md` to detect changes
   - If no git repository:
     - Get the phase start time from progress file
     - Compare file modification times of spec files with phase start time
     - List any spec files modified after phase start

4. **Compare versions:**
   - If current spec version != progress spec version:
     - Report version change to user
     - Determine if it's a major, minor, or patch version change
   - If spec files were modified:
     - List modified files
     - Report to user

5. **If changes detected:**
   - Present options to user (see "When Spec Changes Are Detected" section below)

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

## Quality Metrics

**Spec Quality Metrics:**
- Phase completeness: % of required fields filled
- Task specificity: % of tasks that are actionable
- Success criteria measurability: % of criteria with action verbs
- Dependency complexity: average number of dependencies per phase
- Phase size appropriateness: % of phases within task count range

**Note**: For detailed quality score calculation methodology and metric-specific thresholds, see `setup-initialization.md` Step 4 - Validate Spec Structure. This section contains the complete quality score calculation algorithm with specific thresholds for each metric.

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
1. Review workflow documentation in references/
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

**CI/CD Integration Patterns:**

**GitHub Actions Example:**
```yaml
name: Spec Implementation
on:
  workflow_dispatch:
    inputs:
      from-phase:
        description: 'Phase to start from'
        required: false
        default: '1'

jobs:
  implement:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run specs-implement
        run: |
          # Trigger the skill with optional phase selection
          echo "Starting implementation from phase ${{ github.event.inputs.from-phase }}"
          # The actual skill execution would be handled by your AI agent system
```

**GitLab CI Example:**
```yaml
spec_implementation:
  stage: implementation
  script:
    - echo "Running specs-implement workflow"
    # Trigger the skill with your AI agent system
  only:
    - main
  when: manual
```

**Automated Implementation Considerations:**
- CI/CD integration requires AI agent system with skill execution capability
- Consider adding approval gates between phases for manual review
- Implement automated testing after each phase completion
- Use environment variables for configuration (e.g., `FROM_PHASE`, `SKIP_CONFIRMATION`)
- Store progress file as artifact for traceability
- Implement rollback strategy for failed CI/CD runs
- Consider parallel phase implementation for independent phases

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

## Skill Self-Testing and Validation

To ensure the specs-implement skill works correctly, perform the following self-tests:

**Test Suite Overview:**

**1. Spec Parsing Tests**
- **Test**: Parse a valid specs/README.md with sequential phases
- **Expected**: Correctly extracts phase names, file paths, and dependencies
- **Test**: Parse a valid specs/README.md with categorized phases
- **Expected**: Correctly extracts phase names, categories, and dependencies from Feature Matrix
- **Test**: Parse README with missing "Phase List" section
- **Expected**: Reports parsing error and offers fix/exit/manual options

**2. Dependency Resolution Tests**
- **Test**: Resolve dependencies for simple sequential phases (1→2→3)
- **Expected**: Identifies Phase 1 as ready, then Phase 2, then Phase 3
- **Test**: Resolve dependencies for parallel phases (1→2, 1→3)
- **Expected**: Identifies Phase 1 as ready, then both Phase 2 and Phase 3 as available
- **Test**: Detect circular dependency (1→2→1)
- **Expected**: Reports circular dependency and blocks implementation
- **Test**: Handle skipped dependencies (Phase 2 skipped, Phase 3 depends on Phase 2)
- **Expected**: Warns user and asks for confirmation before proceeding

**3. Progress Tracking Tests**
- **Test**: Initialize progress file for new implementation
- **Expected**: Creates .specs-progress.json with correct structure
- **Test**: Resume from existing progress file
- **Expected**: Loads progress and identifies next incomplete phase
- **Test**: Validate corrupted progress file
- **Expected**: Reports error and offers restore from backup
- **Test**: Test progress file backup before writes
- **Expected**: Creates timestamped backup in .specs-progress-backups/

**4. Checkpoint Tests**
- **Test**: Create checkpoint with git repository
- **Expected**: Uses git archive to create clean backup
- **Test**: Create checkpoint without git repository
- **Expected**: Copies all files to checkpoint directory
- **Test**: Rollback to checkpoint
- **Expected**: Restores files and updates progress file
- **Test**: Checkpoint cleanup after successful phase
- **Expected**: Removes checkpoint and keeps only 5 most recent

**5. Quality Validation Tests**
- **Test**: Calculate quality score for complete spec
- **Expected**: Returns score ≥90% with all metrics passing
- **Test**: Calculate quality score for incomplete spec
- **Expected**: Returns score <90% with specific metrics below threshold
- **Test**: Validate phase file format with all required sections
- **Expected**: Passes validation
- **Test**: Validate phase file format with missing sections
- **Expected**: Reports missing sections and offers fix/exit options

**6. Code Review Tests**
- **Test**: Perform code review on simple implementation
- **Expected**: Generates review report with quality score and issue list
- **Test**: Detect hardcoded secrets in code
- **Expected**: Flags as critical issue in review report
- **Test**: Detect SQL injection vulnerability
- **Expected**: Flags as critical issue with recommendation for parameterized queries
- **Test**: Check spec compliance
- **Expected**: Reports tasks completed, requirements met, criteria satisfied

**7. Spec Version Tests**
- **Test**: Detect spec version change between phases
- **Expected**: Reports version change and offers continue/restart/merge options
- **Test**: Lock spec version for phase implementation
- **Expected**: Records spec version in progress file for that phase
- **Test**: Handle breaking version change (1.0.0 → 2.0.0)
- **Expected**: Blocks implementation and requires user confirmation

**8. Error Handling Tests**
- **Test**: Handle compilation error during implementation
- **Expected**: Reports error as fatal and offers retry/exit options
- **Test**: Handle test failure during verification
- **Expected**: Reports error as recoverable and offers fix/skip/rollback options
- **Test**: Handle disk space exhaustion during checkpoint
- **Expected**: Reports error and offers cleanup/continue/exit options

**Test Execution Procedure:**

**Automated Testing:**
1. Create test repository with sample specs
2. Run each test case systematically
3. Record results (pass/fail) with timestamps
4. Generate test report with coverage metrics
5. Review failed tests and fix issues

**Manual Testing:**
1. Test workflow with real-world spec files
2. Verify user interaction flows work correctly
3. Test edge cases (empty specs, malformed files, etc.)
4. Validate error messages are clear and actionable
5. Confirm rollback procedures work as expected

**Test Coverage Goals:**
- Spec parsing: 100% of README formats
- Dependency resolution: All dependency patterns
- Progress tracking: All file operations
- Checkpoints: Both git and non-git scenarios
- Quality validation: All validation rules
- Code review: All review categories
- Error handling: All error categories

**Validation Checklist:**
- [ ] All spec parsing tests pass
- [ ] All dependency resolution tests pass
- [ ] All progress tracking tests pass
- [ ] All checkpoint tests pass
- [ ] All quality validation tests pass
- [ ] All code review tests pass
- [ ] All spec version tests pass
- [ ] All error handling tests pass
- [ ] Manual testing completed successfully
- [ ] Test coverage meets goals
