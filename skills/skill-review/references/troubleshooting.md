# Skill Review - Troubleshooting

This document provides troubleshooting guidance for common issues encountered during the skill-review workflow.

## Reference Files Not Found

If reference files are not at the expected location:
- Check if they exist in `references/` relative to the skill directory
- Verify you're running the workflow from the repository root directory
- Adjust paths based on your workspace structure if needed
- Contact workflow maintainer if files are missing

## Skill/Workflow File Won't Load

If the skill/workflow file cannot be read:
- Verify the file exists and has correct permissions (644 for files)
- Check if the file is valid markdown format
- Ensure YAML frontmatter is properly formatted (starts and ends with `---`)
- Verify the file is not corrupted or truncated

## Review Seems Incomplete

If the review feels incomplete or rushed:
- Ensure you're applying each perspective with fresh context
- Don't skip steps or phases - follow the workflow sequentially
- Use the checklists in the reference materials systematically
- Take time to document specific evidence for each issue

## No Issues Found

If you find no issues during review:
- Consider running the workflow again with fresh context (recommended 3+ times)
- Check if you're being too lenient - review the severity guidelines
- Verify you're using all three perspectives independently
- Consider if the skill/workflow is truly perfect or if you missed something

## User Rejects All Recommendations

If the user rejects all recommendations:
- Present issues with more specific evidence and examples
- Explain the impact and severity more clearly
- Offer to implement quick wins first to build trust
- Respect user decisions but document the rationale

## Edge Cases

### Self-Review (Reviewing skill-review itself)

When reviewing the skill-review workflow itself:
- Be aware of recursive complexity - the workflow is reviewing its own structure
- Focus on whether the workflow follows its own guidelines
- Consider whether the workflow is too complex for its intended purpose
- Document any meta-issues (e.g., "workflow recommends 3+ reviews but this is resource-intensive")
- The self-review is a valid use case but requires careful consideration of bias

**Mitigation strategies for self-review bias:**
- Have another person review the workflow if possible
- Use a checklist to reduce bias and ensure systematic review
- Document meta-issues explicitly (e.g., "this issue may be biased because...")
- Consider running the review multiple times with different approaches
- Be extra critical of findings that validate the workflow's own approach

### Missing Files

If referenced files don't exist:
- Document the missing file as a gap in the skill/workflow
- Continue the review with available files
- Note in the report which files were missing and how this affected the review
- If critical files are missing (e.g., main SKILL.md), this is a critical issue

### Unavailable Sources (Step 0)

If web access fails or sources are unavailable during Step 0:
- Document the limitation in the validation report
- Use any cached or known standards from previous research
- Proceed with the review using general best practices
- Note in the report which sources were inaccessible and how this may affect the review
- If no external sources are available, rely on the reference materials in the skill itself

### Rate Limits or API Failures

If encountering rate limits or API failures during Step 0:
- Wait and retry after a short delay (30-60 seconds)
- Use alternative sources if available
- Document the limitation and proceed with available information
- If persistent, skip the affected search and continue with other searches

### Conflicting Standards

If sources provide conflicting standards:
- Use the conflict resolution process from Step 0:
  1. Prioritize official specification documents over blog posts or articles
  2. Prioritize more recent sources (within last 12 months)
  3. If conflict persists between equally authoritative sources, document both standards and note the decision rationale
  4. Create a "Standards Conflicts" section in the validation report
- Document the conflict clearly in the report
- Explain which standard was chosen and why

### Very Large Skills/Workflows

If reviewing a skill/workflow with many files or very long content:
- Prioritize reviewing the main SKILL.md or workflow file first
- Sample supporting files rather than reading all (e.g., read 3-5 representative files)
- Document which files were reviewed and which were sampled
- Note in the report if the review was partial due to size
- Consider recommending the skill/workflow be split for better progressive disclosure

### User Time Constraints

If the user has limited time for the review:
- Focus on critical and high-priority issues only
- Skip Step 0 if standards are well-known or recent review completed
- Reduce the number of perspective iterations (e.g., run once instead of 3+ times)
- Document the time constraint in the report
- Note which aspects were abbreviated due to time constraints

### Multiple Skills/Workflows

If asked to review multiple skills/workflows:
- Review each independently with fresh context
- Look for patterns across multiple reviews
- Document common issues found across multiple skills/workflows
- Consider creating a summary report of findings across all reviews
- Prioritize skills/workflows that are most critical or frequently used
