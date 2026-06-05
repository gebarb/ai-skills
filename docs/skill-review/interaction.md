# Skill Review - User Interaction Phase

This document provides detailed guidance for Steps 10-12 of the skill-review workflow.

## Step 10: Present Validation Report to User

### Report Presentation Strategy

Present the report in a way that is:
- **Clear**: Easy to understand at a glance
- **Actionable**: User knows what to do next
- **Prioritized**: Most important issues first
- **Constructive**: Balanced with strengths
- **Professional**: Appropriate tone and format

### Presentation Structure

```markdown
# Validation Report for [Skill/Workflow Name]

## Executive Summary

**Overall Assessment**: [Ready / Needs Work / Not Ready]
**Critical Issues**: [N]
**High Priority Issues**: [N]
**Medium Priority Issues**: [N]
**Low Priority Issues**: [N]

**Recommendation**: [Brief recommendation]

---

## Critical Issues (Must Fix)

[Present critical issues with clear descriptions and recommended fixes]

---

## High Priority Issues (Should Fix)

[Present high priority issues with clear descriptions and recommended fixes]

---

## Quick Wins (Easy Fixes with High Impact)

[Present quick wins to encourage immediate action]

---

## Strengths

[Highlight what works well to maintain motivation]

---

## Full Report

[Link to or include full detailed report]
```

### Issue Presentation Format

For each issue, present:

```markdown
### [Issue Title]

**Severity**: Critical/High/Medium/Low
**Found By**: Standards/Execution/Completeness Review
**Location**: [Where in the skill/workflow]

**Problem**: [Clear description of the problem]

**Impact**: [What this affects and why it matters]

**Recommended Fix**: [Specific, actionable fix]

**Example**: [Before/after example if applicable]
```

### Prioritized Presentation

Present issues in priority order:
1. Critical issues first
2. High priority issues second
3. Quick wins third (to encourage action)
4. Medium priority issues fourth
5. Low priority issues last

### Balanced Presentation

Balance issues with strengths:
- Start with overall assessment
- Present critical issues
- Present high priority issues
- Present quick wins
- Present strengths
- Present remaining issues
- End with positive next steps

### Interactive Elements

Include interactive elements:
- Ask user which issues to address
- Offer to implement fixes
- Suggest prioritization approach
- Offer to explain any issue in detail

## Step 11: Gather User Feedback and Decisions

### Feedback Collection

Collect user decisions on:
- Which issues to fix
- Priority order for fixes
- Approach to implementation
- Whether to delegate implementation

### Decision Framework

Help user make decisions by:
- Explaining impact of each issue
- Providing effort estimates
- Suggesting priority order
- Offering implementation options

### Decision Options

For each issue, offer options:

```markdown
### [Issue Title]

**Options**:
1. **Fix now** - [I can implement this fix immediately]
2. **Fix later** - [Add to backlog for future iteration]
3. **Skip** - [Accept this issue as-is]
4. **Defer decision** - [Decide after reviewing other issues]

**My recommendation**: [What I recommend and why]
```

### Prioritization Discussion

Discuss prioritization with user:
- What are user's priorities?
- What are time constraints?
- What are quality requirements?
- What are resource constraints?

### Implementation Approach

Discuss implementation approach:
- Fix all critical issues now?
- Fix critical + high priority now?
- Fix quick wins now?
- Iterative approach?

### Feedback Documentation

Document user decisions:
```
User Decision Log:
- Issue S-001: Fix now
- Issue E-003: Fix later
- Issue C-002: Skip
- Issue S-005: Defer decision

Implementation Plan:
1. Fix critical issues (S-001, E-001)
2. Fix quick wins (S-003, C-004)
3. Address high priority issues (E-002, S-004)
```

### Clarification Requests

If user needs clarification:
- Explain issue in more detail
- Provide examples
- Show before/after
- Discuss alternatives
- Answer questions

## Step 12: Implement Approved Changes

### Implementation Planning

Plan implementation based on user decisions:

**Immediate Implementation**:
- Critical issues approved for fix
- Quick wins approved for fix
- High priority issues approved for fix

**Deferred Implementation**:
- Issues marked for later
- Issues requiring more discussion
- Issues needing user input

**Skipped Issues**:
- Issues user decided to skip
- Issues out of scope
- Issues requiring major redesign

### Change Implementation Process

For each approved change:

1. **Understand the issue**:
   - Review the issue description
   - Understand the root cause
   - Review the recommended fix

2. **Plan the fix**:
   - Determine exact changes needed
   - Identify affected files
   - Plan the implementation approach

3. **Implement the fix**:
   - Make the changes
   - Test the changes
   - Verify the fix resolves the issue

4. **Document the change**:
   - Note what was changed
   - Note why it was changed
   - Note any side effects

### Change Implementation Checklist

For each change:
- [ ] Issue understood
- [ ] Fix planned
- [ ] Changes implemented
- [ ] Changes tested
- [ ] Fix verified
- [ ] Change documented
- [ ] No regressions introduced

### Regression Prevention

When implementing changes:
- Test related functionality
- Verify no new issues introduced
- Check that changes don't break other things
- Run through execution path
- Validate against standards

### Change Documentation

Document changes in a change log:

```markdown
## Changes Made

### [Date] - Review Iteration [N]

#### Critical Fixes
- **[Issue Title]**: Fixed [description of fix]
  - Changed: [What was changed]
  - Files: [Files affected]

#### High Priority Fixes
- **[Issue Title]**: Fixed [description of fix]
  - Changed: [What was changed]
  - Files: [Files affected]

#### Quick Wins
- **[Issue Title]**: Fixed [description of fix]
  - Changed: [What was changed]
  - Files: [Files affected]
```

### Implementation Verification

After implementing changes:
- Verify each issue is resolved
- Test the skill/workflow end-to-end
- Check for new issues
- Validate against standards
- Confirm user satisfaction

### User Confirmation

After implementation:
- Present summary of changes made
- Ask user to verify changes
- Ask if user is satisfied
- Discuss any remaining issues
- Plan next steps if needed

### Implementation Summary

Provide implementation summary:

```markdown
## Implementation Summary

### Changes Implemented
- [N] critical issues fixed
- [N] high priority issues fixed
- [N] quick wins implemented

### Files Modified
- [List of files modified]

### Issues Remaining
- Critical: [N]
- High Priority: [N]
- Medium Priority: [N]
- Low Priority: [N]

### Next Steps
- [Recommended next steps]
```

### Handling Implementation Issues

If issues arise during implementation:
- Document the problem
- Discuss with user
- Adjust approach if needed
- Document any deviations
- Update change log
