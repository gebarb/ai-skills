---
description: Validate specs through comprehensive multi-perspective review - Part 1: Initial Assessment Phase (Steps 1-3)
---

# Spec Validation Workflow - Part 1: Initial Assessment Phase

This is Part 1 of the specs-validate workflow, covering Steps 1-3: Repository review, spec structure validation, and spec completeness check.

For the complete workflow, see:
- Initial Assessment: This file (Steps 1-3)
- Multi-Perspective Review: `~/.codeium/windsurf/docs/specs-references/specs-validate-review.md` (Steps 4-6)
- Synthesis: `~/.codeium/windsurf/docs/specs-references/specs-validate-synthesis.md` (Steps 7-9)
- User Interaction: `~/.codeium/windsurf/docs/specs-references/specs-validate-interaction.md` (Steps 10-12)
- Finalization: `~/.codeium/windsurf/docs/specs-references/specs-validate-finalization.md` (Steps 13-14)

## Usage

Run this workflow from the root of your repository:

```
/specs-validate
```

## Workflow Steps

### 1. Repository Review (Required First Step)

**CRITICAL**: Before validating specs, you must review the repository to understand the current state and context.

**Comprehensive Repository Review:**
- Examine the repository structure and organization
- Review existing code to understand:
  - Current architecture and design patterns
  - Technology stack and dependencies
  - Coding conventions and standards
  - Existing functionality and features
- Check for existing documentation, tests, and configuration files
- Understand the project's current state and maturity
- Note any existing issues, TODOs, or known limitations

**Spec Directory Review:**
- Verify `specs/` directory exists
- Review `specs/README.md` structure and content
- List all phase files (e.g., `phase-*.md`)
- Check for any additional spec-related files or directories

**Do NOT proceed to subsequent steps until this comprehensive review is complete.**

### 2. Spec Structure Validation

Validate that the specs follow the expected structure and format:

**Required Structure Check:**
- [ ] `specs/` directory exists
- [ ] `specs/README.md` exists
- [ ] Phase files follow naming convention: `phase-*.md`
- [ ] Phase numbers are sequential (1, 2, 3, ...)
- [ ] No duplicate phase numbers

**README.md Validation:**
- [ ] Contains project overview
- [ ] Lists all phases with descriptions
- [ ] Defines phase dependencies
- [ ] Documents technology stack (if applicable)
- [ ] Includes implementation guidance

**Phase File Validation:**
For each phase file, verify:
- [ ] Phase title and number are clear
- [ ] Phase description is present
- [ ] Dependencies are listed (if any)
- [ ] Implementation tasks are defined
- [ ] Success criteria are specified
- [ ] Technical requirements are documented
- [ ] File length is under 500 lines

**Dependency Validation:**
- [ ] All referenced dependencies exist
- [ ] No circular dependencies
- [ ] Dependency graph is acyclic
- [ ] Dependencies are logically ordered

**Bash Validation Script:**
```bash
#!/bin/bash
set -e  # Exit on error
set -u  # Exit on undefined variable

# Validate spec structure
if [ ! -d "specs" ]; then
  echo "ERROR: specs/ directory not found"
  exit 1
fi

if [ ! -f "specs/README.md" ]; then
  echo "ERROR: specs/README.md not found"
  exit 1
fi

# Check for phase files
phase_count=$(find specs -name "phase-*.md" | wc -l)
if [ $phase_count -eq 0 ]; then
  echo "ERROR: No phase files found (expected pattern: phase-*.md)"
  exit 1
fi

echo "✓ Spec structure validation passed"
echo "  Found $phase_count phase files"
```

**If validation fails:**
- Report specific structural issues
- Provide guidance on fixing structure
- Do not proceed until structure is corrected

### 3. Spec Completeness Check

Assess the completeness of the specs across all phases:

**Completeness Criteria:**

**Project-Level Completeness:**
- [ ] All major features are covered in phases
- [ ] Phase dependencies form a complete implementation path
- [ ] Technology stack is documented (for new codebases)
- [ ] Architecture decisions are explained
- [ ] Testing strategy is defined

**Phase-Level Completeness:**
For each phase, verify:
- [ ] Clear scope and objectives
- [ ] Comprehensive task list
- [ ] Specific success criteria
- [ ] Technical requirements defined
- [ ] Dependencies clearly stated
- [ ] Acceptance criteria specified
- [ ] Edge cases considered

**Task-Level Completeness:**
- [ ] Tasks are actionable and specific
- [ ] Tasks have sufficient detail for implementation
- [ ] Tasks are properly sequenced
- [ ] Task estimates are reasonable
- [ ] Task dependencies are clear

**Completeness Scoring:**
Calculate a completeness score for each phase:

```bash
# Completeness scoring (example)
# Score = (present_elements / total_elements) * 100

elements=(
  "phase_description"
  "dependencies"
  "implementation_tasks"
  "success_criteria"
  "technical_requirements"
  "acceptance_criteria"
)

# Count present elements in each phase
# Calculate percentage
# Report phases with completeness < 80%
```

**Gap Identification:**
Identify missing or incomplete elements:
- Missing phases for major features
- Incomplete task descriptions
- Undefined success criteria
- Missing technical requirements
- Unclear dependencies
- Absence of testing considerations

**Report Format:**
```
=== Spec Completeness Report ===

Overall Completeness: [X]%

Phase-by-Phase Analysis:
Phase 1: [X]% - [Status]
  - Missing: [list missing elements]
  - Issues: [list issues]

Phase 2: [X]% - [Status]
  ...

Critical Gaps:
- [Gap 1]
- [Gap 2]
...

Recommendations:
- [Recommendation 1]
- [Recommendation 2]
...
```

**If completeness is insufficient (< 70%):**
- Recommend returning to specs-create workflow
- Identify specific gaps to address
- Provide guidance on improving completeness

**If completeness is acceptable (70-89%):**
- Note areas for improvement
- Proceed to multi-perspective review with caveats
- Document gaps for later addressing

**If completeness is good (90%+):**
- Proceed to multi-perspective review
- Note any minor improvements

## Continue to Part 2

For Steps 4-6 (Multi-Perspective Review Phase), see `~/.codeium/windsurf/docs/specs-references/specs-validate-review.md`.
