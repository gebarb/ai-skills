# Step 0: Dynamic Standards Lookup - Detailed Instructions

This document provides detailed instructions for Step 0 of the skill-review workflow. For the streamlined version, see the main SKILL.md.

## Overview

Step 0 performs comprehensive live research to retrieve the most current standards and best practices from all available external sources. This is a dynamic, adaptive process that discovers and applies standards from any relevant platform or source.

## Basic Mode (5 minutes, 2-3 searches)

For routine reviews or when time is constrained, use Basic Mode:

1. Execute 2-3 web searches for AI agent skill/workflow standards
2. Read and analyze https://agentskills.io/specification
3. Read and analyze https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md
4. Identify common patterns across sources (look for requirements appearing in 2+ sources)
5. Apply the most current standards found
6. **Stop when**: patterns emerge or after 5 minutes

**Basic Search Queries:**
- "AI agent skill development best practices"
- "AI workflow standards and guidelines"
- "Progressive disclosure AI agents"

## Advanced Mode (10-15 minutes, 3-5 searches)

For comprehensive reviews or when domain is rapidly evolving, use Advanced Mode:

### Direct Source Consultation
- Read and analyze https://agentskills.io/specification
- Read and analyze https://github.com/anthropics/skills/blob/main/skills/skill-creator/SKILL.md

### Broad Search Queries
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

### Dynamic Discovery Process
1. Execute 3-5 searches from authoritative sources to identify all relevant sources
2. Evaluate the recency and authority of each source found:
   - Check publication date: prefer sources from last 12 months
   - Check source type: prefer official documentation over blog posts
   - Check domain authority: prefer official spec repositories (agentskills.io, github.com/anthropics) over personal blogs
3. Identify common patterns and principles across sources (look for requirements that appear in 2+ sources)
4. Note platform-specific requirements when applicable (document which platform each requirement applies to)
5. Detect any conflicts or divergences between sources (list conflicting requirements with source citations)
6. Prioritize the most current and widely-adopted standards (prefer standards cited by multiple sources)
7. **Stop when**: patterns emerge across multiple sources, or after 10-15 minutes of research, or after consulting 3-5 authoritative sources
8. **Success criteria**: 3+ sources consulted, common patterns identified, conflicts documented if any

### Adaptive Application
- Apply the most current standards found, regardless of source
- If no current standards are found for a specific area, use general best practices
- If sources conflict, use the following conflict resolution process:
  1. Prioritize official specification documents over blog posts or articles
  2. Prioritize more recent sources (within last 12 months)
  3. If conflict persists between equally authoritative sources, document both standards and note the decision rationale in the report
  4. Create a "Standards Conflicts" section in the validation report to document any unresolved conflicts
- Continuously update understanding as new information is discovered

## Error Handling

**If web searches fail or return no results:**
- Proceed with general best practices and document the limitation in the validation report
- If specific sources are unavailable, skip them and continue with available sources
- Note which sources were inaccessible and how this may affect the review

**If encountering rate limits or API failures:**
- Wait and retry after a short delay (30-60 seconds)
- Use alternative sources if available
- Document the limitation and proceed with available information
- If persistent, skip the affected search and continue with other searches

## When to Skip or Simplify Step 0

**Skip Step 0 entirely** if:
- Reviewing a simple skill defined as: <100 lines AND well-understood domain AND no recent standards changes in that domain
- This is a follow-up review with recent standards lookup (within last 30 days)
- User specifies known standards to use
- Web access is unavailable (document limitation in report)

**Simplify Step 0** (use Basic Mode) if:
- Domain is stable with well-established standards (e.g., basic markdown formatting)
- Time constraints require faster review
- User requests focus on specific aspects only
- Previous review in same domain recently completed

## Standards Conflicts Template

If you encounter conflicting standards, document them in the validation report using this format:

```markdown
## Standards Conflicts

### Conflict 1: [Description of conflict]
- **Source A**: [Standard from source A]
- **Source B**: [Standard from source B]
- **Decision**: [Which standard was chosen and why]
- **Rationale**: [Explanation of the decision]
```

## Quick Review Mode Integration

When using Quick Review mode (1 iteration, 30 minutes total), use Basic Mode for Step 0 (5 minutes) to stay within time constraints.

When using Comprehensive Review mode (2-3 iterations), use Advanced Mode for Step 0 in the first iteration, and consider skipping or simplifying Step 0 in subsequent iterations if the domain is stable.

## Example Step 0 Output

**Example Basic Mode Output (5 minutes):**
- Consulted sources: agentskills.io specification, Anthropic skill-creator documentation
- Common patterns identified:
  - Description should include both what skill does AND when to use it
  - Progressive disclosure: keep SKILL.md under 500 lines
  - Name follows kebab-case convention
- Conflicts: None identified
- Applied standards: Used Anthropic's "pushy" description guidance over agentskills.io's more neutral approach (more recent source)

**Example Advanced Mode Output (15 minutes):**
- Consulted sources: agentskills.io specification, Anthropic skill-creator, Google ADK documentation, UiPath agent builder best practices
- Common patterns identified:
  - Description should include triggering contexts (appears in 3+ sources)
  - Progressive disclosure principles (appears in 4+ sources)
  - Imperative form in instructions (appears in 2+ sources)
- Conflicts:
  - Line limit: agentskills.io recommends <5000 tokens, Anthropic recommends <500 lines
  - Decision: Used Anthropic's <500 lines as more specific and actionable
- Applied standards: Synthesized from multiple sources with conflict resolution documented
