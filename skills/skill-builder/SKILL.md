---
name: skill-builder
description: Create AI skills/workflows following current best practices. Use when creating skills, building workflows, writing SKILL.md, or needing skill development guidance.
when_to_use: | - User asks to create a skill, build a workflow, or write a SKILL.md - User mentions skill development, workflow creation, or AI agent capabilities - User needs guidance on current best practices for skills/workflows - Do NOT use for: modifying existing skills/workflows (use skill-review)
argument-hint: Provide the task or process you want to automate, along with any specific requirements or constraints.
version: 1.3.0
compatibility: Requires repository root access, ability to create and edit markdown files, standard file system tools, and web access for Step 0 (optional but recommended)
---

# Skill Builder Workflow

This workflow guides you through creating AI skills or workflows that follow current best practices (standards from the last 6-12 months). It performs live research to retrieve and apply the most current standards from all available external sources, ensuring skills are reliable, standards-compliant, and produce consistent output.

## Prerequisites

- Clear understanding of the task or process you want to automate
- Basic familiarity with AI agent skills and workflows
- Understanding of the difference between Skills (automatic invocation) and Workflows (manual invocation)

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

For a fast path to creating a skill or workflow, see `references/quick-start.md` for step-by-step guidance and examples.

## Platform Requirements

This workflow uses standard file operations and markdown editing. The following are required:
- Access to the repository root directory
- Ability to create and edit markdown files
- Standard file system tools

## Usage

Run this workflow from the root of your repository:


**Interactive Workflow Features:**
- You can skip phases if already completed (e.g., if you have existing standards, skip Step 0)
- Save your progress at any phase and return later
- Revisit previous phases if needed during the workflow
- If you get stuck, consult the relevant reference file or troubleshooting guide
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
- **Step 0 (Dynamic Standards Lookup)**: 3+ key principles identified from sources OR time limit reached
- **Planning Phase (Steps 1-5)**: All 5 planning steps completed with documented outputs (purpose statement, scope boundaries, use case mappings, requirements inventory, progressive disclosure structure)
- **Creation Phase (Steps 6-12)**: Skill/workflow directory created, SKILL.md written with proper YAML frontmatter, all supporting files added
- **Validation Phase (Steps 13-17)**: All validation checklists completed with documented results, execution path walkthrough performed, all identified ambiguities resolved
- **Refinement Phase (Steps 18-20)**: All critical and high-priority issues addressed, documentation added, quality checklist passed

**Error Handling:**
- If Step 0 web searches fail: Proceed with general best practices and document the limitation
- If supporting files are missing: Create them using templates in `references/templates.md`
- If validation fails: Use `references/validation.md` checklists to identify and fix issues
- If user gets stuck: Review relevant reference file or consult the specific phase documentation
- For detailed error handling guidance, see `references/validation.md` and `references/refinement.md`

### Dynamic Standards Lookup Phase (Step 0)

**Step 0: Retrieve Current Best Practices**

Before beginning the skill/workflow creation, perform research to retrieve current standards and best practices. This ensures your skill follows the most up-to-date guidelines.

For detailed guidance on Step 0, including mode selection criteria and research strategies, see `references/standards-lookup.md`.

### Planning Phase (Steps 1-5)
See `references/planning.md` for:
1. **Determine Skill vs Workflow** - Decide whether to create a Skill (automatic invocation) or Workflow (manual invocation)
2. **Define Purpose and Scope** - Clearly articulate what the skill/workflow should accomplish and its boundaries
3. **Identify Use Cases** - Map out specific scenarios where this skill/workflow will be used
4. **Gather Requirements** - Collect all necessary context, templates, scripts, and supporting materials
5. **Design Progressive Disclosure Structure** - Plan how to organize information across SKILL.md and supporting files

### Creation Phase (Steps 6-12)
See `references/creation.md` for:
6. **Create Skill/Workflow Directory** - Set up the proper directory structure
7. **Write YAML Frontmatter** - Create proper name and description following current standards retrieved in Step 0
8. **Draft Core Content** - Write the main SKILL.md or workflow markdown content
9. **Add Supporting Files** - Create reference documents, templates, scripts as needed
10. **Implement Progressive Disclosure** - Structure content to load only when needed
11. **Add Error Handling and Edge Cases** - Ensure robust execution
12. **Include Examples and Usage Instructions** - Make the skill/workflow easy to understand and use

### Validation Phase (Steps 13-17)
See `references/validation.md` for:
13. **Self-Review Against Standards** - Verify compliance with current standards retrieved in Step 0
14. **Test Execution Path** - Walk through the skill/workflow step by step
15. **Validate Progressive Disclosure** - Ensure information loads at appropriate levels
16. **Check for Ambiguities** - Identify and clarify unclear instructions
17. **Verify Completeness** - Ensure all necessary context is provided

### Refinement Phase (Steps 18-20)
See `references/refinement.md` for:
18. **Iterate Based on Review** - Make improvements identified during validation
19. **Add Documentation** - Create supporting documentation if needed
20. **Final Polish** - Ensure clarity, consistency, and professional quality

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

## Revision History

### v1.3.0 - 2025-06-05
- Moved Quick Start section to separate `references/quick-start.md` file to reduce SKILL.md length
- Added fallback mechanism for Step 0 if web access fails
- Added concrete full lifecycle example showing integration with skill-review
- Added note about time estimate assumptions for new users
- Added troubleshooting section for common workflow issues

### v1.2.0 - 2025-05-XX
- Initial comprehensive workflow structure
- Dynamic standards lookup phase
- Progressive disclosure implementation
- Comprehensive reference materials
