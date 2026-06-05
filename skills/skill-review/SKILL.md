---
name: skill-review
description: Comprehensive 3-perspective review of AI skills/workflows ensuring current standards compliance and execution success.
when_to_use: | - User mentions skill review, workflow validation, quality assurance, needs to validate a skill before deployment, wants to improve a skill/workflow, or asks for best practices review - ALWAYS use this skill when reviewing skills or workflows for quality assurance
argument-hint: Provide the skill or workflow file path to review, along with any specific concerns or areas of focus.
version: 1.0.0
compatibility: Requires ability to read markdown files, access to skill/workflow directory structure, and web access for Step 0 (optional but recommended)
---

# Skill Review Workflow

This workflow performs a comprehensive validation of AI skills or workflows using three distinct analytical perspectives (applied sequentially as conceptual subagents). Each perspective reviews the skill/workflow with fresh context to ensure it follows current best practices from all available sources, is structured for optimal execution, and identifies any bugs, issues, or gaps.

**Note:** The "subagents" mentioned in this workflow are conceptual perspectives applied sequentially by the main agent, not actual parallel processes. This approach ensures comprehensive coverage from different analytical viewpoints while maintaining fresh context for each review.

## Prerequisites

- A skill or workflow file to review (SKILL.md or workflow markdown file; this workflow assumes markdown format with YAML frontmatter. For other formats, adapt the approach accordingly)
- Supporting files and documentation for the skill/workflow (for skills with binary assets, focus review on text-based documentation and configuration files)
- Understanding of the intended use case and execution goals

## Platform Requirements

This workflow uses standard file reading and analysis. The following are required:
- Access to the repository root directory
- Ability to read markdown and supporting files
- Standard file system tools
- Web access for Step 0 (optional - can be skipped if unavailable)

## Time and Resource Estimates

**Typical duration for a complete review**:
- **Quick Review mode**: 30 minutes (1 iteration, Basic Step 0)
- **Comprehensive Review mode**: 90-180 minutes (2-3 iterations, Advanced Step 0)
  - Step 0 (Dynamic Standards Lookup): 5-15 minutes (Basic: 5 min, Advanced: 10-15 min)
  - Steps 1-3 (Initial Assessment): 5-10 minutes
  - Steps 4-6 (Multi-Perspective Review): 20-30 minutes
  - Steps 7-9 (Synthesis): 10-15 minutes
  - Steps 10-12 (User Interaction): Variable (user-dependent, typically 10-20 minutes)
  - Steps 13-14 (Finalization): 5-10 minutes

**Resource requirements**:
- No special hardware requirements
- Web access required for Step 0 (can be skipped if unavailable)
- Token usage: Moderate (varies by skill/workflow size)
- File system access: Read-only access to skill/workflow files

## Usage

Run this workflow from the root of your repository:

```
/skill-review
```

The workflow will prompt you to specify which skill/workflow to review.

**Recommended:** Run this workflow 2+ times after creating or modifying a skill/workflow to ensure thorough refinement. Each run provides fresh context and can identify different issues.

**Review Modes:**
- **Quick Review**: 1 iteration, 30 minutes, Basic Step 0 - for routine reviews, simple skills, or time-constrained situations
- **Comprehensive Review**: 2-3 iterations, 90-180 minutes, Advanced Step 0 - for major changes, critical skills, or when thorough quality assurance is needed

## How to Execute This Workflow

### Step-by-Step Execution

0. **Dynamic Standards Lookup Phase (Step 0)**
   - Perform comprehensive live research to retrieve the most current standards and best practices from all available external sources
   - This is a dynamic, adaptive process that discovers and applies standards from any relevant platform or source
   - Use the retrieved information to inform all subsequent review steps
   - Reference specific sources when documenting compliance decisions
   - **Error handling**: If web searches fail or return no results, proceed with general best practices and document the limitation. If specific sources are unavailable, skip them and continue with available sources.

   **For detailed instructions, see `references/step0.md`**

   **Quick Summary (Basic Mode - 5 minutes):**
   - Execute 2-3 web searches for AI agent skill/workflow standards
   - Read and analyze https://agentskills.io/specification
   - Read and analyze https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md
   - Identify common patterns across sources (requirements appearing in 2+ sources)
   - Apply the most current standards found
   - **Stop when**: patterns emerge or after 5 minutes

   **When to Skip Step 0:**
   - Skip entirely if: reviewing a simple skill (<100 lines AND well-understood domain AND no recent standards changes), follow-up review with recent lookup (within 30 days), user specifies known standards, or web access unavailable
   - Use Basic Mode if: time constraints, stable domain, or previous review in same domain recently completed

1. **Initial Assessment Phase (Steps 1-3)**
   - Read the skill/workflow file completely from start to finish (read the entire file, paying attention to structure, content, and organization; approach with fresh context as if encountering for the first time)
   - Read all supporting files referenced in the skill/workflow (verify file count matches references)
   - Document your initial observations using the template in `references/initial.md` (fill all template sections)
   - Identify the stated purpose, goals, and scope (typically 3+ sentences each; fewer if skill is simple)
   - Note any unclear sections or missing information (document all significant observations; typically 3+ for complex skills, fewer for simple or excellent skills)

---

**Transition to Multi-Perspective Review Phase**: After completing initial assessment, proceed to apply the three analytical perspectives.

2. **Multi-Perspective Review Phase (Steps 4-6)**
   - Apply each perspective sequentially with fresh context (approach the skill/workflow as if reviewing for the first time for each perspective; achieve fresh context by: taking a 5-minute break between perspectives, re-reading the file from start to end, not referring to previous notes, clearing mental context):
     - **Subagent 1 (Standards)**: Use the checklists in `references/perspectives.md` to verify compliance with current standards retrieved in Step 0 (check all applicable checklist items; typically 20+ for complex skills [>200 lines, multiple reference files, multiple domains], fewer for simple skills [<100 lines, single domain, well-understood])
     - **Subagent 2 (Execution)**: Walk through the skill/workflow execution mentally, identifying bottlenecks and ambiguities (document all findings; typically 3+ for complex skills, fewer for simple or excellent skills)
     - **Subagent 3 (Completeness)**: Check for missing requirements, context gaps, and goal achievement (document all findings; typically 3+ for complex skills, fewer for simple or excellent skills)
   - Document findings for each perspective independently (create 3 separate output sections)
   - Don't let findings from one perspective influence another (complete each perspective before starting the next)
   - **Note**: If you find fewer than 3 issues per perspective, this may indicate the skill is high quality - document this as a positive finding. If you find zero issues, document this as a positive finding but consider running the review again with fresh context to verify.

---

**Transition to Synthesis Phase**: After completing all three perspectives, proceed to aggregate and prioritize findings.

3. **Synthesis Phase (Steps 7-9)**
   - Aggregate all findings from the three perspectives (list all issues from each perspective)
   - Identify related issues and root causes (group at least 2 sets of related issues; if perspectives disagree, prioritize by severity [Critical > High > Medium > Low], then by impact on execution)
   - Prioritize issues by severity using the framework in `references/synthesis.md` (calculate priority scores for all issues)
   - Generate a comprehensive validation report using the templates provided (follow template with all sections filled)

---

**Transition to User Interaction Phase**: After generating the validation report, present it to the user for decision-making.

4. **User Interaction Phase (Steps 10-12)**
   - Present the validation report to the user with clear prioritization (include executive summary + detailed findings)
   - Gather user decisions on which recommendations to implement (document user decisions for each issue; if user rejects all recommendations, ask for specific concerns and consider adjusting the review approach or prioritization)
   - Implement approved changes to the skill/workflow (address all approved issues)
   - Document all changes made (create change log entry with date and iteration)

---

**Transition to Finalization Phase**: After implementing approved changes, proceed to re-review and verify.

5. **Finalization Phase (Steps 13-14)**
   - Re-review the modified skill/workflow with fresh context (re-read file from start to end)
   - Verify that changes address the identified issues (test each implemented fix and confirm resolved)
   - Check for regressions (new issues introduced by changes) (ensure no new issues found in re-review)
   - Generate a final summary of improvements and remaining recommendations (follow template with all sections filled)

---

**Transition to Initial Assessment Phase**: After completing Step 0, proceed to Steps 1-3 with the standards retrieved.

### Key Principles

- **Fresh Context**: Approach each perspective as if reviewing for the first time
- **Independence**: Each perspective should operate independently without cross-referencing
- **Depth**: Go beyond surface-level checks, provide specific examples and explanations
- **Balance**: Note strengths as well as weaknesses, provide constructive feedback

## Workflow Steps

The complete workflow is organized into review phases that simulate multiple analytical perspectives:

### Initial Assessment Phase (Steps 1-3)
See `references/initial.md` for:
1. **Load Skill/Workflow with Fresh Context** - Read the skill/workflow and supporting files as if encountering them for the first time
2. **Understand Intent and Goals** - Analyze the stated purpose and intended execution outcomes
3. **Identify Scope and Boundaries** - Determine what the skill/workflow should and should not do

**Success Criteria**:
- Skill/workflow file read completely (verified by reading from start to end)
- All supporting files located and read (verified by file count matching references)
- Intent and goals documented thoroughly (typically 3+ sentences each; fewer if skill is simple)
- Scope and boundaries identified (at least 5 items in each category)
- Initial assessment summary created (follows template format with all sections filled)

### Multi-Perspective Review Phase (Steps 4-6)
See `references/perspectives.md` for:

4. **Subagent 1**: Standards & Best Practices Review
   - Verify compliance with current standards retrieved in Step 0 from all available sources
   - Check adherence to platform-specific guidelines when applicable
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
- All three perspectives applied independently with fresh context (each perspective approaches the skill/workflow as if for the first time)
- Standards compliance verified with checklist (all applicable checklist items checked; typically 20+ for complex skills)
- Execution flow analyzed and documented (all findings documented; typically 3+ for complex skills)
- Completeness gaps identified and documented (all findings documented; typically 3+ for complex skills)
- Findings from each perspective documented separately (3 separate output sections)
- **Note**: If fewer findings are documented, this may indicate high quality - document this positively.

### Synthesis Phase (Steps 7-9)
See `references/synthesis.md` for:
7. **Aggregate Findings** - Compile issues and recommendations from all three perspectives
8. **Prioritize Issues** - Categorize findings by severity (critical, high, medium, low)
9. **Generate Review Report** - Create a comprehensive report with actionable recommendations

**Success Criteria**:
- All findings from three perspectives aggregated (all issues from each perspective listed)
- Related issues identified and correlated (at least 2 groups of related issues identified)
- Issues prioritized by severity using framework (priority scores calculated for all issues)
- Comprehensive validation report generated (follows template with all sections filled)
- Quick wins identified (at least 2 quick wins identified)

### User Interaction Phase (Steps 10-12)
See `references/interaction.md` for:
10. **Present Review Report** - Display findings with clear categorization and priorities
11. **Gather User Feedback** - Collect user decisions on which recommendations to implement
12. **Implement Approved Changes** - Apply the agreed-upon improvements to the skill/workflow

**Success Criteria**:
- Validation report presented with clear prioritization (executive summary + detailed findings)
- User feedback collected on recommendations (user decisions documented for each issue)
- Approved changes implemented (all approved issues addressed)
- Changes documented in change log (change log entry created with date and iteration)
- User confirms satisfaction with changes (explicit confirmation received)
- **Note**: If success criteria cannot be met due to skill/workflow characteristics or constraints, document the reason and proceed with the review.

### Finalization Phase (Steps 13-14)
See `references/finalization.md` for:
13. **Re-review Modified Skill/Workflow** - Validate that changes address the identified issues
14. **Generate Final Summary** - Provide a summary of improvements made and remaining recommendations

**Success Criteria**:
- Modified skill/workflow re-reviewed with fresh context (file re-read from start to end)
- Issue resolution verified (each implemented fix tested and confirmed resolved)
- No regressions introduced (no new issues found in re-review)
- Final summary generated (follows template with all sections filled)
- Readiness assessment provided (explicit readiness rating: Ready/Ready with Caveats/Needs More Work/Not Ready)

## Troubleshooting

See `references/troubleshooting.md` for comprehensive troubleshooting guidance including:
- Reference files not found
- Skill/workflow file won't load
- Review seems incomplete
- No issues found
- User rejects all recommendations
- Edge cases (self-review, missing files, unavailable sources)

## Reference Materials

For detailed review criteria, templates, and guidelines, see:
- **Dynamic Standards Lookup**: `references/step0.md` - Detailed Step 0 instructions (Basic and Advanced modes)
- **Initial Assessment**: `references/initial.md` - Steps 1-3
- **Multi-Perspective Review**: `references/perspectives.md` - Steps 4-6
- **Synthesis**: `references/synthesis.md` - Steps 7-9
- **User Interaction**: `references/interaction.md` - Steps 10-12
- **Finalization**: `references/finalization.md` - Steps 13-14
- **Templates**: `references/templates.md` - Review report templates (includes Standards Conflicts template)
- **Guidelines**: `references/guidelines.md` - Review criteria framework (use with Step 0 findings)
- **Examples**: `references/examples.md` - Sample validation reports and outputs
- **Troubleshooting**: `references/troubleshooting.md` - Common issues and edge cases

## Integration in Development Lifecycle

This workflow is designed to run after skill/workflow creation and before deployment:

1. `/skill-builder` - Create a new skill or workflow following best practices
2. `/skill-review` - Review and refine the skill/workflow (run 2+ times for optimal results)
3. Install and test the skill/workflow in your environment

Running this workflow multiple times ensures that each review provides fresh context, allowing different issues to surface and enabling iterative refinement. The three-perspective approach ensures comprehensive coverage of standards compliance, execution viability, and completeness.

**Review Mode Selection:**
- Use **Quick Review mode** for routine reviews, simple skills, or time-constrained situations
- Use **Comprehensive Review mode** for major changes, critical skills, or when thorough quality assurance is needed

## Review Iteration Strategy

**First Run:** Focus on major structural issues, standards compliance, and obvious gaps
**Second Run:** Focus on execution flow, clarity, and edge cases
**Additional Runs (if needed):** Focus on optimization, polish, and subtle improvements

**Quick Review mode:** Single iteration focusing on critical issues
**Comprehensive Review mode:** 2-3 iterations with the focus areas above

Each iteration should build on the previous one, with the skill/workflow improving in quality with each review cycle.
