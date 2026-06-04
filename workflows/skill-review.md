---
name: skill-review
description: Comprehensive 3-perspective review of AI skills/workflows ensuring current standards compliance and execution success
---

# Skill Review Workflow

This workflow performs a comprehensive validation of AI skills or workflows using three distinct analytical perspectives (applied sequentially as conceptual subagents). Each perspective reviews the skill/workflow with fresh context to ensure it follows current best practices from all available sources, is structured for optimal execution, and identifies any bugs, issues, or gaps.

**Note:** The "subagents" mentioned in this workflow are conceptual perspectives applied sequentially by the main agent, not actual parallel processes. This approach ensures comprehensive coverage from different analytical viewpoints while maintaining fresh context for each review.

## Prerequisites

- A skill or workflow file to review (SKILL.md or workflow markdown file)
- Supporting files and documentation for the skill/workflow
- Understanding of the intended use case and execution goals
- **Important**: Understanding of the `{{DOCS_DIR}}` placeholder pattern for path resolution (see guidelines below)

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

## How to Execute This Workflow

### Step-by-Step Execution

0. **Dynamic Standards Lookup Phase (Step 0)**
   - Perform comprehensive live research to retrieve the most current standards and best practices from all available external sources
   - This is a dynamic, adaptive process that discovers and applies standards from any relevant platform or source
   - Execute broad web searches for AI agent skill and workflow standards across all platforms
   - Discover and evaluate standards from any available source (not limited to specific platforms)
   - Identify the most current and authoritative sources
   - Synthesize findings from multiple sources into a cohesive approach
   - Use the retrieved information to inform all subsequent review steps
   - Reference specific sources when documenting compliance decisions

   **Comprehensive Search Queries:**
   ```
   - "AI agent skill development best practices 2025"
   - "AI workflow standards and guidelines"
   - "AI assistant skill creation standards"
   - "Progressive disclosure AI agents"
   - "AI skill documentation standards"
   - "Agent skill development framework"
   - "AI workflow best practices"
   - "Claude Anthropic skills guidelines"
   - "Windsurf AI skills standards"
   - "Devin AI workflow standards"
   - "Microsoft Copilot skills best practices"
   - "AI agent context management"
   - "AI skill execution patterns"
   - "agentskills.io specification"
   ```

   **Dynamic Discovery Process:**
   1. Execute broad searches to identify all relevant sources
   2. Evaluate the recency and authority of each source found
   3. Identify common patterns and principles across sources
   4. Note platform-specific requirements when applicable
   5. Detect any conflicts or divergences between sources
   6. Prioritize the most current and widely-adopted standards

   **Adaptive Application:**
   - Apply the most current standards found, regardless of source
   - If no current standards are found for a specific area, use general best practices
   - If sources conflict, document the conflict and choose the most authoritative or recent
   - Continuously update understanding as new information is discovered

1. **Initial Assessment Phase (Steps 1-3)**
   - Read the skill/workflow file completely from start to finish
   - Read all supporting files referenced in the skill/workflow
   - Document your initial observations using the template in `docs/skills-references/skill-review-initial.md`
   - Identify the stated purpose, goals, and scope
   - Note any unclear sections or missing information

2. **Multi-Perspective Review Phase (Steps 4-6)**
   - Apply each perspective sequentially with fresh context:
     - **Subagent 1 (Standards)**: Use the checklists in `docs/skills-references/skill-review-perspectives.md` to verify compliance with current standards retrieved in Step 0
     - **Subagent 2 (Execution)**: Walk through the skill/workflow execution mentally, identifying bottlenecks and ambiguities
     - **Subagent 3 (Completeness)**: Check for missing requirements, context gaps, and goal achievement
   - Document findings for each perspective independently
   - Don't let findings from one perspective influence another

3. **Synthesis Phase (Steps 7-9)**
   - Aggregate all findings from the three perspectives
   - Identify related issues and root causes
   - Prioritize issues by severity using the framework in `docs/skills-references/skill-review-synthesis.md`
   - Generate a comprehensive validation report using the templates provided

4. **User Interaction Phase (Steps 10-12)**
   - Present the validation report to the user with clear prioritization
   - Gather user decisions on which recommendations to implement
   - Implement approved changes to the skill/workflow
   - Document all changes made

5. **Finalization Phase (Steps 13-14)**
   - Re-review the modified skill/workflow with fresh context
   - Verify that changes address the identified issues
   - Check for regressions (new issues introduced by changes)
   - Generate a final summary of improvements and remaining recommendations

### Key Principles

- **Fresh Context**: Approach each perspective as if reviewing for the first time
- **Independence**: Each perspective should operate independently without cross-referencing
- **Depth**: Go beyond surface-level checks, provide specific examples and explanations
- **Balance**: Note strengths as well as weaknesses, provide constructive feedback

## Workflow Steps

The complete workflow is organized into review phases that simulate multiple analytical perspectives:

### Initial Assessment Phase (Steps 1-3)
See `{{DOCS_DIR}}/skill-review/initial.md` for:
1. **Load Skill/Workflow with Fresh Context** - Read the skill/workflow and supporting files as if encountering them for the first time
2. **Understand Intent and Goals** - Analyze the stated purpose and intended execution outcomes
3. **Identify Scope and Boundaries** - Determine what the skill/workflow should and should not do

**Success Criteria**:
- Skill/workflow file read completely
- All supporting files located and read
- Intent and goals documented
- Scope and boundaries identified
- Initial assessment summary created

### Multi-Perspective Review Phase (Steps 4-6)
See `{{DOCS_DIR}}/skill-review/perspectives.md` for:

4. **Subagent 1**: Standards & Best Practices Review
   - Verify compliance with current standards retrieved in Step 0 from all available sources
   - Check adherence to platform-specific guidelines when applicable (Windsurf, Anthropic/Claude, Devin, Microsoft/CoPilot, etc.)
   - Validate YAML frontmatter structure and content
   - Assess progressive disclosure implementation
   - Review naming conventions and descriptions
   - Apply the most current standards found, regardless of source

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

**Success Criteria**:
- All three perspectives applied independently with fresh context
- Standards compliance verified with checklist
- Execution flow analyzed and documented
- Completeness gaps identified and documented
- Findings from each perspective documented separately

### Synthesis Phase (Steps 7-9)
See `{{DOCS_DIR}}/skill-review/synthesis.md` for:
7. **Aggregate Findings** - Compile issues and recommendations from all three perspectives
8. **Prioritize Issues** - Categorize findings by severity (critical, high, medium, low)
9. **Generate Review Report** - Create a comprehensive report with actionable recommendations

**Success Criteria**:
- All findings from three perspectives aggregated
- Related issues identified and correlated
- Issues prioritized by severity using framework
- Comprehensive validation report generated
- Quick wins identified

### User Interaction Phase (Steps 10-12)
See `{{DOCS_DIR}}/skill-review/interaction.md` for:
10. **Present Review Report** - Display findings with clear categorization and priorities
11. **Gather User Feedback** - Collect user decisions on which recommendations to implement
12. **Implement Approved Changes** - Apply the agreed-upon improvements to the skill/workflow

**Success Criteria**:
- Validation report presented with clear prioritization
- User feedback collected on recommendations
- Approved changes implemented
- Changes documented in change log
- User confirms satisfaction with changes

### Finalization Phase (Steps 13-14)
See `{{DOCS_DIR}}/skill-review/finalization.md` for:
13. **Re-review Modified Skill/Workflow** - Validate that changes address the identified issues
14. **Generate Final Summary** - Provide a summary of improvements made and remaining recommendations

**Success Criteria**:
- Modified skill/workflow re-reviewed with fresh context
- Issue resolution verified
- No regressions introduced
- Final summary generated
- Readiness assessment provided

## Troubleshooting

### Reference Files Not Found
If reference files are not at the expected location:
- Check if they exist in `docs/skills-references/` relative to the repository root
- Verify you're running the workflow from the repository root directory
- Adjust paths based on your workspace structure if needed
- Contact workflow maintainer if files are missing

### Skill/Workflow File Won't Load
If the skill/workflow file cannot be read:
- Verify the file exists and has correct permissions (644 for files)
- Check if the file is valid markdown format
- Ensure YAML frontmatter is properly formatted (starts and ends with `---`)
- Verify the file is not corrupted or truncated

### Review Seems Incomplete
If the review feels incomplete or rushed:
- Ensure you're applying each perspective with fresh context
- Don't skip steps or phases - follow the workflow sequentially
- Use the checklists in the reference materials systematically
- Take time to document specific evidence for each issue

### No Issues Found
If you find no issues during review:
- Consider running the workflow again with fresh context (recommended 3+ times)
- Check if you're being too lenient - review the severity guidelines
- Verify you're using all three perspectives independently
- Consider if the skill/workflow is truly perfect or if you missed something

### User Rejects All Recommendations
If the user rejects all recommendations:
- Present issues with more specific evidence and examples
- Explain the impact and severity more clearly
- Offer to implement quick wins first to build trust
- Respect user decisions but document the rationale

## Reference Materials

For detailed review criteria, templates, and guidelines, see:
- **Dynamic Standards Lookup**: Step 0 - Live research of current external standards from all available sources
- **Initial Assessment**: `{{DOCS_DIR}}/skill-review/initial.md` - Steps 1-3
- **Multi-Perspective Review**: `{{DOCS_DIR}}/skill-review/perspectives.md` - Steps 4-6
- **Synthesis**: `{{DOCS_DIR}}/skill-review/synthesis.md` - Steps 7-9
- **User Interaction**: `{{DOCS_DIR}}/skill-review/interaction.md` - Steps 10-12
- **Finalization**: `{{DOCS_DIR}}/skill-review/finalization.md` - Steps 13-14
- **Templates**: `{{DOCS_DIR}}/skill-review/templates.md` - Review report templates
- **Guidelines**: `{{DOCS_DIR}}/skill-review/guidelines.md` - Review criteria framework (use with Step 0 findings)

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
