# Skill Builder - Dynamic Standards Lookup

This document provides detailed guidance for Step 0 of the skill-builder workflow.

## Step 0: Retrieve Current Best Practices

Before beginning the skill/workflow creation, perform research to retrieve current standards and best practices. This ensures your skill follows the most up-to-date guidelines.

**CRITICAL: Communicate research process to the user explicitly**
- Before starting research, tell the user which sources you plan to consult
- During research, announce each source you are reading and what you are looking for
- After reading each source, summarize the key standards/best practices found
- This transparency helps the user understand where standards come from and builds trust in the development process

## Choosing Your Mode

### Quick Mode (Recommended for most users)
**Use Quick Mode when:**
- Creating a skill/workflow in a common domain (web development, deployment, testing, etc.)
- The use case is straightforward and well-understood
- You're building on existing patterns rather than creating something novel
- Time is limited and you need to proceed quickly

**Steps:**
1. **Communicate to user**: "Starting Step 0: Dynamic Standards Lookup (Quick Mode). I will consult the following sources: agentskills.io specification and Anthropic skill-creator documentation."
2. **Communicate to user**: "Reading agentskills.io specification to understand current skill standards..."
3. Read and analyze https://agentskills.io/specification
4. **Communicate to user**: "Key findings from agentskills.io: [summarize 2-3 key standards]"
5. **Communicate to user**: "Reading Anthropic skill-creator documentation to understand their standards..."
6. Read and analyze https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md
7. **Communicate to user**: "Key findings from Anthropic: [summarize 2-3 key standards]"
8. Identify common patterns between the two sources
9. **Communicate to user**: "Common patterns identified: [list patterns]"
10. Document any conflicts and choose the more authoritative/recent source
11. Time: 5 minutes

### Advanced Mode (Optional)
**Use Advanced Mode when:**
- Creating a skill/workflow in a specialized or novel domain
- The use case is unique or experimental
- You're creating foundational skills that others will build upon
- You need comprehensive research across multiple sources
- You want to ensure the highest possible quality and compliance

**Steps:**
- **Communicate to user**: "Starting Step 0: Dynamic Standards Lookup (Advanced Mode). I will perform comprehensive research across multiple sources to identify the most current standards."
- For each source consulted, announce: "Consulting [source name] to research [specific topic]..."
- After each source, summarize: "Key findings from [source]: [2-3 key standards]"
- Perform broad web searches for "AI agent skill development best practices" and "AI workflow standards"
- Discover and evaluate standards from any available source
- Identify the most current and authoritative sources
- When identifying patterns, announce: "Identifying common patterns across sources..."
- When conflicts found, announce: "Found conflict between sources: [describe conflict]"
- Synthesize findings from multiple sources into a cohesive approach
- Final summary: "Standards lookup complete. Consulted [N] sources. Applied [X] standards from [most authoritative source]."
- Time: 10-15 minutes

## Stop Criteria

Stop your research when:
- Patterns emerge across multiple sources (requirements appearing in 2+ sources)
- Time limit reached (5 min for Quick Mode, 10-15 min for Advanced Mode)
- Sufficient standards identified to proceed (typically 3-5 key principles found)

## If Web Access Fails

If you cannot access external sources:
- Proceed with the framework in `references/guidelines.md` as a baseline
- Document the limitation in your skill/workflow
- Note that standards may not reflect the most current practices
- Consider updating the skill/workflow later when web access is available

## Handling Conflicting Standards

If sources conflict, document the conflict and choose based on:
- Recency of publication
- Platform adoption and usage
- Authority (official specifications > blog posts > forum discussions)
- Consensus across multiple sources

## Integration of Research Findings

- Document all relevant standards discovered
- Note the date and authority of each source
- Identify consensus principles across multiple sources
- Use findings to inform all subsequent steps
- Reference specific sources when documenting compliance decisions

## Why This Matters

- The AI field evolves rapidly; static references become outdated quickly
- New platforms and standards emerge regularly
- Current research ensures your skill remains relevant and compliant
