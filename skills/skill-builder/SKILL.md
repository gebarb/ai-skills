---
name: skill-builder
description: Walk through creating a highly performant and accurate AI skill/workflow that follows current best practices and standards from all available sources
---

# Skill Builder Workflow

This workflow guides you through creating a highly performant and accurate AI skill or workflow. It performs live research to retrieve and apply the most current best practices and standards from all available external sources, ensuring accurate and complete execution based on the latest industry standards.

## Prerequisites

- Clear understanding of the task or process you want to automate
- Basic familiarity with AI agent skills and workflows
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

### Dynamic Standards Lookup Phase (Step 0)

**Step 0: Retrieve Current Best Practices**

Before beginning the skill/workflow creation, perform comprehensive live research to retrieve the most current standards and best practices from all available external sources. This is a dynamic, adaptive process that discovers and applies standards from any relevant platform or source.

**Research Strategy:**
- Perform broad web searches for AI agent skill and workflow standards
- Discover and evaluate standards from any available source
- Identify the most current and authoritative sources
- Adapt to whatever standards are found and applicable
- Synthesize findings from multiple sources into a cohesive approach
- Directly consult known specification documents

**Direct Source Consultation:**
- Read and analyze https://agentskills.io/specification
- Read and analyze https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md

**Broad Search Queries:**
```
- "AI agent skill development best practices"
- "AI workflow standards and guidelines"
- "AI assistant skill creation standards"
- "Progressive disclosure AI agents"
- "AI skill documentation standards"
- "Agent skill development framework"
- "AI workflow best practices"
- "AI agent context management"
- "AI skill execution patterns"
```

**Dynamic Discovery Process:**
1. Execute broad searches to identify all relevant sources
2. Evaluate the recency and authority of each source found
3. Identify common patterns and principles across sources
4. Note platform-specific requirements when applicable
5. Detect any conflicts or divergences between sources
6. Prioritize the most current and widely-adopted standards

**Integration of Research Findings:**
- Document all relevant standards discovered from any source
- Note the date and authority of each source
- Identify consensus principles across multiple sources
- Document platform-specific requirements when relevant
- Use the synthesized findings to inform all subsequent steps
- Reference specific sources when documenting compliance decisions
- Adapt the approach based on what standards are actually available

**Adaptive Application:**
- Apply the most current standards found, regardless of source
- If no current standards are found for a specific area, use general best practices
- If sources conflict, document the conflict and choose the most authoritative or recent
- Continuously update understanding as new information is discovered
- Be prepared to adapt if standards change during the workflow execution

**Why This Matters:**
- The AI field evolves rapidly; static references become outdated quickly
- New platforms and standards emerge regularly
- Different platforms may have different but equally valid approaches
- Comprehensive research ensures no relevant standards are missed
- Dynamic adaptation ensures the workflow remains current and applicable
- Generic approach allows the workflow to work with any available standards

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

## Reference Materials

For detailed templates, guidelines, and best practices, see:
- **Dynamic Standards Lookup**: Step 0 - Live research of current external standards
- **Planning Phase**: `references/planning.md` - Steps 1-5
- **Creation Phase**: `references/creation.md` - Steps 6-12
- **Validation Phase**: `references/validation.md` - Steps 13-17
- **Refinement Phase**: `references/refinement.md` - Steps 18-20
- **Templates**: `references/templates.md` - SKILL.md and workflow templates
- **Guidelines**: `references/guidelines.md` - Standards framework (use with Step 0 findings)

## Integration in Development Lifecycle

This workflow is designed to be used when creating new skills or workflows:

1. `/skill-builder` - Create a new skill or workflow following best practices
2. `/skill-review` - Review and refine the created skill/workflow (run 3+ times for optimal results)
3. Install and test the skill/workflow in your environment

This ensures that skills and workflows are built to high standards from the start, reducing the need for extensive rework later.
