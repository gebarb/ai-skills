---
name: skill-builder
description: Walk through creating a highly performant and accurate AI skill/workflow that follows Windsurf and Anthropic best practices and standards
---

# Skill Builder Workflow

This workflow guides you through creating a highly performant and accurate AI skill or workflow for Cascade/Windsurf. It follows Windsurf and Anthropic's best practices and standards to ensure accurate and complete execution.

## Prerequisites

- Clear understanding of the task or process you want to automate
- Basic familiarity with Cascade/Windsurf skills and workflows
- Understanding of the difference between Skills (automatic invocation) and Workflows (manual invocation)

## Platform Requirements

This workflow uses standard file operations and markdown editing. The following are required:
- Access to the repository root directory
- Ability to create and edit markdown files
- Standard file system tools

## Usage

Run this workflow from the root of your repository:

```
/skill-builder
```

## Workflow Steps

The complete workflow is organized into phases to ensure comprehensive skill/workflow creation:

### Planning Phase (Steps 1-5)
See `~/.codeium/windsurf/docs/skills-references/skill-builder-planning.md` for:
1. **Determine Skill vs Workflow** - Decide whether to create a Skill (automatic invocation) or Workflow (manual invocation)
2. **Define Purpose and Scope** - Clearly articulate what the skill/workflow should accomplish and its boundaries
3. **Identify Use Cases** - Map out specific scenarios where this skill/workflow will be used
4. **Gather Requirements** - Collect all necessary context, templates, scripts, and supporting materials
5. **Design Progressive Disclosure Structure** - Plan how to organize information across SKILL.md and supporting files

### Creation Phase (Steps 6-12)
See `~/.codeium/windsurf/docs/skills-references/skill-builder-creation.md` for:
6. **Create Skill/Workflow Directory** - Set up the proper directory structure
7. **Write YAML Frontmatter** - Create proper name and description following Windsurf standards
8. **Draft Core Content** - Write the main SKILL.md or workflow markdown content
9. **Add Supporting Files** - Create reference documents, templates, scripts as needed
10. **Implement Progressive Disclosure** - Structure content to load only when needed
11. **Add Error Handling and Edge Cases** - Ensure robust execution
12. **Include Examples and Usage Instructions** - Make the skill/workflow easy to understand and use

### Validation Phase (Steps 13-17)
See `~/.codeium/windsurf/docs/skills-references/skill-builder-validation.md` for:
13. **Self-Review Against Standards** - Verify compliance with Windsurf and Anthropic best practices
14. **Test Execution Path** - Walk through the skill/workflow step by step
15. **Validate Progressive Disclosure** - Ensure information loads at appropriate levels
16. **Check for Ambiguities** - Identify and clarify unclear instructions
17. **Verify Completeness** - Ensure all necessary context is provided

### Refinement Phase (Steps 18-20)
See `~/.codeium/windsurf/docs/skills-references/skill-builder-refinement.md` for:
18. **Iterate Based on Review** - Make improvements identified during validation
19. **Add Documentation** - Create supporting documentation if needed
20. **Final Polish** - Ensure clarity, consistency, and professional quality

## Reference Materials

For detailed templates, guidelines, and best practices, see:
- **Planning Phase**: `~/.codeium/windsurf/docs/skills-references/skill-builder-planning.md` - Steps 1-5
- **Creation Phase**: `~/.codeium/windsurf/docs/skills-references/skill-builder-creation.md` - Steps 6-12
- **Validation Phase**: `~/.codeium/windsurf/docs/skills-references/skill-builder-validation.md` - Steps 13-17
- **Refinement Phase**: `~/.codeium/windsurf/docs/skills-references/skill-builder-refinement.md` - Steps 18-20
- **Templates**: `~/.codeium/windsurf/docs/skills-references/skill-builder-templates.md` - SKILL.md and workflow templates
- **Guidelines**: `~/.codeium/windsurf/docs/skills-references/skill-builder-guidelines.md` - Windsurf and Anthropic standards

## Integration in Development Lifecycle

This workflow is designed to be used when creating new skills or workflows:

1. `/skill-builder` - Create a new skill or workflow following best practices
2. `/skill-review` - Review and refine the created skill/workflow (run 3+ times for optimal results)
3. Install and test the skill/workflow in your environment

This ensures that skills and workflows are built to high standards from the start, reducing the need for extensive rework later.
