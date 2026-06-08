---
name: specs-create
description: Create comprehensive design and spec plans for a project with phases and implementation details. ALWAYS use this skill when the user asks to create project specifications, design documents, or implementation plans, mentions spec creation or project planning, wants to create a specs/ directory with phase files, needs to break down a project into phases, or is planning any software development work. This skill is essential for any project planning or specification task.
argument-hint: Provide the project name, goals, features, and technology stack. Include any specific requirements or constraints.
license: MIT
version: 1.0.0
compatibility: Requires repository root access, ability to create markdown files and directories, and basic understanding of project planning
---

# Spec Creation Workflow

This workflow guides you through creating a comprehensive design and spec plan for your project. It generates a `specs/` directory with a README.md and individual phase files based on your project requirements.

**Success Criteria:**
The skill execution is considered successful when:
- Specs are created with quality score ≥90%
- All validation rules pass (unique phase names, valid dependencies, required fields present)
- README.md and all phase files are generated
- CHANGELOG.md is initialized
- Specs are ready for implementation with specs-implement workflow

## Prerequisites

- Clear understanding of your project's goals and features (can articulate main features and user needs)
- Basic knowledge of the technology stack you'll use (familiar with core concepts and capabilities)
- Ideas about how to break down the project into phases (high-level phase structure in mind)

**Prerequisite Validation:**
Before proceeding, verify you can answer these questions:
- Can you describe the main features your project needs?
- Do you know which technologies you'll use (programming language, framework, database)?
- Do you have a rough idea of how to organize the work into phases?

If you cannot answer these questions, consider gathering more information before using this skill. For new codebases without existing requirements, the workflow will guide you through technology selection in Step 2.

**Terminology:**
- **Deep understanding**: Ability to articulate code structure, design patterns, business logic, integration points, existing technologies, and documentation
- **Clear understanding**: Can explain the main features, user needs, and core concepts without ambiguity

## Platform Requirements

This workflow uses bash scripts for quality score calculation and validation. The following are required:
- Bash shell (version 4.0+ recommended for advanced features)
- Standard Unix tools: awk, grep, find, wc, sed
- jq (recommended for JSON parsing, fallback methods available)
- Access to the repository root directory

**Cross-Platform Fallback:**
For systems without bash or with older bash versions (e.g., Windows without WSL), manual quality assessment is required:

**Manual Quality Assessment Checklist:**
- [ ] All phase files have required sections (Overview, Context, Implementation Tasks, Technical Requirements, Success Criteria)
- [ ] All tasks are actionable and specific (use imperative verbs)
- [ ] Success criteria contain action verbs (verify, confirm, ensure, validate, check, test)
- [ ] Dependencies are minimal (0-3 per phase) and no circular dependencies exist
- [ ] Phase sizes are appropriate (5-15 tasks per phase)
- [ ] Phase file naming follows pattern (phase-[N]-[slug].md)
- [ ] README.md includes Feature Matrix with Dependencies column
- [ ] All validation rules pass (unique phase names, valid dependencies, required fields present)

**Windows Support:**
- Use WSL (Windows Subsystem for Linux) for full bash script support
- Alternatively, use the manual quality assessment checklist above
- PowerShell script for quality score calculation can be created on request

**Bash Script Error Handling:**
The quality score calculation bash script includes error handling for:
- Missing specs directory (exits with error)
- No phase files found (exits with error)
- File read/write errors (exits with error)
- Division by zero (handled with conditional check)
- jq unavailability (uses fallback parsing methods)
If the script fails, use the manual quality assessment checklist above

## Usage

Run this workflow from the root of your repository:

```
/specs-create
```

## Workflow Steps

The complete workflow is split into two phases to keep each document under 500 lines:

### Planning Phase (Steps 1-5)
**Read `references/planning.md` now to proceed with Steps 1-5.**

See `references/planning.md` for:
1. Repository Review (Required First Step) - Complete when you can articulate: code structure, design patterns, business logic, integration points, existing technologies, and documentation
2. New Codebase Detection and Technology Guidance
3. Project Overview Gathering
4. Phase Organization Strategy
5. Phase Definition

**Planning Phase Completion Checkpoint:**
Before proceeding to Execution Phase, confirm:
- [ ] Repository review is complete (for existing codebases)
- [ ] Technology stack is selected (for new codebases)
- [ ] Project overview is documented
- [ ] Phase organization strategy is chosen
- [ ] All phases are defined with dependencies

### Execution Phase (Steps 6-13)
**Read `references/execution.md` now to proceed with Steps 6-13.**

See `references/execution.md` for:
6. Phase Detail Gathering
7. README.md Generation
8. Validate Spec Structure
9. Spec Readiness Assessment
10. File Generation
11. Review and Refine
12. Iteration Mode
13. Finalization

**Note:** The quality score calculation bash script in execution.md should be saved to a file (e.g., `calculate-quality-score.sh`), made executable with `chmod +x`, and run from the repository root directory after generating spec files.

## Reference Materials

For detailed templates, maintenance strategies, and guidelines, see:
- **Planning Phase**: `references/planning.md` - Steps 1-5
- **Execution Phase**: `references/execution.md` - Steps 6-13
- **Templates**: `references/templates.md` - Phase file and README templates
- **Maintenance**: `references/maintenance.md` - Migration, versioning, and import/export
- **Guidelines**: `references/guidelines.md` - Best practices and quality metrics

**Example Phase File Format:**
```markdown
# Phase 1: Foundation

## Overview
[Detailed description of what this phase implements]

## Context
[Additional context about why this phase is needed]

## Implementation Tasks
### Category 1
- [ ] Task 1
- [ ] Task 2

## Technical Requirements
- Framework: [Technology]
- State Management: [Pattern]

## Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2
```
