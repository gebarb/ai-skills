---
description: Create comprehensive design and spec plans for a project - Part 2: Execution Phase (Steps 6-13)
---

# Spec Creation Workflow - Part 2: Execution Phase

This is Part 2 of the specs-create workflow, covering Steps 6-13: Phase detail gathering, README generation, validation, spec readiness assessment, file generation, review and refine, iteration mode, and finalization.

For the complete workflow, see:
- Planning Phase: `~/.codeium/windsurf/docs/specs-references/specs-create-planning.md` (Steps 1-5)
- Execution Phase: This file (Steps 6-13)

## Workflow Steps

### 6. Phase Detail Gathering

For each phase, gather detailed information:

```
=== Phase Detail: [Phase Name] ===

File: phase-[N]-[slug].md

1. Overview:
   [Detailed description of what this phase implements and its purpose]

2. Context:
   [Additional context about why this phase is needed and what problems it solves]

3. Reference Material:
   [References to main specs, documentation, or external resources]

4. Implementation Tasks:
   Break down into categories. For each category, list specific tasks with checkboxes.
   
   Category 1: [Category Name]
   - [ ] Task 1
   - [ ] Task 2
   - [ ] Task 3
   
   Category 2: [Category Name]
   - [ ] Task 1
   - [ ] Task 2

5. Technical Requirements:
   - Framework/Technology
   - Key dependencies
   - Platform-specific requirements
   - Performance requirements

6. Success Criteria:
   List all criteria that must be met for this phase to be considered complete:
   - [ ] Criterion 1
   - [ ] Criterion 2
   - [ ] Criterion 3

7. Next Phase Preparation:
   [How this phase prepares for the next phase]

8. Additional Sections (optional):
   - Testing Strategy
   - Risks & Mitigations
   - Estimated Timeline
   - Notes
```

Repeat this for all phases.

**Dependency Validation:**
As you define each phase, validate dependencies (see detailed validation rules in Step 8).

### 7. README.md Generation

Generate the comprehensive README.md with:

```
=== README.md Structure ===

The README will include:

1. Overview
   - Project description
   - Phase organization approach
   - Development strategy

2. Project Structure
   - Phase organization
   - Dependencies & timeline
   - Phase dependencies (critical path)

3. Feature Matrix
   - Table showing phases, screens/components, categories, and dependencies

4. Development Strategy
   - Approach (granular, progressive, etc.)
   - Risk mitigation
   - Quality gates

5. Technology Stack Evolution
   - Dependencies for each phase/category

6. Quality Gates
   - Phase completion criteria
   - Code coverage requirements
   - Performance benchmarks

7. Resource Planning
   - Skill requirements

8. Milestone Planning
   - Major milestones
   - Timeline

9. Risk Management
   - Technical risks
   - Business risks
   - Timeline risks

10. Success Metrics
    - Development metrics
    - Product metrics
    - Business metrics

11. Next Steps
    - Immediate actions
    - Long-term planning

12. Documentation Maintenance
    - Review schedule
```

### 8. Validate Spec Structure

Before generating files, validate the spec structure:

**Validation Rules:**
- Phase names must be unique across all phases
- All dependencies must reference existing phases by name
- At least one phase must be defined
- Required fields for all phases: Overview, Context, Implementation Tasks, Technical Requirements, Success Criteria
- Optional fields (recommended): Reference Material, Next Phase Preparation
- Phase numbering must be consistent:
  - For Option A (Sequential phases): No gaps in sequential numbering (1, 2, 3, etc.)
  - For Option B (Categorized phases): Numbering within each category should be sequential, but gaps between categories are allowed
  - For Option C (Custom phases): Numbering should follow the custom organization structure
- No circular dependencies allowed (A depends on B, B depends on A)
- README structure must match chosen organization strategy
- Success criteria must be measurable (contain action verbs like "verify", "confirm", "ensure", "validate")
- Task descriptions must be actionable and specific
- Technical requirements must not be empty
- Phase file naming must follow `phase-*.md` pattern with numeric phase number (e.g., phase-1-*.md, not phase-1a-*.md or phase-A-*.md)
- The phase number must be a simple integer (1, 2, 3, etc.) without letters or special characters
- **CRITICAL**: Each phase document must be limited to 500 lines or less (enforced during validation)

**Dependency Validation:**
- Ensure all referenced dependencies exist
- Check for circular dependencies
- Warn if a phase has more than 3 direct dependencies (may indicate need for refactoring)
- Validate dependency chains are not excessively long (>5 phases)
- Validate dependency graph satisfiability:
  - Ensure all phases can be reached from the starting point (no orphan phases)
  - Verify no phase depends on a non-existent phase
  - Check that the dependency graph has no disconnected components
  - Ensure all phases have a valid execution order (topological sort possible)

If validation fails, report specific issues with:
- Issue description
- Affected phase(s)
- Severity level (error/warning/info)
- Suggested fix

Offer options:
- 'fix' to correct the issues interactively
- 'continue' to proceed with warnings
- 'exit' to stop and review manually

### 9. Spec Readiness Assessment

Before generating files, assess whether specs are ready for implementation:

**Spec Readiness Checklist:**
- [ ] All validation rules pass
- [ ] Quality score ≥ 90%
- [ ] All dependencies are satisfied
- [ ] Success criteria are measurable
- [ ] Tasks are actionable and specific
- [ ] Technical requirements are complete
- [ ] Migration strategy documented (if breaking changes)

**Quality Score Calculation:**
- Phase completeness: 20% (all required fields filled)
- Task specificity: 20% (tasks are actionable)
- Success criteria measurability: 20% (criteria have action verbs)
- Dependency complexity: 15% (minimal dependencies, no circular deps)
- Phase size appropriateness: 15% (5-15 tasks per phase)
- Validation rule compliance: 10% (all rules pass)

**Implementation:**

**Execution Context:**
This bash script calculates the quality score for specs. The AI assistant should:
1. Execute this script after generating spec files (in Step 10)
2. Run it from the repository root directory
3. Interpret the output score to determine spec readiness
4. If the script fails, perform a manual quality assessment using the criteria above

The script requires:
- Bash shell
- Standard Unix tools (awk, grep, find, wc)
- Access to the specs/ directory

```bash
#!/bin/bash
set -e  # Exit on error
set -u  # Exit on undefined variable

# Calculate quality score using robust parsing
PHASE_COMPLETENESS=0
TASK_SPECIFICITY=0
SUCCESS_CRITERIA_MEASURABILITY=0
DEPENDENCY_COMPLEXITY=0
PHASE_SIZE_APPROPRIATENESS=0
VALIDATION_RULE_COMPLIANCE=0

# Check if specs directory exists
if [ ! -d "specs" ]; then
  echo "Error: specs directory not found"
  exit 1
fi

# Count total phases
TOTAL_PHASES=$(find specs/ -name "phase-*.md" 2>/dev/null | wc -l)
if [ "$TOTAL_PHASES" -eq 0 ]; then
  echo "Error: No phase files found in specs/"
  exit 1
fi

# Check phase completeness with robust section detection
# This section checks each phase file for required sections using awk
for phase_file in specs/phase-*.md; do
  # Check if file exists and is readable
  if [ -f "$phase_file" ] && [ -r "$phase_file" ]; then
    # Check for required sections using awk for robust parsing
    # This handles sections regardless of line count
    has_overview=$(awk '/^## Overview/{found=1} found{if(/^## / && !/^## Overview/){exit} END{print found?1:0}' "$phase_file")
    has_context=$(awk '/^## Context/{found=1} found{if(/^## / && !/^## Context/){exit} END{print found?1:0}' "$phase_file")
    has_tasks=$(awk '/^## Implementation Tasks/{found=1} found{if(/^## / && !/^## Implementation Tasks/){exit} END{print found?1:0}' "$phase_file")
    has_requirements=$(awk '/^## Technical Requirements/{found=1} found{if(/^## / && !/^## Technical Requirements/){exit} END{print found?1:0}' "$phase_file")
    has_criteria=$(awk '/^## Success Criteria/{found=1} found{if(/^## / && !/^## Success Criteria/){exit} END{print found?1:0}' "$phase_file")
    
    if [ "$has_overview" = "1" ] && [ "$has_context" = "1" ] && [ "$has_tasks" = "1" ] && [ "$has_requirements" = "1" ] && [ "$has_criteria" = "1" ]; then
      PHASE_COMPLETENESS=$((PHASE_COMPLETENESS + 1))
    fi
  fi
done

# Avoid division by zero
if [ "$TOTAL_PHASES" -gt 0 ]; then
  PHASE_COMPLETENESS_SCORE=$((PHASE_COMPLETENESS * 20 / TOTAL_PHASES))
else
  PHASE_COMPLETENESS_SCORE=0
fi

# Check task specificity (tasks should be actionable)
# Count tasks in Implementation Tasks section using robust parsing
TASK_COUNT=0
for phase_file in specs/phase-*.md; do
  if [ -f "$phase_file" ] && [ -r "$phase_file" ]; then
    # Extract only the Implementation Tasks section and count checkboxes
    phase_tasks=$(awk '/^## Implementation Tasks/{in_section=1} in_section{if(/^## / && !/^## Implementation Tasks/){exit} if(/^- \[ \]/){count++}} END{print count+0}' "$phase_file")
    TASK_COUNT=$((TASK_COUNT + phase_tasks))
  fi
done
if [ "$TASK_COUNT" -gt 0 ]; then
  TASK_SPECIFICITY=20
fi

# Check success criteria measurability (should have action verbs)
# Count criteria in Success Criteria section using robust parsing
ACTION_VERBS="verify|confirm|ensure|validate|check|test"
CRITERIA_COUNT=0
MEASURABLE_COUNT=0
for phase_file in specs/phase-*.md; do
  if [ -f "$phase_file" ] && [ -r "$phase_file" ]; then
    # Extract Success Criteria section
    phase_criteria=$(awk '/^## Success Criteria/{in_section=1} in_section{if(/^## / && !/^## Success Criteria/){exit} if(/^- \[ \]/){print}}' "$phase_file")
    if [ -n "$phase_criteria" ]; then
      phase_count=$(echo "$phase_criteria" | wc -l)
      phase_measurable=$(echo "$phase_criteria" | grep -E "($ACTION_VERBS)" | wc -l)
      CRITERIA_COUNT=$((CRITERIA_COUNT + phase_count))
      MEASURABLE_COUNT=$((MEASURABLE_COUNT + phase_measurable))
    fi
  fi
done
if [ "$CRITERIA_COUNT" -gt 0 ]; then
  SUCCESS_CRITERIA_MEASURABILITY=$((MEASURABLE_COUNT * 20 / CRITERIA_COUNT))
fi

# Check dependency complexity (no circular deps, minimal dependencies)
# Extract dependencies from README Feature Matrix table instead of phase files
TOTAL_DEPS=0
PHASE_COUNT=0
if [ -f "specs/README.md" ]; then
  # Parse dependencies from Feature Matrix table in README
  # Extract the Dependencies column and count non-None, non-empty entries
  DEP_COUNT=$(awk '/^\|.*\|.*\|.*\|.*\|/{ 
    if (NR > 1) { # Skip header row
      deps = $5
      gsub(/^[[:space:]]*|[[:space:]]*$/, "", deps)
      if (deps != "None" && deps != "" && deps != "-") {
        # Count comma-separated dependencies
        n = split(deps, d, ",")
        total += n
        count++
      }
    }
  } END {print count " " total}' specs/README.md)
  PHASE_COUNT=$(echo "$DEP_COUNT" | awk '{print $1}')
  TOTAL_DEPS=$(echo "$DEP_COUNT" | awk '{print $2}')
fi

# Fallback: if README parsing fails, try phase files (for backward compatibility)
if [ "$PHASE_COUNT" -eq 0 ]; then
  for phase_file in specs/phase-*.md; do
    if [ -f "$phase_file" ] && [ -r "$phase_file" ]; then
      # Try to extract dependencies from phase file if section exists
      phase_deps=$(awk '/^## Dependencies/{in_section=1} in_section{if(/^## / && !/^## Dependencies/){exit} if(/^- /){print}} END{print}' "$phase_file" | wc -l)
      TOTAL_DEPS=$((TOTAL_DEPS + phase_deps))
      PHASE_COUNT=$((PHASE_COUNT + 1))
    fi
  done
fi

if [ "$PHASE_COUNT" -gt 0 ]; then
  AVG_DEPS=$((TOTAL_DEPS / PHASE_COUNT))
  # Score: 15 points if avg deps <= 2, 10 points if avg deps <= 3, 5 points if avg deps <= 4, 0 otherwise
  if [ "$AVG_DEPS" -le 2 ]; then
    DEPENDENCY_COMPLEXITY=15
  elif [ "$AVG_DEPS" -le 3 ]; then
    DEPENDENCY_COMPLEXITY=10
  elif [ "$AVG_DEPS" -le 4 ]; then
    DEPENDENCY_COMPLEXITY=5
  else
    DEPENDENCY_COMPLEXITY=0
  fi
else
  DEPENDENCY_COMPLEXITY=0
fi

# Check phase size appropriateness (5-15 tasks per phase)
APPROPRIATE_SIZE_COUNT=0
for phase_file in specs/phase-*.md; do
  if [ -f "$phase_file" ] && [ -r "$phase_file" ]; then
    # Count tasks in Implementation Tasks section
    phase_tasks=$(awk '/^## Implementation Tasks/{in_section=1} in_section{if(/^## / && !/^## Implementation Tasks/){exit} if(/^- \[ \]/){count++}} END{print count+0}' "$phase_file")
    if [ "$phase_tasks" -ge 5 ] && [ "$phase_tasks" -le 15 ]; then
      APPROPRIATE_SIZE_COUNT=$((APPROPRIATE_SIZE_COUNT + 1))
    fi
  fi
done
if [ "$PHASE_COUNT" -gt 0 ]; then
  PHASE_SIZE_APPROPRIATENESS=$((APPROPRIATE_SIZE_COUNT * 15 / PHASE_COUNT))
else
  PHASE_SIZE_APPROPRIATENESS=0
fi

# Check validation rule compliance
VALIDATION_RULE_COMPLIANCE=10 # Assume good if validation passes

# Calculate total score
TOTAL_SCORE=$((PHASE_COMPLETENESS_SCORE + TASK_SPECIFICITY + SUCCESS_CRITERIA_MEASURABILITY + DEPENDENCY_COMPLEXITY + PHASE_SIZE_APPROPRIATENESS + VALIDATION_RULE_COMPLIANCE))

echo "Quality Score: $TOTAL_SCORE/100"
```

**Readiness Decision:**
- If score ≥ 90%: Ready for implementation
- If score 75-89%: Minor improvements recommended before implementation
- If score < 75%: Significant improvements required before implementation

### 10. File Generation

Create the directory structure and files:

```
=== File Generation ===

Creating:
- specs/
  - README.md
  - CHANGELOG.md
  - phase-1-[slug].md
  - phase-2-[slug].md
  - phase-3-[slug].md
  - ...
```

**CHANGELOG.md Creation:**
Initialize the CHANGELOG.md with the initial spec version:

```markdown
# specs/CHANGELOG.md

## [Unreleased]

## [1.0.0] - [Current Date]
### Added
- Initial spec release with [number] phases
```

**CHANGELOG Maintenance:**
- Update CHANGELOG.md when specs are modified (see specs-create-maintenance.md for details)
- Add entries for breaking changes, new phases, phase modifications, and removals
- Increment spec version according to semantic versioning (major for breaking changes, minor for additions, patch for fixes)
- The CHANGELOG provides a history of spec evolution and helps track changes between spec versions

### 11. Review and Refine

Review the generated specs:

```
=== Review ===

Please review the generated spec files:

1. Check specs/README.md for completeness
2. Review each phase-*.md file for accuracy
3. Verify phase dependencies are correct
4. Ensure success criteria are measurable
5. Check that implementation tasks are actionable
6. Validate that specs match the standardized format
7. Ensure all required sections are present

Would you like to:
- 'approve' to finalize the specs
- 'edit' to make changes to specific files
- 'iterate' to enter iteration mode for refinements
- 'regenerate' to start over with different inputs
```

**Spec Review Checklist:**

**README.md:**
- [ ] Overview section is complete and accurate
- [ ] Phase organization matches actual phase files
- [ ] Dependencies & timeline section is accurate
- [ ] Feature matrix includes all phases
- [ ] Development strategy is clearly defined
- [ ] Technology stack evolution is documented
- [ ] Quality gates are specified
- [ ] Resource planning is included (if applicable)
- [ ] Milestone planning is defined
- [ ] Risk management section is complete
- [ ] Success metrics are measurable
- [ ] Next steps are actionable
- [ ] Documentation maintenance schedule is defined

**Phase Files:**
- [ ] Phase name is descriptive and unique
- [ ] Overview clearly describes phase purpose
- [ ] Context explains why phase is needed
- [ ] Reference material is provided (if applicable)
- [ ] Implementation tasks are:
  - [ ] Grouped into logical categories
  - [ ] Specific and actionable
  - [ ] Within 5-15 tasks per phase
  - [ ] Have clear deliverables
- [ ] Technical requirements are complete
- [ ] Success criteria are:
  - [ ] Specific and measurable
  - [ ] Within 3-7 criteria per phase
  - [ ] Include action verbs
- [ ] Dependencies are accurate and minimal
- [ ] Next phase preparation is described
- [ ] Optional sections are included as needed

**Overall Structure:**
- [ ] All phase files follow standardized format
- [ ] Phase numbering is consistent
- [ ] No circular dependencies exist
- [ ] Dependency chains are not excessively long
- [ ] Phase sizes are appropriate
- [ ] All required fields are present
- [ ] Validation rules pass
- [ ] Specs are ready for implementation

### 12. Iteration Mode

If you choose 'iterate', you can refine the specs:

```
=== Iteration Mode ===

What would you like to modify?

1. Add new phase
2. Remove existing phase
3. Edit phase details
4. Reorder phases
5. Modify dependencies
6. Update README structure
7. Exit iteration mode

Select option (1-7):
```

**Iteration Tracking:**
- Each iteration creates a draft state of the spec
- Iterations are not committed until approved
- Changes are tracked in a draft file (`.specs-draft.json`) during iteration session for crash recovery
- Exit iteration mode to commit or discard changes
- If the workflow crashes during iteration, the draft file can be recovered and the session resumed

**Draft File Schema:**
`.specs-draft.json` structure:
```json
{
  "sessionStarted": "2024-01-15T10:30:00Z",
  "originalSpecs": {
    "phaseFiles": ["specs/phase-1-foundation.md", "specs/phase-2-feature.md"],
    "readmeFile": "specs/README.md"
  },
  "changes": [
    {
      "type": "add|remove|edit|reorder|modify_deps|update_readme",
      "target": "phase-1-foundation.md",
      "timestamp": "2024-01-15T10:35:00Z",
      "details": {
        "field": "overview",
        "oldValue": "Old description",
        "newValue": "New description"
      }
    }
  ],
  "currentPhaseOrder": [1, 2, 3],
  "pendingChanges": true
}
```

**Draft File Recovery:**
If the workflow crashes during iteration mode, recover the draft state:
```bash
# Check if draft file exists
if [ -f .specs-draft.json ]; then
  echo "Draft file found. Recovering iteration session..."
  
  # Validate JSON structure before attempting to parse
  if ! jq empty .specs-draft.json 2>/dev/null; then
    echo "Error: Draft file is corrupted or invalid JSON"
    echo "Options:"
    echo "  'discard' - Delete corrupted draft and start fresh"
    echo "  'manual' - Manually inspect and repair the file"
    read -p "Choose option: " recovery_choice
    if [ "$recovery_choice" = "discard" ]; then
      rm .specs-draft.json
      echo "Draft file discarded. Starting fresh..."
    else
      echo "Manual intervention required. Please inspect .specs-draft.json"
      exit 1
    fi
  else
    # Check if jq is available for JSON parsing (recommended)
    if command -v jq &> /dev/null; then
      # Use jq for JSON parsing
      echo "Session started: $(jq -r '.sessionStarted' .specs-draft.json)"
      echo "Pending changes: $(jq -r '.pendingChanges' .specs-draft.json)"
      echo "Changes made: $(jq '.changes | length' .specs-draft.json)"
    else
      # Fallback: use basic tools for JSON parsing (less accurate)
      echo "Warning: jq not found. Using basic parsing (may be less accurate)."
      echo "Session started: $(grep -o '"sessionStarted"[[:space:]]*:[[:space:]]*"[^"]*"' .specs-draft.json | sed 's/.*"sessionStarted"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/' 2>/dev/null || echo "unknown")"
      echo "Pending changes: $(grep -o '"pendingChanges"[[:space:]]*:[[:space:]]*[^,}]*' .specs-draft.json | sed 's/.*"pendingChanges"[[:space:]]*:[[:space:]]*\([^,}]*\).*/\1/' 2>/dev/null || echo "unknown")"
      # Count opening braces after "changes" to estimate array length
      echo "Changes made: $(grep -A 100 '"changes"' .specs-draft.json | grep -c '{' 2>/dev/null || echo "unknown")"
      echo "Note: Install jq for accurate change counting: brew install jq (macOS) or sudo apt-get install jq (Linux)"
    fi
    
    # Ask user if they want to resume or discard
    echo "Options:"
    echo "  'resume' - Continue iteration from draft state"
    echo "  'discard' - Discard draft and start fresh"
    echo "  'review' - Review draft changes before deciding"
  fi
fi
```

**Modification Details:**

**1. Add new phase:**
- Provide phase name, focus, scope, and dependencies
- Specify phase number or position in sequence
- Follow phase sizing guidelines
- Re-validate after addition

**2. Remove existing phase:**
- Select phase to remove
- Confirm impact on dependent phases
- Update or remove dependencies in other phases
- Re-validate after removal

**3. Edit phase details:**
- Select phase to edit
- Choose section to modify (overview, tasks, requirements, etc.)
- Apply changes
- Re-validate after editing

**4. Reorder phases:**
- Select phases to reorder
- Specify new order
- Update dependencies if needed
- Re-validate after reordering

**5. Modify dependencies:**
- Select phase to modify dependencies for
- Add or remove dependencies
- Validate no circular dependencies introduced
- Re-validate after modification

**6. Update README structure:**
- Modify README sections
- Update phase organization
- Update feature matrix
- Re-validate after update

**7. Exit iteration mode:**
- Show summary of all changes made
- Option to:
  - 'approve' to commit all changes
  - 'discard' to revert all changes
  - 'continue' to keep iterating

After each modification, re-validate the spec structure and show updated summary.

### 13. Finalization

Once approved, the specs are ready for implementation using the `/specs-implement` workflow.

**Save the Specs:**
- Ensure all spec files are saved in the `specs/` directory
- Verify the README.md is complete
- Confirm all phase files are present and properly formatted

**Handoff to Implementation:**
The specs created by this workflow are designed to work seamlessly with the `/specs-implement` workflow. Ensure the following for successful handoff:

**README Requirements for specs-implement:**
- The README must include a parseable phase list in the format expected by specs-implement
- For sequential phases: Include a numbered list (Phase 1, Phase 2, etc.) with file paths
- For categorized phases: Include category sections with phase lists and explicit dependency information
- The Feature Matrix table must include a Dependencies column with explicit dependency references
- Spec version must be present in the README (added automatically by template)

**Dependency Representation:**
- Dependencies defined in phase files must also be represented in the README
- The Feature Matrix table should list all dependencies for each phase
- For categorized phases, dependencies should be explicit in the table or category sections
- **Dependency Format**: Use consistent phase name references (e.g., "Phase 1", "Phase 2: Foundation")
- **Explicit Dependencies**: For sequential phases, dependencies are implicit (previous phases). For categorized phases, dependencies must be explicitly listed
- **Dependency Column**: The Feature Matrix table must include a Dependencies column with comma-separated phase names
- **Parsing Format**: The specs-implement workflow parses dependencies from the README Feature Matrix table. Ensure the Dependencies column uses the exact phase names as they appear in the phase file titles (e.g., "Phase 1: Foundation" not just "Phase 1")

**File Naming:**
- Phase files must follow the `phase-*.md` pattern with numeric phase numbers
- Example: `phase-1-foundation.md`, `phase-2-feature.md` (not `phase-1a-*.md`)

**Validation:**
- All validation rules must pass before proceeding to implementation
- Quality score should be ≥ 90% for best results
- The specs-implement workflow will re-validate the spec structure before implementation

## Reference Materials

For detailed templates, maintenance strategies, and guidelines, see:
- **Templates**: `~/.codeium/windsurf/docs/specs-references/specs-create-templates.md` - Phase file and README templates
- **Maintenance**: `~/.codeium/windsurf/docs/specs-references/specs-create-maintenance.md` - Migration, versioning, and import/export
- **Guidelines**: `~/.codeium/windsurf/docs/specs-references/specs-create-guidelines.md` - Best practices and quality metrics

## Error Handling

If an error occurs during spec creation:

1. Report the error clearly to the user
2. Show which step failed
3. Provide context about what was being created
4. Show relevant error messages
5. Categorize the error (fatal, recoverable, warning)
6. Ask user how to proceed:
   - 'retry' to attempt the step again
   - 'skip' to skip the failing step (with warning)
   - 'exit' to stop and save progress
   - 'continue' to proceed with partial results

**Error Categories:**
- **Fatal**: Cannot proceed without fixing (e.g., validation failure, missing required information)
- **Recoverable**: Can work around or fix with minimal changes
- **Warning**: Non-critical issue that should be addressed but doesn't block progress

**Standardized Error Handling:**
Both specs-create and specs-implement workflows use consistent error categorization and user interaction patterns to ensure a uniform user experience across workflows.

**Common Errors and Solutions:**

**Validation Errors:**
- Circular dependencies detected: Reorder phases or remove dependencies
- Missing required fields: Add missing information to phase files
- Invalid phase naming: Rename phase files to match pattern

**File Generation Errors:**
- Directory creation failed: Check permissions and disk space
- File write failed: Check file system permissions
- Template rendering failed: Verify template syntax

**User Input Errors:**
- Invalid phase number: Provide valid phase number from list
- Missing required information: Prompt user for missing details
- Invalid dependency reference: Correct dependency references

**Progress Saving:**
- If workflow is interrupted, progress is saved in memory
- User can choose to continue from where left off
- Partial specs can be reviewed and refined before finalization
