---
description: Implement specs and phases from a repository - Setup Phase (Steps 1-9)
---

# Spec Implementation Workflow - Setup Phase

This is the setup phase of the specs-implement workflow, covering Steps 1-9: Repository review, progress tracking, validation, parsing, dependencies, phase selection, display overview, user confirmation, and checkpoint creation.

**Note**: Technology stack selection (language, frameworks, architecture, etc.) is handled in the specs-create workflow. This implementation workflow uses the technology decisions documented in the specs.

For the complete workflow, see:
- Setup Phase: This file (Steps 1-9)
- Implementation Phase: `~/.codeium/windsurf/docs/specs-references/specs-implement-implementation.md` (Steps 10-19)

## Prerequisites

- Repository must have a `specs/` directory
- `specs/README.md` must exist and define phase structure
- Phase files must be named `phase-*.md` (e.g., `phase-1-foundation.md`)
- Each phase file should contain implementation tasks, technical requirements, and success criteria

## Usage

Run this workflow from the root of your repository:

```
/specs-implement
```

Optional: Start from a specific phase:

```
/specs-implement --from-phase 3
```

## Workflow Steps

### 1. Repository Review (Required First Step)

**CRITICAL**: Before making any implementation decisions or changes, you must review the repository in its entirety to understand the current state of the codebase and its functionality.

**Comprehensive Code Review Process:**
- Examine all files and directories in the repository
- Review all existing code to gain a deep understanding of:
  - Code structure and architecture
  - Design patterns and coding conventions
  - Business logic and data flow
  - Integration points and dependencies
  - Performance characteristics
  - Security considerations
- Identify existing technologies, frameworks, and dependencies
- Check for existing documentation, configuration files, and README files
- Understand the project's current functionality and purpose
- Note any existing design patterns, coding standards, or conventions
- Review any existing specs, tests, or documentation
- Locate and read the specification documents and phase files

**Do NOT proceed to subsequent steps until this comprehensive review is complete and you have a deep understanding of the codebase.**

### 2. Initialize Progress Tracking and Phase Selection

Check for existing progress file (`.specs-progress.json`) and determine implementation scope.

**Important**: Progress file initialization is deferred until after successful spec parsing in Step 4. This ensures the progress file is only created when specs are valid and can be parsed correctly.

```bash
# Check if progress file exists
if [ ! -f .specs-progress.json ]; then
  echo "No existing progress found. Progress file will be initialized after successful spec parsing."
  # Progress file will be created in Step 4 after validating and parsing specs
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
- Proceed with normal implementation from phase 1 or first phase

**If option 2 (Start from specific phase):**
```
=== Select Starting Phase ===

Available phases:
- Phase 1: Foundation
- Phase 2: First Feature
- Phase 3: Second Feature
- Phase 4: Third Feature
...

Enter phase number to start from (e.g., 1, 2, 3, 4):
```

After selection:
- Mark all phases before the selected phase as completed in progress file
- Set selected phase as "in-progress"
- Validate that dependencies for selected phase are satisfied
- If dependencies not satisfied, warn user and suggest starting from earlier phase

**Note on --from-phase flag:**
The optional --from-phase flag (e.g., `/specs-implement --from-phase 3`) provides a shortcut to start from a specific phase. When this flag is used:
1. The workflow skips the phase selection prompt
2. All phases before the specified phase are marked as completed in the progress file
3. The specified phase is set as "in-progress"
4. Dependencies are validated before proceeding
5. If dependencies are not satisfied, the workflow will warn and suggest starting from an earlier phase

This flag is equivalent to selecting "Option 2: Start from specific phase" in the interactive workflow.

**If option 3 (Resume from existing progress):**
- Load existing progress file
- Find first incomplete phase with satisfied dependencies
- Proceed with that phase


### 3. Validate Spec Structure

Before parsing, validate that the specs directory has the expected structure:

- Check that `specs/` directory exists
- Verify `specs/README.md` is present and readable
- Validate that phase files referenced in README exist
- Check that each phase file has required sections (Overview, Context, Implementation Tasks, Technical Requirements, Success Criteria)
- Ensure phase file naming follows `phase-*.md` pattern
- Validate phase number format (must be numeric, e.g., phase-1-*.md, not phase-1a-*.md)
- Detect spec version from README or CHANGELOG.md if available
- **Quality Score Validation**: Calculate and validate the spec quality score (recommended threshold: ≥ 90%)

**Quality Score Validation:**
Run the quality score calculation from the specs-create workflow to ensure specs meet quality standards:
```bash
# Calculate quality score using the same method as specs-create
# See specs-create-execution.md Step 9 for the full implementation
# If score < 90%, warn user and ask for confirmation before proceeding
```

If validation fails, report the specific issues and ask user how to proceed:
- 'fix' to manually correct the issues
- 'exit' to stop the workflow

If quality score is below 90%:
- Warn user that specs may not be ready for implementation
- Show the quality score and which metrics are below threshold
- Ask user to confirm:
  - 'continue' to proceed with implementation despite low quality score
  - 'exit' to return to specs-create workflow to improve specs
  - 'fix' to address specific quality issues interactively

**Quality Score Threshold Enforcement:**
The quality score threshold of 90% is consistent between specs-create and specs-implement workflows:
- specs-create: Uses ≥90% as the readiness threshold (Step 9)
- specs-implement: Validates and warns if score <90% (Step 3)
- Both workflows use the same quality score calculation method
- If score is 75-89%, implementation is allowed with warning
- If score is <75%, strongly recommend returning to specs-create workflow

### 4. Parse Specs Structure

Read the `specs/README.md` to understand the phase structure and dependencies.

**Parsing Strategy:**

For **sequential** READMEs:
- Look for numbered phase lists (Phase 1, Phase 2, etc.)
- Extract phase names and file paths from list items
- Dependencies are implicit (previous phases)
- Expected format: `Phase N: [Phase Name] - specs/phase-N-[slug].md`

For **categorized** READMEs:
- Parse category sections (e.g., Foundational, Foundation, Core)
- Extract phase names from tables or lists within categories
- Dependencies may be explicit in dependency columns
- Expected format: Table with Phase, Screen/Component, Category, Dependencies columns

**README Format Requirements:**
- The README must include a "Phase List" section for specs-implement parsing
- For sequential phases: Include a numbered list with phase names and file paths
- For categorized phases: Include category sections with phase lists or tables
- The Feature Matrix table must include a Dependencies column with explicit dependency references
- Phase file paths must be relative to the repository root (e.g., `specs/phase-1-foundation.md`)
- Dependency references must use phase names as defined in the phase files

**README Parsing Examples:**

**Sequential README Example:**
```markdown
## Phase List (for specs-implement parsing)
Phase 1: Foundation - specs/phase-1-foundation.md
Phase 2: User Authentication - specs/phase-2-auth.md
Phase 3: Task Management - specs/phase-3-tasks.md
```

**Categorized README Example:**
```markdown
## Feature Matrix
| Phase | Screen/Component | Category | Dependencies |
|-------|------------------|----------|--------------|
| Phase 1 | Foundation | Setup | None |
| Phase 2 | Authentication | Auth | Phase 1 |
| Phase 3 | Task Management | Core | Phase 1, Phase 2 |
```

**Parsing Notes:**
- The specs-implement workflow looks for the "Phase List" section or parses the Feature Matrix table
- Phase names in the Dependencies column must match the phase names exactly (including "Phase N:" prefix)
- File paths must be relative to the repository root and start with `specs/`

- Extract phase names and their file paths
- Identify phase order and dependencies (if specified)
- Build dependency graph
- Validate no circular dependencies exist
- Create or update `.specs-progress.json` with all phases

**Progress File Initialization:**
If no progress file exists, initialize it now after successful spec parsing:

**Initialization Sequence:**
1. Create empty progress file structure with repository metadata
2. Parse phase information from README (Step 4)
3. Populate the phases array with parsed phase data
4. Set initial status for all phases to "pending"
5. Set startPhase based on user selection (if any)

```bash
# Initialize progress file with parsed phases
# This is done after successful validation and parsing to ensure valid state
if [ ! -f .specs-progress.json ]; then
  echo "Initializing progress file with parsed phases..."
  # Get repository name from git remote or current directory
  REPO_NAME=$(basename "$(pwd)")
  if [ -d .git ]; then
    GIT_REMOTE=$(git remote get-url origin 2>/dev/null || echo "")
    if [ -n "$GIT_REMOTE" ]; then
      REPO_NAME=$(basename "$GIT_REMOTE" .git 2>/dev/null || echo "$REPO_NAME")
    fi
  fi
  # Create progress file with repository info and empty phases array
  echo "{\"repository\":\"$REPO_NAME\",\"lastUpdated\":\"\",\"specVersion\":\"\",\"startPhase\":null,\"phases\":[]}" > .specs-progress.json

  # Parse phase information from README and populate phases array
  # This step extracts phase names, file paths, and dependencies from the README
  # Each phase is added with status: "pending" and empty tasks array
  # The parsing logic should match the format described in Step 4
  # Example: jq --argjson phases "$PARSED_PHASES" '.phases = $phases' .specs-progress.json > tmp.json && mv tmp.json .specs-progress.json
fi
```

### 5. Resolve Dependencies

Before selecting the next phase, resolve dependencies:

- Check if all dependencies for pending phases are satisfied
- Identify phases that can be started (all dependencies complete)
- If multiple phases are available, present options to user:
  - Auto-select first in order
  - Let user choose which to implement
- If a phase's dependencies are not complete, skip it for now

**Dependency Resolution Rules:**
- Phases with no dependencies can be started immediately
- Phases with dependencies must wait for all dependencies to complete
- If dependencies are marked as skipped, warn user before proceeding
  - Skipped dependencies do NOT satisfy dependency requirements
  - A phase cannot proceed if its dependencies were skipped unless the user explicitly confirms
  - This prevents implementing phases that depend on incomplete functionality
- Perform circular dependency check before proceeding with resolution

**Circular Dependency Check:**
Before resolving dependencies, verify no circular dependencies exist in the dependency graph:

**Note**: This circular dependency check requires bash 4.0 or later for associative array support. If using an older bash version or a different shell (e.g., sh, dash), this check may fail. Consider upgrading bash or using an alternative dependency validation method.

**Fallback for systems without bash 4.0+:**
If the circular dependency check fails due to bash version, you can use a simpler validation approach:
```bash
# Simple circular dependency check without associative arrays (works with bash 3.x)
simple_circular_check() {
  echo "Checking for circular dependencies (simple mode)..."
  local deps_file="specs/README.md"
  
  if [ ! -f "$deps_file" ]; then
    echo "Warning: README not found, skipping circular dependency check"
    return 0
  fi
  
  # Extract dependencies and check for obvious cycles
  # This is a simplified check that may miss some edge cases
  awk '
  /^\|.*\|.*\|.*\|.*\|/ {
    if (NR > 1) {
      phase = $2
      deps = $5
      gsub(/^[[:space:]]*|[[:space:]]*$/, "", phase)
      gsub(/^[[:space:]]*|[[:space:]]*$/, "", deps)
      if (deps != "None" && deps != "" && deps != "-") {
        print phase " depends on " deps
      }
    }
  }
  ' "$deps_file" | grep -v "depends on" > /dev/null && echo "Dependencies found, manual review recommended" || echo "No obvious circular dependencies detected"
}
```

```bash
#!/bin/bash
set -e  # Exit on error
set -u  # Exit on undefined variable

# Build adjacency list for dependency graph and detect cycles using DFS
check_circular_deps() {
  echo "Checking for circular dependencies..."
  
  # Parse dependencies from README Feature Matrix or progress file
  local deps_file="specs/README.md"
  if [ ! -f "$deps_file" ]; then
    echo "Warning: README not found, skipping circular dependency check"
    return 0
  fi
  
  # Build dependency map: phase -> list of dependencies
  declare -A dep_map
  declare -a phase_list
  
  # Parse Feature Matrix table to extract dependencies
  while IFS= read -r line; do
    if [[ $line =~ ^\|.*\|.*\|.*\|.*\| ]]; then
      # Extract phase name (column 1) and dependencies (column 5)
      phase=$(echo "$line" | awk -F'|' '{print $2}' | xargs)
      deps=$(echo "$line" | awk -F'|' '{print $5}' | xargs)
      
      if [ "$phase" != "Phase" ] && [ -n "$phase" ]; then
        phase_list+=("$phase")
        if [ "$deps" != "None" ] && [ -n "$deps" ]; then
          dep_map["$phase"]="$deps"
        else
          dep_map["$phase"]=""
        fi
      fi
    fi
  done < "$deps_file"
  
  # DFS-based cycle detection
  declare -A visited
  declare -A rec_stack
  
  dfs_visit() {
    local phase="$1"
    visited["$phase"]=1
    rec_stack["$phase"]=1
    
    local deps="${dep_map[$phase]}"
    if [ -n "$deps" ]; then
      # Parse comma-separated dependencies
      IFS=',' read -ra dep_array <<< "$deps"
      for dep in "${dep_array[@]}"; do
        dep=$(echo "$dep" | xargs) # trim whitespace
        if [ -n "$dep" ]; then
          if [ "${visited[$dep]}" != "1" ]; then
            if dfs_visit "$dep"; then
              return 1
            fi
          elif [ "${rec_stack[$dep]}" == "1" ]; then
            echo "Error: Circular dependency detected: $phase -> $dep"
            return 1
          fi
        fi
      done
    fi
    
    rec_stack["$phase"]=0
    return 0
  }
  
  # Check each phase for cycles
  for phase in "${phase_list[@]}"; do
    if [ "${visited[$phase]}" != "1" ]; then
      if ! dfs_visit "$phase"; then
        echo "Circular dependency check failed"
        return 1
      fi
    fi
  done
  
  echo "No circular dependencies detected"
  return 0
}

# Run the check
if ! check_circular_deps; then
  echo "Error: Circular dependencies detected. Please fix dependencies before proceeding."
  exit 1
fi
```

**Dependency Conflict Resolution:**
When multiple phases have satisfied dependencies and are available to start:

**Default Strategy**: Use Sequential Priority (implement phases in numerical order)
- This is the default behavior unless the user explicitly requests selective implementation
- Phases are implemented in order: Phase 1, then Phase 2, then Phase 3, etc.
- This ensures predictable implementation order and minimizes complexity

**Alternative Strategies** (available if user chooses selective implementation):
1. **Sequential Priority**: Default to implementing phases in numerical order (Phase 1, then Phase 2, etc.)
2. **User Selection**: If multiple phases are available, present options to user:
   ```
   === Available Phases ===
   
   The following phases are ready to implement:
   - Phase 3: Feature A (dependencies: Phase 1, Phase 2)
   - Phase 4: Feature B (dependencies: Phase 1, Phase 2)
   
   Which phase would you like to implement next?
   - Type '3' for Phase 3
   - Type '4' for Phase 4
   - Type 'auto' to use sequential order (Phase 3)
   ```
3. **Critical Path Priority**: If phases have different downstream dependencies, prioritize phases that unblock the most subsequent phases
4. **Dependency Depth**: Prefer phases with fewer remaining dependencies in their chain

**Decision Logic**:
- By default, use Sequential Priority for predictable implementation order
- If user explicitly requests selective implementation, present User Selection option
- Critical Path Priority and Dependency Depth are advanced options that can be used when optimizing for parallel development or minimizing overall implementation time

### 6. Determine Next Phase

Based on `.specs-progress.json`, resolved dependencies, and user's phase selection, identify the next phase to implement.

- If all phases are complete, report completion and exit
- If user selected a specific phase in step 1, use that phase (validate dependencies first)
- If some phases are complete, find the first incomplete phase with satisfied dependencies
- If no progress file exists, start with the first phase
- If user skipped phases, confirm they want to proceed with available phases

**Phase Selection Override:**
If user selected a specific phase in step 1:
- Validate that all dependencies for the selected phase are satisfied
- If dependencies not satisfied, warn user and suggest starting from earlier phase
- Ask user to confirm or change selection
- Mark earlier phases as completed in progress file if user confirms

**Phase Selection Options:**
1. **Sequential**: Implement phases one at a time in dependency order
2. **Selective**: User chooses which phase to implement next from available options

### 7. Display Phase Overview

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

### 8. Request User Confirmation

Ask the user to confirm before proceeding:

```
Ready to implement [Phase Name]?
- Type 'yes' to proceed
- Type 'skip' to skip this phase
- Type 'exit' to stop the workflow
```

### 9. Create Implementation Checkpoint

Before implementing, create a checkpoint for potential rollback:

**Checkpoint Strategy:**
- Create a backup of current code state before phase implementation
- Store backup in `.phase-checkpoints/` directory
- Name checkpoints with phase number and timestamp
- Clean up stale checkpoints periodically

**Checkpoint Cleanup:**
- After successful phase completion, remove the checkpoint for that phase
- Keep only the most recent checkpoint if needed for reference
- Implement periodic cleanup of old checkpoints (e.g., keep only last 5 checkpoints)
- Manual cleanup command: `rm -rf .phase-checkpoints/phase-*` (use with caution)
- If workflow is interrupted, checkpoints remain for recovery

**Automated Cleanup:**
To automate checkpoint cleanup, add this to the workflow after successful phase completion:
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
```

**Implementation:**
```bash
# Create checkpoint directory if it doesn't exist
if ! mkdir -p .phase-checkpoints; then
  echo "Error: Failed to create checkpoint directory"
  exit 1
fi

# Create timestamped backup
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
CHECKPOINT_NAME="phase-${PHASE_NUMBER}-${TIMESTAMP}"

# Create backup using git or copy
if [ -d .git ]; then
  # Check for uncommitted changes
  if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
    echo "Warning: Uncommitted changes detected in working directory."
    echo "Checkpoint will include uncommitted changes by stashing them temporarily."
    
    # Stash uncommitted changes
    STASH_NAME="checkpoint-phase-${PHASE_NUMBER}-${TIMESTAMP}"
    if git stash push -u -m "$STASH_NAME" 2>/dev/null; then
      echo "Stashed uncommitted changes as: $STASH_NAME"
      STASHED=true
    else
      echo "Warning: Failed to stash changes, proceeding with committed state only"
      STASHED=false
    fi
  fi
  
  # Try git archive first
  if git archive --format=tar HEAD 2>/dev/null | tar -x -C ".phase-checkpoints/${CHECKPOINT_NAME}" 2>/dev/null; then
    echo "Checkpoint created: .phase-checkpoints/${CHECKPOINT_NAME}"
    
    # If changes were stashed, apply them to the checkpoint
    if [ "$STASHED" = true ]; then
      ORIGINAL_DIR=$(pwd)
      cd ".phase-checkpoints/${CHECKPOINT_NAME}" || {
        echo "Error: Failed to change to checkpoint directory"
        exit 1
      }
      if git stash pop 2>/dev/null; then
        echo "Applied uncommitted changes to checkpoint"
      else
        echo "Warning: Failed to apply stashed changes to checkpoint"
      fi
      cd "$ORIGINAL_DIR" || {
        echo "Error: Failed to return to original directory"
        exit 1
      }
    fi
  else
    echo "Warning: git archive failed, falling back to copy"
    mkdir -p ".phase-checkpoints/${CHECKPOINT_NAME}"
    if cp -r . ".phase-checkpoints/${CHECKPOINT_NAME}/" 2>/dev/null; then
      echo "Checkpoint created: .phase-checkpoints/${CHECKPOINT_NAME}"
    else
      echo "Error: Failed to create checkpoint backup"
      exit 1
    fi
  fi
else
  # No git repository, use copy
  mkdir -p ".phase-checkpoints/${CHECKPOINT_NAME}"
  if cp -r . ".phase-checkpoints/${CHECKPOINT_NAME}/" 2>/dev/null; then
    echo "Checkpoint created: .phase-checkpoints/${CHECKPOINT_NAME}"
  else
    echo "Error: Failed to create checkpoint backup"
    exit 1
  fi
fi
```

This allows rollback if implementation fails.

## Continue to Part 2

For Steps 10-19 (Implement Phase through Completion), see `~/.codeium/windsurf/docs/specs-references/specs-implement-implementation.md`.
