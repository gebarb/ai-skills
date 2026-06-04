---
name: skill-review
description: Perform comprehensive 3-perspective review of AI skills/workflows with fresh context to ensure standards compliance and optimize execution success
---

# Skill Review Workflow

This workflow performs a comprehensive validation of AI skills or workflows using three distinct analytical perspectives (applied sequentially as conceptual subagents). Each perspective reviews the skill/workflow with fresh context to ensure it follows Windsurf and Anthropic best practices, is structured for optimal execution, and identifies any bugs, issues, or gaps.

**Note:** The "subagents" mentioned in this workflow are conceptual perspectives applied sequentially by the main agent, not actual parallel processes. This approach ensures comprehensive coverage from different analytical viewpoints while maintaining fresh context for each review.

## Prerequisites

- A skill or workflow file to review (SKILL.md or workflow markdown file)
- Supporting files and documentation for the skill/workflow
- Understanding of the intended use case and execution goals

## Platform Requirements

This workflow uses standard file reading and analysis. The following are required:
- Access to the repository root directory
- Ability to read markdown and supporting files
- Standard file system tools

## Usage

Run this workflow from the root of your repository:

```
/skill-review
```

The workflow will prompt you to specify which skill/workflow to review.

**Recommended:** Run this workflow 3+ times after creating or modifying a skill/workflow to ensure thorough refinement. Each run provides fresh context and can identify different issues.

## Workflow Steps

The complete workflow is organized into review phases that simulate multiple analytical perspectives:

### Initial Assessment Phase (Steps 1-3)
See `~/.codeium/windsurf/docs/skills-references/skill-review-initial.md` for:
1. **Load Skill/Workflow with Fresh Context** - Read the skill/workflow and supporting files as if encountering them for the first time
2. **Understand Intent and Goals** - Analyze the stated purpose and intended execution outcomes
3. **Identify Scope and Boundaries** - Determine what the skill/workflow should and should not do

### Multi-Perspective Review Phase (Steps 4-6)
See `~/.codeium/windsurf/docs/skills-references/skill-review-perspectives.md` for:

4. **Subagent 1**: Standards & Best Practices Review
   - Verify compliance with Windsurf skill/workflow specifications
   - Check adherence to Anthropic agent skill guidelines
   - Validate YAML frontmatter structure and content
   - Assess progressive disclosure implementation
   - Review naming conventions and descriptions

5. **Subagent 2**: Execution & Structure Review
   - Analyze step-by-step execution flow
   - Identify potential execution bottlenecks or failures
   - Evaluate clarity and unambiguity of instructions
   - Check for missing or incomplete steps
   - Assess error handling and edge case coverage

6. **Subagent 3**: Completeness & Gaps Review
   - Verify all requirements are addressed
   - Identify missing context or supporting materials
   - Check for ambiguous specifications
   - Validate success criteria and acceptance criteria
   - Assess whether the skill/workflow achieves its stated goals

### Synthesis Phase (Steps 7-9)
See `~/.codeium/windsurf/docs/skills-references/skill-review-synthesis.md` for:
7. **Aggregate Findings** - Compile issues and recommendations from all three perspectives
8. **Prioritize Issues** - Categorize findings by severity (critical, high, medium, low)
9. **Generate Review Report** - Create a comprehensive report with actionable recommendations

### User Interaction Phase (Steps 10-12)
See `~/.codeium/windsurf/docs/skills-references/skill-review-interaction.md` for:
10. **Present Review Report** - Display findings with clear categorization and priorities
11. **Gather User Feedback** - Collect user decisions on which recommendations to implement
12. **Implement Approved Changes** - Apply the agreed-upon improvements to the skill/workflow

### Finalization Phase (Steps 13-14)
See `~/.codeium/windsurf/docs/skills-references/skill-review-finalization.md` for:
13. **Re-review Modified Skill/Workflow** - Validate that changes address the identified issues
14. **Generate Final Summary** - Provide a summary of improvements made and remaining recommendations

## Reference Materials

For detailed review criteria, templates, and guidelines, see:
- **Initial Assessment**: `~/.codeium/windsurf/docs/skills-references/skill-review-initial.md` - Steps 1-3
- **Multi-Perspective Review**: `~/.codeium/windsurf/docs/skills-references/skill-review-perspectives.md` - Steps 4-6
- **Synthesis**: `~/.codeium/windsurf/docs/skills-references/skill-review-synthesis.md` - Steps 7-9
- **User Interaction**: `~/.codeium/windsurf/docs/skills-references/skill-review-interaction.md` - Steps 10-12
- **Finalization**: `~/.codeium/windsurf/docs/skills-references/skill-review-finalization.md` - Steps 13-14
- **Templates**: `~/.codeium/windsurf/docs/skills-references/skill-review-templates.md` - Review report templates
- **Guidelines**: `~/.codeium/windsurf/docs/skills-references/skill-review-guidelines.md` - Review criteria and best practices

## Integration in Development Lifecycle

This workflow is designed to run after skill/workflow creation and before deployment:

1. `/skill-builder` - Create a new skill or workflow following best practices
2. `/skill-review` - Review and refine the skill/workflow (run 3+ times for optimal results)
3. Install and test the skill/workflow in your environment

Running this workflow multiple times ensures that each review provides fresh context, allowing different issues to surface and enabling iterative refinement. The three-perspective approach ensures comprehensive coverage of standards compliance, execution viability, and completeness.

## Review Iteration Strategy

**First Run:** Focus on major structural issues, standards compliance, and obvious gaps
**Second Run:** Focus on execution flow, clarity, and edge cases
**Third+ Runs:** Focus on optimization, polish, and subtle improvements

Each iteration should build on the previous one, with the skill/workflow improving in quality with each review cycle.
