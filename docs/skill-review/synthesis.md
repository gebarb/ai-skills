# Skill Review - Synthesis Phase

This document provides detailed guidance for Steps 7-9 of the skill-review workflow.

## Step 7: Aggregate and Correlate Findings

### Finding Collection

Gather all findings from the three perspectives:

**From Standards & Best Practices Review**:
- Windsurf standards compliance issues
- Anthropic guidelines compliance issues
- Best practices violations
- Critical standards violations

**From Execution & Structure Review**:
- Execution flow problems
- Instruction ambiguities
- Error handling gaps
- Critical execution problems

**From Completeness & Gaps Review**:
- Missing requirements
- Context gaps
- Goal achievement issues
- Critical completeness gaps

### Finding Correlation

Identify relationships between findings:

**Related findings**:
- Issues that are symptoms of the same root cause
- Issues that affect the same component
- Issues that have similar solutions
- Issues that are interdependent

**Conflicting findings**:
- Issues where perspectives disagree
- Issues with different severity assessments
- Issues with different recommended solutions
- Issues that require trade-off decisions

**Independent findings**:
- Issues unique to one perspective
- Issues that don't relate to others
- Issues that can be addressed independently
- Issues that are standalone

### Correlation Matrix

Create a correlation matrix:

```
| Issue ID | Perspective | Category | Related Issues | Root Cause |
|----------|-------------|----------|----------------|------------|
| S-001    | Standards   | YAML     | E-003, C-002   | Missing frontmatter field |
| E-001    | Execution   | Flow     | S-002          | Unclear step ordering |
| C-001    | Completeness| Context  | None           | Missing reference file |
```

### Root Cause Analysis

For groups of related findings, identify root causes:

**Common root causes**:
- Incomplete planning
- Lack of testing
- Poor understanding of standards
- Insufficient review
- Rushed development

**Root cause documentation**:
```
Root Cause: [Description]
Related Issues: [List issue IDs]
Impact: [What this affects]
Recommended Fix: [How to address root cause]
```

### Aggregation Structure

Organize findings by:
1. **Severity** (critical, high, medium, low)
2. **Category** (standards, execution, completeness)
3. **Component** (frontmatter, content, structure, files)
4. **Root cause** (if identified)

## Step 8: Prioritize Issues and Recommendations

### Severity Classification

**Critical** (must fix before use):
- Skill/workflow cannot execute
- Security vulnerabilities
- Major standards violations
- Missing critical functionality
- Data loss potential

**High** (should fix before common use):
- Execution failures in common scenarios
- Significant standards violations
- Missing error handling
- Major ambiguities
- Important gaps

**Medium** (improve quality):
- Minor standards violations
- Suboptimal structure
- Missing examples
- Minor inconsistencies
- Could be clearer

**Low** (polish):
- Formatting improvements
- Minor wording tweaks
- Additional examples
- Enhanced documentation
- Nice-to-have features

### Prioritization Framework

Use this framework to prioritize:

```
Priority = Severity × Impact × Frequency

Where:
- Severity: Critical=4, High=3, Medium=2, Low=1
- Impact: Affects many=3, Affects some=2, Affects few=1
- Frequency: Always=3, Often=2, Rarely=1
```

**Priority scoring**:
- 12-36: Critical priority
- 8-11: High priority
- 4-7: Medium priority
- 1-3: Low priority

### Recommendation Categorization

**Must Fix**:
- All critical issues
- High priority issues affecting common use
- Issues that prevent execution

**Should Fix**:
- High priority issues
- Medium priority issues affecting quality
- Standards violations

**Nice to Have**:
- Medium priority polish items
- Low priority improvements
- Enhancements

**Out of Scope**:
- Issues outside skill/workflow scope
- Issues requiring major redesign
- Issues better addressed separately

### Prioritized Issue List

Create a prioritized list:

```
## Prioritized Issues

### Critical Priority (Must Fix)
1. [Issue ID] - [Title]
   - Perspective: [Which perspective found it]
   - Severity: Critical
   - Impact: [What it affects]
   - Recommendation: [How to fix]

### High Priority (Should Fix)
1. [Issue ID] - [Title]
   - Perspective: [Which perspective found it]
   - Severity: High
   - Impact: [What it affects]
   - Recommendation: [How to fix]

### Medium Priority (Improve Quality)
1. [Issue ID] - [Title]
   - Perspective: [Which perspective found it]
   - Severity: Medium
   - Impact: [What it affects]
   - Recommendation: [How to fix]

### Low Priority (Polish)
1. [Issue ID] - [Title]
   - Perspective: [Which perspective found it]
   - Severity: Low
   - Impact: [What it affects]
   - Recommendation: [How to fix]
```

### Quick Wins Identification

Identify quick wins:
- Issues that are easy to fix
- Issues that have high impact
- Issues that can be fixed quickly
- Issues that improve quality significantly

Document quick wins separately for easy reference.

## Step 9: Generate Validation Report

### Report Structure

Create a comprehensive validation report:

```markdown
# Skill/Workflow Validation Report

## Executive Summary

**Skill/Workflow**: [Name]
**Review Date**: [Date]
**Review Iteration**: [N]
**Overall Assessment**: [Summary of quality]

### Key Findings
- [Number] critical issues
- [Number] high priority issues
- [Number] medium priority issues
- [Number] low priority issues

### Overall Rating
[Rating based on findings]
```

### Detailed Findings Section

```markdown
## Detailed Findings

### Standards & Best Practices Review
[Summary of standards review]

#### Critical Issues
[List critical standards issues]

#### High Priority Issues
[List high priority standards issues]

#### Medium Priority Issues
[List medium priority standards issues]

#### Low Priority Issues
[List low priority standards issues]

### Execution & Structure Review
[Summary of execution review]

#### Critical Issues
[List critical execution issues]

#### High Priority Issues
[List high priority execution issues]

#### Medium Priority Issues
[List medium priority execution issues]

#### Low Priority Issues
[List low priority execution issues]

### Completeness & Gaps Review
[Summary of completeness review]

#### Critical Issues
[List critical completeness issues]

#### High Priority Issues
[List high priority completeness issues]

#### Medium Priority Issues
[List medium priority completeness issues]

#### Low Priority Issues
[List low priority completeness issues]
```

### Correlated Findings Section

```markdown
## Correlated Findings

### Related Issues Group 1: [Title]
- Issues: [List issue IDs]
- Root Cause: [Description]
- Recommended Fix: [How to address]

### Related Issues Group 2: [Title]
- Issues: [List issue IDs]
- Root Cause: [Description]
- Recommended Fix: [How to address]
```

### Strengths Section

```markdown
## Strengths

### What Works Well
- [Strength 1]
- [Strength 2]
- [Strength 3]

### Best Practices Followed
- [Best practice 1]
- [Best practice 2]
- [Best practice 3]
```

### Recommendations Section

```markdown
## Recommendations

### Must Fix (Critical)
1. [Recommendation 1]
   - Issue: [Related issue ID]
   - Action: [Specific action]
   - Priority: Critical

### Should Fix (High Priority)
1. [Recommendation 1]
   - Issue: [Related issue ID]
   - Action: [Specific action]
   - Priority: High

### Nice to Have (Medium/Low Priority)
1. [Recommendation 1]
   - Issue: [Related issue ID]
   - Action: [Specific action]
   - Priority: Medium/Low
```

### Quick Wins Section

```markdown
## Quick Wins

These are easy fixes that will significantly improve quality:

1. [Quick win 1]
   - Effort: Low
   - Impact: High
   - Action: [What to do]

2. [Quick win 2]
   - Effort: Low
   - Impact: High
   - Action: [What to do]
```

### Overall Assessment Section

```markdown
## Overall Assessment

### Readiness for Use
[Assessment of whether skill/workflow is ready for use]

### Quality Score
[Score based on findings - e.g., 7/10]

### Strengths Summary
[Brief summary of strengths]

### Primary Concerns
[Brief summary of main concerns]

### Recommendation
[Overall recommendation - e.g., "Ready with critical fixes", "Needs significant work", etc.]
```

### Next Steps Section

```markdown
## Next Steps

### Immediate Actions
1. [Action 1]
2. [Action 2]

### Short-term Improvements
1. [Improvement 1]
2. [Improvement 2]

### Long-term Enhancements
1. [Enhancement 1]
2. [Enhancement 2]

### Recommended Review Schedule
[Suggested schedule for future reviews]
```

### Report Quality Checklist

Before presenting the report:

- [ ] All findings are documented
- [ ] Issues are prioritized
- [ ] Recommendations are actionable
- [ ] Report is well-organized
- [ ] Report is clear and concise
- [ ] Report is constructive
- [ ] Report includes strengths
- [ ] Report includes next steps
- [ ] Report is professional in tone
- [ ] Report is ready for user review
