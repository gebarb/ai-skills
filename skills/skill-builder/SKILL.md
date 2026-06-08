---
name: skill-builder
description: Create AI skills/workflows following current best practices. Use this skill whenever the user asks to create a skill, build a workflow, write a SKILL.md, mentions skill development or workflow creation, needs guidance on current best practices, or wants to automate a task with an AI agent. Do NOT use for modifying existing skills/workflows (use skill-review).
argument-hint: Provide the task or process you want to automate, along with any specific requirements or constraints.
version: 1.4.0
compatibility: Requires repository root access, ability to create and edit markdown files, standard file system tools, and web access for Step 0 (optional but recommended)
---

# Skill Builder Workflow

This workflow guides you through creating AI skills or workflows that follow current best practices (standards from the last 6-12 months). It performs live research to retrieve and apply the most current standards from all available external sources, ensuring skills are reliable, standards-compliant, and produce consistent output.

## Prerequisites

- Clear understanding of the task or process you want to automate
- Basic familiarity with AI agent skills and workflows
- Understanding of the difference between Skills (automatic invocation) and Workflows (manual invocation)

**Prerequisite Validation:**
Before starting, verify you have:
- Repository root access (ability to create directories in the repository)
- Ability to create and edit markdown files
- Standard file system tools available

If any prerequisite is not met, contact your administrator or check file permissions before proceeding.

**Progressive Disclosure**: This workflow uses a 4-level information loading system where only essential context (name + description) is always visible, detailed instructions load when invoked, supporting files load as needed, and rarely used context loads only in specific scenarios. This keeps the context window lean while providing comprehensive guidance.

## Scope and Exclusions

**Included:**
- Creating new AI skills with progressive disclosure
- Creating new AI workflows for manual invocation
- Dynamic standards lookup and research
- Comprehensive validation and refinement phases
- Templates and guidelines for skill/workflow development

**Excluded:**
- Modifying existing skills or workflows (use skill-review for that)
- Platform-specific deployment or installation
- Advanced debugging or troubleshooting of agent behavior
- Integration with specific external tools or services (unless part of skill design)

**Directory Structure:**
- Skills are stored in `skills/skill-name/` directories
- Workflows are stored as single files in `workflows/` directory

## Quick Start

**Minimal Quick Start (3 steps):**
1. Run `/skill-builder` and follow the workflow phases
2. Read each reference file when prompted (e.g., "Read references/planning.md now")
3. Test your created skill/workflow with realistic scenarios

For detailed step-by-step guidance and examples, see `references/quick-start.md`.

## Platform Requirements

This workflow uses standard file operations and markdown editing. The following are required:
- Access to the repository root directory
- Ability to create and edit markdown files
- Standard file system tools

## Usage

Run this workflow from the root of your repository:


**Interactive Workflow Features:**
- You can skip phases if already completed with documented evidence (e.g., existing purpose statement, scope boundaries, documented standards). Do not skip without proof of completion.
- Save your progress at any phase by documenting which phase you're on and what outputs you've produced in a temporary file or comment
- Revisit previous phases if needed during the workflow
- If you get stuck, consult the relevant reference file or troubleshooting guide. If the reference file doesn't resolve your issue, see `references/troubleshooting.md` or consider pausing and seeking help
```
/skill-builder
```

## Workflow Steps

The complete workflow is organized into phases to ensure comprehensive skill/workflow creation:

**Time Estimates:**
- **Step 0 (Dynamic Standards Lookup)**: 5-15 minutes (Basic: 5 min, Advanced: 10-15 min)
- **Planning Phase (Steps 1-5)**: 15-30 minutes
- **Creation Phase (Steps 6-12)**: 30-60 minutes
- **Validation Phase (Steps 13-17)**: 15-30 minutes
- **Refinement Phase (Steps 18-20)**: 15-30 minutes
- **Total**: 80-165 minutes (1.5-2.75 hours)

**Note**: Time estimates assume familiarity with markdown files and basic AI agent concepts. If you have never created a skill/workflow before, add 100% to the estimates above. If you have created 1-2 skills/workflows, add 50%.

**Success Criteria for Each Phase:**
- **Step 0 (Dynamic Standards Lookup)**: 3+ key principles identified from sources AND documented before proceeding. If time limit was reached without adequate standards, extend time or use fallback guidelines.
- **Planning Phase (Steps 1-5)**: All 5 planning steps completed with documented outputs (purpose statement, scope boundaries, use case mappings, requirements inventory, progressive disclosure structure). Confirm all success criteria are met before proceeding to next phase.
- **Creation Phase (Steps 6-12)**: Skill/workflow directory created, SKILL.md written with proper YAML frontmatter, all supporting files added. Confirm all success criteria are met before proceeding to next phase.
- **Validation Phase (Steps 13-17)**: All validation checklists completed with documented results, execution path walkthrough performed, all identified ambiguities resolved. Confirm all success criteria are met before proceeding to next phase.
- **Refinement Phase (Steps 18-20)**: All critical and high-priority issues addressed, documentation added, quality checklist passed. Confirm all success criteria are met before proceeding to next phase.

**Error Handling:**
- If Step 0 web searches fail: Proceed with general best practices and document the limitation
- If supporting files are missing: Create them using templates in `references/templates.md`
- If validation fails: Use `references/validation.md` checklists to identify and fix issues
- If user gets stuck: Review relevant reference file or consult the specific phase documentation. If still stuck, see `references/troubleshooting.md` for escalation guidance
- If reference files are missing or corrupted: Verify file paths and permissions. If files cannot be accessed, recreate from templates in `references/templates.md`
- For detailed error handling guidance, see `references/validation.md` and `references/refinement.md`

### Dynamic Standards Lookup Phase (Step 0)

**Step 0: Retrieve Current Best Practices**

Before beginning the skill/workflow creation, perform research to retrieve current standards and best practices. This ensures your skill follows the most up-to-date guidelines.

**IMPORTANT: Communicate research process to user explicitly** - Before and during research, tell the user which sources you are consulting and what standards you are looking up. This makes the process transparent and helps the user understand where standards come from.

**Validation Checkpoint:** Before proceeding to Planning Phase, confirm at least 3 standards were retrieved and documented. If time limit was reached without adequate standards, extend research time or use fallback guidelines from `references/guidelines.md`.

Read `references/standards-lookup.md` now for detailed guidance on Step 0, including mode selection criteria and research strategies.

### Planning Phase (Steps 1-5)
Read `references/planning.md` now for detailed guidance on:
1. **Determine Skill vs Workflow** - Decide whether to create a Skill (automatic invocation) or Workflow (manual invocation)
2. **Define Purpose and Scope** - Clearly articulate what the skill/workflow should accomplish and its boundaries
3. **Identify Use Cases** - Map out specific scenarios where this skill/workflow will be used
4. **Gather Requirements** - Collect all necessary context, templates, scripts, and supporting materials
5. **Design Progressive Disclosure Structure** - Plan how to organize information across SKILL.md and supporting files

**Validation Checkpoint:** Before proceeding to Creation Phase, confirm all 5 planning steps are completed with documented outputs.

### Creation Phase (Steps 6-12)
Read `references/creation.md` now for detailed guidance on:
6. **Create Skill/Workflow Directory** - Set up the proper directory structure
7. **Write YAML Frontmatter** - Create proper name and description following current standards retrieved in Step 0
8. **Draft Core Content** - Write the main SKILL.md or workflow markdown content
9. **Add Supporting Files** - Create reference documents, templates, scripts as needed
10. **Implement Progressive Disclosure** - Structure content to load only when needed
11. **Add Error Handling and Edge Cases** - Ensure robust execution
12. **Include Examples and Usage Instructions** - Make the skill/workflow easy to understand and use

**Validation Checkpoint:** Before proceeding to Validation Phase, confirm directory is created, SKILL.md is written with proper frontmatter, and all supporting files are added.

### Validation Phase (Steps 13-17)
Read `references/validation.md` now for detailed guidance on:
13. **Self-Review Against Standards** - Verify compliance with current standards retrieved in Step 0
14. **Test Execution Path** - Walk through the skill/workflow step by step
15. **Validate Progressive Disclosure** - Ensure information loads at appropriate levels
16. **Check for Ambiguities** - Identify and clarify unclear instructions
17. **Verify Completeness** - Ensure all necessary context is provided

**Validation Checkpoint:** Before proceeding to Refinement Phase, confirm all validation checklists are completed with documented results and all ambiguities are resolved.

### Refinement Phase (Steps 18-20)
Read `references/refinement.md` now for detailed guidance on:
18. **Iterate Based on Review** - Make improvements identified during validation
19. **Add Documentation** - Create supporting documentation if needed
20. **Final Polish** - Ensure clarity, consistency, and professional quality

**Validation Checkpoint:** Before proceeding to Testing Phase, confirm all critical and high-priority issues are addressed, documentation is added, and quality checklist is passed.

### Testing and Integration Phase (Step 21)
21. **Test the Created Skill/Workflow** - Verify the skill/workflow works as intended

**Testing Procedure:**

1. **Test with Realistic Scenarios**
   - Select 2-3 use cases identified in Step 3
   - For each use case, simulate the trigger context
   - Execute the skill/workflow step by step
   - Document any deviations from expected behavior

2. **Verify Skill Triggering (Skills Only)**
   - Test automatic invocation: Provide context that should trigger the skill
   - Test manual invocation: Use @mention to invoke the skill
   - Verify the skill name and description enable accurate triggering
   - Confirm the skill loads appropriate progressive disclosure levels

3. **Verify Workflow Execution (Workflows Only)**
   - Test slash command invocation: Run `/workflow-name`
   - Verify all steps execute in correct order
   - Confirm the workflow completes successfully
   - Test with different input variations

4. **Validate Step Clarity**
   - Read each step as if encountering it for the first time
   - Verify each step has clear starting and ending points
   - Check that transitions between steps are smooth
   - Ensure all commands are complete and executable
   - Verify file paths are correct and accessible

5. **Validate Error Handling**
   - Test common error scenarios (missing files, invalid inputs, permission issues)
   - Verify error messages are clear and actionable
   - Check that recovery procedures work as documented
   - Confirm validation steps catch issues appropriately

6. **Test Edge Cases**
   - Test with minimal prerequisites (bare minimum to function)
   - Test with maximum complexity (all features enabled)
   - Test with unusual or unexpected inputs
   - Verify behavior when supporting files are missing

7. **Document Test Results**
   - Record which scenarios passed/failed
   - Note any issues or ambiguities found
   - Document required fixes or improvements
   - Track time taken for each test scenario

**If Issues Are Found:**
- Identify which step or phase failed and consult the corresponding reference file for that phase
- Return to the Refinement Phase (Steps 18-20) to address issues
- Fix critical issues (blocking execution) immediately
- Fix high-priority issues (affecting usability) before common use
- Document low-priority issues for future iterations
- Re-test after fixes are applied

**After Successful Testing:**
- Consider running `/skill-review` on the created skill/workflow for additional validation
- Update documentation based on test findings
- Add new examples or use cases discovered during testing
- Mark the skill/workflow as ready for distribution

## Troubleshooting

For common issues and solutions during the skill-builder workflow, see `references/troubleshooting.md`.

## Reference Materials

For detailed templates, guidelines, and best practices, see:
- **Dynamic Standards Lookup**: `references/standards-lookup.md` - Step 0 guidance
- **Planning Phase**: `references/planning.md` - Steps 1-5
- **Creation Phase**: `references/creation.md` - Steps 6-12
- **Validation Phase**: `references/validation.md` - Steps 13-17
- **Refinement Phase**: `references/refinement.md` - Steps 18-20
- **Templates**: `references/templates.md` - SKILL.md and workflow templates
- **Guidelines**: `references/guidelines.md` - Standards framework (use with Step 0 findings)
- **Troubleshooting**: `references/troubleshooting.md` - Common issues and solutions
- **Lifecycle Example**: `references/lifecycle-example.md` - Complete development example

## Integration in Development Lifecycle

This workflow is designed to be used when creating new skills or workflows:

1. `/skill-builder` - Create a new skill or workflow following best practices
2. `/skill-review` - Review and refine the created skill/workflow (run 3+ times for optimal results)
3. Install and test the skill/workflow in your environment

This ensures that skills and workflows are built to high standards from the start, reducing the need for extensive rework later.

### Full Lifecycle Example

For a concrete example of the complete skill/workflow development lifecycle, including the recommended review cadence, see `references/lifecycle-example.md`.