---
description: Implement specs and phases from a repository - Setup Initialization Phase (Steps 1-6)
---

# Spec Implementation Workflow - Setup Initialization Phase

This is the setup initialization phase of the specs-implement workflow, covering Steps 1-6: Repository review, spec checking, progress tracking initialization, validation, parsing, and dependency resolution.

**Table of Contents:**
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Platform Detection](#platform-detection)
- [Workflow Steps](#workflow-steps)
  - [1. Repository Review](#1-repository-review-required-first-step)
  - [2. Check for Specs and Determine Implementation Approach](#2-check-for-specs-and-determine-implementation-approach)
  - [3. Initialize Progress Tracking and Phase Selection](#3-initialize-progress-tracking-and-phase-selection)
  - [4. Validate Spec Structure](#4-validate-spec-structure)
  - [5. Parse Specs Structure](#5-parse-specs-structure)
  - [6. Resolve Dependencies](#6-resolve-dependencies)
- [Continue to Part 2](#continue-to-part-2)

**Note**: Technology stack selection (language, frameworks, architecture, etc.) is handled in the specs-create workflow. This implementation workflow uses the technology decisions documented in the specs.

For the complete workflow, see:
- Setup Initialization Phase: This file (Steps 1-6)
- Setup Preparation Phase: `setup-preparation.md` (Steps 7-11)
- Implementation Phase: `implementation.md` (Steps 12-22)

## Prerequisites

**Note**: The use of create-specs and validate-specs workflows is optional. Users may provide their own spec files or implementation requests. If specs cannot be determined, this workflow will ask for direction or recommend using create-specs.

- If specs exist: Repository must have a `specs/` directory with `specs/README.md` defining phase structure
- Phase files must be named `phase-*.md` (e.g., `phase-1-foundation.md`)
- Each phase file should contain implementation tasks, technical requirements, and success criteria
- If specs don't exist: Workflow will prompt user for direction or recommend create-specs

## Usage

Run this workflow from the root of your repository:

```
/specs-implement
```

Optional: Start from a specific phase:

```
/specs-implement --from-phase 3
```

## Platform Detection

Before executing platform-specific commands, detect the operating system:

```bash
# Detect platform
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  PLATFORM="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  PLATFORM="macos"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
  PLATFORM="windows"
else
  PLATFORM="unknown"
fi

echo "Detected platform: $PLATFORM"
```

All subsequent platform-specific commands should use this detection to select the appropriate syntax.

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

**Completion Criteria:**
The repository review is complete when you have:
- Documented the project's primary purpose and functionality (2-3 sentences)
- Identified the technology stack (languages, frameworks, libraries)
- Listed 5+ key architectural patterns or design patterns used
- Documented 3+ coding conventions (naming, structure, style)
- Identified all integration points and external dependencies
- Located and read all specification documents and phase files
- Created a mental map of the codebase structure
- Noted any security considerations or sensitive data handling

**Do NOT proceed to subsequent steps until this comprehensive review is complete and you have a deep understanding of the codebase.**

### 2. Check for Specs and Determine Implementation Approach

After the repository review, check if specs exist and determine how to proceed:

**Spec Existence Check:**
- Check if `specs/` directory exists
- Check if `specs/README.md` exists
- Check if phase files exist (e.g., `phase-*.md`)

**If Specs Exist:**
- Proceed with normal spec-based implementation (continue to Step 3)
- Parse specs and follow the standard workflow

**If Specs Don't Exist:**
Ask the user for direction:

```
=== No Specs Detected ===

No spec files were found in the repository. How would you like to proceed?

1. Provide spec file path - I have spec files in a different location
2. Describe implementation request - I'll describe what needs to be implemented
3. Create specs first - Use the /create-specs workflow to generate specs
4. Exit - Stop the workflow

Select option (1-4):
```

**If option 1 (Provide spec file path):**
- Ask user to provide the path to their spec files
- Validate the provided path exists and contains required files
- Proceed with spec-based implementation using the provided path

**If option 2 (Describe implementation request):**
- Ask user to describe what they want implemented
- Parse their description to extract requirements
- Create an ad-hoc implementation plan based on their request
- Proceed with implementation using the ad-hoc plan
- Note: This approach is less structured than spec-based implementation

**If option 3 (Create specs first):**
- Recommend running `/create-specs` workflow
- Explain the benefits of spec-driven development
- Exit the workflow and let user run create-specs
- User can return to implement-specs after specs are created

**If option 4 (Exit):**
- Exit the workflow
- No changes are made to the repository

**Implementation Approach Storage:**
Store the chosen implementation approach in the progress file or a temporary state file to ensure consistency throughout the workflow.

### 3. Initialize Progress Tracking and Phase Selection

Check for existing progress file (`.specs-progress.json`) and determine implementation scope.

**Important**: This step only checks for existing progress. Progress file initialization is deferred until after successful spec parsing in Step 5. This ensures the progress file is only created when specs are valid and can be parsed correctly.

**Progress File Check:**
```bash
# Check if progress file exists (platform-agnostic)
if [ ! -f .specs-progress.json ]; then
  echo "No existing progress found. Progress file will be initialized after successful spec parsing."
  # Progress file will be created in Step 5 after validating and parsing specs
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

### 4. Validate Spec Structure

Before parsing, validate that the specs directory has the expected structure:

**Basic Structure Validation:**
- Check that `specs/` directory exists
- Verify `specs/README.md` is present and readable
- Validate that phase files referenced in README exist
- Ensure phase file naming follows `phase-*.md` pattern
- Validate phase number format (must be numeric, e.g., phase-1-*.md, not phase-1a-*.md)
- Detect spec version from README or CHANGELOG.md if available

**Phase File Format Validation:**
For each phase file, validate it contains the required sections:

```markdown
# Phase [N]: [Phase Name]

## Overview
[Required: Detailed description of what this phase implements]

## Context
[Required: Additional context about why this phase is needed]

## Implementation Tasks
[Required: Tasks organized by category with checkboxes]

## Technical Requirements
[Required: Technical specifications and constraints]

## Success Criteria
[Required: Measurable criteria for completion]
```

**Validation Checklist:**
- [ ] Overview section present and non-empty
- [ ] Context section present and non-empty
- [ ] Implementation Tasks section present with at least one task category
- [ ] Technical Requirements section present with at least one requirement
- [ ] Success Criteria section present with at least one criterion
- [ ] Task descriptions are specific and actionable
- [ ] Success criteria are measurable

If any phase file fails validation:
- Report which file failed and which sections are missing
- Ask user to fix the phase file or proceed with warning
- If proceeding with warning, note the validation failure in the progress file

**Quality Score Validation:**
Calculate and validate the spec quality score to ensure specs meet quality standards:

**AI Execution Instructions for Quality Score Calculation:**

1. **Read all phase files** from the specs/ directory
2. **For each phase file, calculate quality metrics:**
   - **Phase completeness**: % of required sections present (Overview, Context, Implementation Tasks, Technical Requirements, Success Criteria)
     - Threshold: ≥90% for this metric to be considered passing
   - **Task specificity**: % of tasks that are actionable (not vague)
     - A task is actionable if it contains clear verbs like "implement", "create", "add", "build", "configure", "set up"
     - Vague tasks include phrases like "think about", "consider", "maybe", "should"
     - Threshold: ≥80% of tasks must be actionable
   - **Success criteria measurability**: % of criteria with action verbs (verify, confirm, ensure, validate, check, test)
     - Threshold: ≥85% of criteria must have action verbs
   - **Dependency complexity**: average number of dependencies per phase (from README)
     - Threshold: ≤3 dependencies per phase on average (lower is better)
   - **Phase size appropriateness**: % of phases with 5-15 tasks (ideal range)
     - Threshold: ≥80% of phases should have 5-15 tasks

3. **Calculate overall quality score:**
   - Phase completeness: 25% weight
   - Task specificity: 25% weight
   - Success criteria measurability: 25% weight
   - Dependency complexity: 15% weight (lower is better)
   - Phase size appropriateness: 10% weight

4. **Determine quality threshold:**
   - If score ≥ 90%: Specs are ready for implementation
   - If score 75-89%: Warn user but allow implementation with confirmation
   - If score < 75%: Strongly recommend returning to specs creation workflow

5. **Report results to user:**
   - Show overall quality score
   - Show which metrics are below threshold
   - Provide specific recommendations for improvement if score < 90%

**Quality Score Calculation Example:**
```
=== Spec Quality Score ===

Overall Quality Score: 87%

Metric Breakdown:
- Phase completeness: 95% (threshold: ≥90%) ✓
- Task specificity: 78% (threshold: ≥80%) ✗
- Success criteria measurability: 92% (threshold: ≥85%) ✓
- Dependency complexity: 2.3 avg (threshold: ≤3) ✓
- Phase size appropriateness: 85% (threshold: ≥80%) ✓

Below Threshold:
- Task specificity: 78% (threshold: ≥80%)
  Recommendation: Review tasks and ensure they contain actionable verbs like "implement", "create", "add"
  Vague tasks found:
  - "Think about user experience" → Change to "Design user experience flow"
  - "Consider error handling" → Change to "Implement error handling for API calls"

Quality Score: 87% (threshold: ≥90%)
Status: Below threshold - implementation allowed with warning

Recommendation: Improve task specificity before implementation for better quality.
Options:
- 'continue' to proceed with implementation despite low quality score
- 'exit' to return to specs-create workflow to improve specs
- 'fix' to address specific quality issues interactively
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
- specs-implement: Validates and warns if score <90% (Step 4)
- Both workflows use the same quality score calculation method
- If score is 75-89%, implementation is allowed with warning
- If score is <75%, strongly recommend returning to specs-create workflow

### 5. Parse Specs Structure

Read the `specs/README.md` to understand the phase structure and dependencies.

**AI Execution Instructions:**

1. **Read the specs/README.md file**
2. **Determine the README format:**
   - Check if it contains a "Phase List" section (sequential format)
   - Check if it contains a "Feature Matrix" table (categorized format)
3. **Parse based on format:**

**For sequential READMEs:**
- Look for the "Phase List" section
- Extract each line in the format: `Phase N: [Phase Name] - specs/phase-N-[slug].md`
- For each line, extract:
  - Phase number (N)
  - Phase name
  - Phase file path
- Dependencies are implicit: Phase N depends on Phase N-1, N-2, etc.

**For categorized READMEs:**
- Look for the "Feature Matrix" table
- Parse each row (skipping header row)
- For each row, extract:
  - Phase name (from Phase column)
  - Phase file path (infer from phase name: `specs/phase-N-[slug].md`)
  - Category (from Category column)
  - Dependencies (from Dependencies column, comma-separated)
- Parse dependencies: split by comma, trim whitespace, remove "None" if present

4. **Validate parsed data:**
- Ensure all phase file paths exist
- Ensure phase numbers are numeric (not alphanumeric like "1a")
- Ensure phase names are unique
- Ensure dependency references match actual phase names

5. **Handle parsing errors:**
   - If README format doesn't match expected patterns:
     - Report specific parsing error to user
     - Show which section failed to parse
     - Offer options:
       - 'fix' to manually correct the README format
       - 'exit' to stop the workflow
       - 'manual' to provide phase information manually
   - If phase file paths don't exist:
     - List missing files
     - Ask user to correct README or provide correct paths
   - If phase names in dependencies don't match:
     - Show mismatched dependency references
     - Ask user to correct dependency names in README

6. **Build dependency graph:**
- Create a mapping of phase name -> list of dependencies
- For sequential phases: each phase depends on all previous phases
- For categorized phases: use explicitly listed dependencies

7. **Create or update `.specs-progress.json`:**
- If file doesn't exist, create it with:
  ```json
  {
    "repository": "[repo name]",
    "lastUpdated": "[timestamp]",
    "specVersion": "[version from README]",
    "startPhase": null,
    "auditLog": [],
    "phases": []
  }
  ```
- Add each phase to the phases array with:
  ```json
  {
    "name": "Phase N: [Phase Name]",
    "file": "specs/phase-N-[slug].md",
    "status": "pending",
    "specVersion": "[version from README]",
    "tasks": []
  }
  ```
- Save the updated progress file

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

**Progress File Initialization:**
If no progress file exists, initialize it now after successful spec parsing:

**Initialization Sequence:**
1. Create empty progress file structure with repository metadata
2. Parse phase information from README (Step 5)
3. Populate the phases array with parsed phase data
4. Set initial status for all phases to "pending"
5. Set startPhase based on user selection (if any)

```bash
# Initialize progress file with parsed phases
# This is done after successful validation and parsing to ensure valid state

# Platform-agnostic approach using Python (if available):
python3 << 'EOF'
import json
import os
from datetime import datetime

if not os.path.exists('.specs-progress.json'):
    # Get repository name
    repo_name = os.path.basename(os.getcwd())
    
    # Create progress file structure
    progress = {
        "repository": repo_name,
        "lastUpdated": datetime.utcnow().isoformat() + "Z",
        "specVersion": "",
        "startPhase": None,
        "auditLog": [],
        "phases": []
    }
    
    with open('.specs-progress.json', 'w') as f:
        json.dump(progress, f, indent=2)
    
    print("Progress file initialized successfully")
else:
    print("Progress file already exists")
EOF
```

### 6. Resolve Dependencies

Before selecting the next phase, resolve dependencies:

**AI Execution Instructions:**

1. **Check if all dependencies for pending phases are satisfied:**
   - For each phase with status "pending" or "in-progress":
     - Get its list of dependencies from the dependency graph
     - Check if each dependency phase has status "completed"
     - If all dependencies are "completed", the phase is ready to start

2. **Identify phases that can be started:**
   - Create a list of phases where all dependencies are satisfied
   - These phases are candidates for the next implementation

3. **Handle skipped dependencies:**
   - If a dependency phase has status "skipped", warn the user
   - Explain that skipped dependencies do NOT satisfy dependency requirements
   - Ask user to confirm before proceeding with a phase that has skipped dependencies

4. **Perform circular dependency check:**
   - For each phase, trace its dependency chain
   - Check if any phase eventually depends on itself
   - If a circular dependency is detected:
     - Report the circular dependency chain
     - Ask user to fix the dependencies in the README
     - Do not proceed until circular dependencies are resolved

5. **If multiple phases are available:**
   - By default, use Sequential Priority (implement phases in numerical order)
   - If user explicitly requests selective implementation, present options:
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

**Dependency Resolution Rules:**
- Phases with no dependencies can be started immediately
- Phases with dependencies must wait for all dependencies to complete
- If dependencies are marked as skipped, warn user before proceeding
  - Skipped dependencies do NOT satisfy dependency requirements
  - A phase cannot proceed if its dependencies were skipped unless the user explicitly confirms
  - This prevents implementing phases that depend on incomplete functionality

**Dependency Conflict Resolution:**
When multiple phases have satisfied dependencies and are available to start:

**Default Strategy**: Use Sequential Priority (implement phases in numerical order)
- This is the default behavior unless the user explicitly requests selective implementation
- Phases are implemented in order: Phase 1, then Phase 2, then Phase 3, etc.
- This ensures predictable implementation order and minimizes complexity

**Alternative Strategies** (available if user chooses selective implementation):
1. **Sequential Priority**: Default to implementing phases in numerical order (Phase 1, then Phase 2, etc.)
2. **User Selection**: If multiple phases are available, present options to user
3. **Critical Path Priority**: If phases have different downstream dependencies, prioritize phases that unblock the most subsequent phases
4. **Dependency Depth**: Prefer phases with fewer remaining dependencies in their chain

**Decision Logic**:
- By default, use Sequential Priority for predictable implementation order
- If user explicitly requests selective implementation, present User Selection option
- Critical Path Priority and Dependency Depth are advanced options that can be used when optimizing for parallel development or minimizing overall implementation time

**Dependency Resolution Examples and Edge Cases:**

**Example 1: Simple Sequential Dependencies**
```
Phase 1: Foundation (no dependencies)
Phase 2: Auth (depends on Phase 1)
Phase 3: Tasks (depends on Phase 1, Phase 2)

Resolution: Implement in order 1 → 2 → 3
```

**Example 2: Parallel Independent Phases**
```
Phase 1: Foundation (no dependencies)
Phase 2: Auth (depends on Phase 1)
Phase 3: UI (depends on Phase 1)
Phase 4: Tasks (depends on Phase 2, Phase 3)

Resolution: After Phase 1, both Phase 2 and Phase 3 are available
Default: Implement Phase 2 first (sequential priority)
Alternative: User can choose between Phase 2 and Phase 3
```

**Example 3: Circular Dependency Detection**
```
Phase 1: Foundation (depends on Phase 3) ← CIRCULAR
Phase 2: Auth (depends on Phase 1)
Phase 3: Tasks (depends on Phase 2)

Detection: Phase 1 → Phase 3 → Phase 2 → Phase 1 (cycle)
Action: Report circular dependency and ask user to fix
```

**Example 4: Skipped Dependency Handling**
```
Phase 1: Foundation (completed)
Phase 2: Auth (skipped by user)
Phase 3: Tasks (depends on Phase 1, Phase 2)

Detection: Phase 3 depends on Phase 2 which was skipped
Action: Warn user that Phase 2 was skipped
Ask: "Phase 3 depends on Phase 2 which was skipped. Continue anyway?"
```

**Example 5: Complex Dependency Graph**
```
Phase 1: Foundation (no dependencies)
Phase 2: Auth (depends on Phase 1)
Phase 3: Database (depends on Phase 1)
Phase 4: API (depends on Phase 2, Phase 3)
Phase 5: UI (depends on Phase 4)
Phase 6: Tests (depends on Phase 4)

Resolution:
- Phase 1 first
- Then Phase 2 or Phase 3 (parallel opportunity)
- Then Phase 4 (after both 2 and 3)
- Then Phase 5 or Phase 6 (parallel opportunity)
Default: Sequential 1 → 2 → 3 → 4 → 5 → 6
```

## Continue to Part 2

For the remaining setup steps (Steps 7-11), see `setup-preparation.md`.
