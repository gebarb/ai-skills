# Skill Review - Templates

This document provides templates for the skill-review workflow.

## Validation Report Template

```markdown
# Skill/Workflow Validation Report

**Skill/Workflow**: [Name]
**Review Date**: [Date]
**Review Iteration**: [N]
**Overall Assessment**: [Summary of quality]

---

## Executive Summary

### Key Findings
- **Critical Issues**: [N]
- **High Priority Issues**: [N]
- **Medium Priority Issues**: [N]
- **Low Priority Issues**: [N]

### Overall Rating
[Rating based on findings, e.g., 7/10]

### Recommendation
[Overall recommendation - e.g., "Ready with critical fixes", "Needs significant work"]

---

## Critical Issues (Must Fix)

### [Issue Title]
**Severity**: Critical
**Found By**: [Standards/Execution/Completeness Review]
**Location**: [Where in the skill/workflow]

**Problem**: [Clear description of the problem]

**Impact**: [What this affects and why it matters]

**Recommended Fix**: [Specific, actionable fix]

**Example**: [Before/after example if applicable]

---

## High Priority Issues (Should Fix)

### [Issue Title]
**Severity**: High
**Found By**: [Standards/Execution/Completeness Review]
**Location**: [Where in the skill/workflow]

**Problem**: [Clear description of the problem]

**Impact**: [What this affects and why it matters]

**Recommended Fix**: [Specific, actionable fix]

**Example**: [Before/after example if applicable]

---

## Quick Wins (Easy Fixes with High Impact)

### [Issue Title]
**Severity**: [Medium/Low]
**Found By**: [Standards/Execution/Completeness Review]
**Location**: [Where in the skill/workflow]

**Problem**: [Clear description of the problem]

**Impact**: [What this affects and why it matters]

**Recommended Fix**: [Specific, actionable fix]

**Effort**: Low
**Impact**: High

---

## Medium Priority Issues (Improve Quality)

### [Issue Title]
**Severity**: Medium
**Found By**: [Standards/Execution/Completeness Review]
**Location**: [Where in the skill/workflow]

**Problem**: [Clear description of the problem]

**Impact**: [What this affects and why it matters]

**Recommended Fix**: [Specific, actionable fix]

---

## Low Priority Issues (Polish)

### [Issue Title]
**Severity**: Low
**Found By**: [Standards/Execution/Completeness Review]
**Location**: [Where in the skill/workflow]

**Problem**: [Clear description of the problem]

**Impact**: [What this affects and why it matters]

**Recommended Fix**: [Specific, actionable fix]

---

## Strengths

### What Works Well
- [Strength 1]
- [Strength 2]
- [Strength 3]

### Best Practices Followed
- [Best practice 1]
- [Best practice 2]
- [Best practice 3]

---

## Correlated Findings

### Related Issues Group 1: [Title]
- **Issues**: [List issue IDs]
- **Root Cause**: [Description]
- **Recommended Fix**: [How to address]

---

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

## Issue Documentation Template

```markdown
### [Issue Title]

**Issue ID**: [Unique ID, e.g., S-001, E-001, C-001]
**Severity**: Critical/High/Medium/Low
**Found By**: Standards/Execution/Completeness Review
**Location**: [File and line/section]

**Problem Description**
[Clear description of the problem]

**Impact**
[What this affects and why it matters]

**Evidence**
[Specific evidence from the review]
- Quote from skill/workflow
- Specific example
- Test result

**Recommended Fix**
[Specific, actionable fix]

**Example**
**Before**:
```markdown
[Original content]
```

**After**:
```markdown
[Fixed content]
```

**Priority Score**
[Calculated priority score if using framework]

**Related Issues**
[List related issue IDs]
```

## User Decision Template

```markdown
### [Issue Title]

**Severity**: Critical/High/Medium/Low
**Impact**: [What this affects]

**Options**:
1. **Fix now** - [I can implement this fix immediately]
2. **Fix later** - [Add to backlog for future iteration]
3. **Skip** - [Accept this issue as-is]
4. **Defer decision** - [Decide after reviewing other issues]

**My recommendation**: [What I recommend and why]

**Your decision**: [User's choice]
```

## Change Log Template

```markdown
## Changes Made

### [Date] - Review Iteration [N]

#### Critical Fixes
- **[Issue Title]**: Fixed [description of fix]
  - Changed: [What was changed]
  - Files: [Files affected]
  - Issue ID: [ID]

#### High Priority Fixes
- **[Issue Title]**: Fixed [description of fix]
  - Changed: [What was changed]
  - Files: [Files affected]
  - Issue ID: [ID]

#### Quick Wins
- **[Issue Title]**: Fixed [description of fix]
  - Changed: [What was changed]
  - Files: [Files affected]
  - Issue ID: [ID]

#### Medium Priority Fixes
- **[Issue Title]**: Fixed [description of fix]
  - Changed: [What was changed]
  - Files: [Files affected]
  - Issue ID: [ID]
```

## Re-review Results Template

```markdown
## Re-review Results

### Issue Resolution Status
- ✅ Fully Resolved: [N] issues
- ⚠️ Partially Resolved: [N] issues
- ❌ Not Resolved: [N] issues
- ⏭️ Skipped: [N] issues

### Resolution Details

#### Fully Resolved ✅
- [Issue ID] - [Title]
- [Issue ID] - [Title]

#### Partially Resolved ⚠️
- [Issue ID] - [Title] - [What remains]
- [Issue ID] - [Title] - [What remains]

#### Not Resolved ❌
- [Issue ID] - [Title] - [Why not resolved]
- [Issue ID] - [Title] - [Why not resolved]

#### Skipped ⏭️
- [Issue ID] - [Title] - [Reason for skipping]
- [Issue ID] - [Title] - [Reason for skipping]

### Regression Check
- ✅ No Regressions: [Yes/No]
- New Issues Found: [N]

#### New Issues
- [New issue description]
- [New issue description]

### Quality Assessment
- Previous Quality Rating: [Rating]
- Current Quality Rating: [Rating]
- Improvement: [Description]
- Readiness Assessment: [Ready/Needs Work/Not Ready]

### Remaining Issues
- Critical: [N]
- High Priority: [N]
- Medium Priority: [N]
- Low Priority: [N]
```

## Final Summary Template

```markdown
# Skill/Workflow Review Final Summary

**Skill/Workflow**: [Name]
**Review Date**: [Date]
**Review Iteration**: [N]

---

## Review Overview

### Initial Assessment
- Initial Quality Rating: [Rating]
- Total Issues Found: [N]
- Critical Issues: [N]
- High Priority Issues: [N]
- Medium Priority Issues: [N]
- Low Priority Issues: [N]

### Changes Implemented
- Issues Fixed: [N]
- Critical Issues Fixed: [N]
- High Priority Issues Fixed: [N]
- Quick Wins Implemented: [N]
- Files Modified: [N]

### Current State
- Current Quality Rating: [Rating]
- Remaining Critical Issues: [N]
- Remaining High Priority Issues: [N]
- Remaining Medium Priority Issues: [N]
- Remaining Low Priority Issues: [N]

---

## Changes Made

### Critical Fixes
1. [Issue Title] - [Brief description of fix]

### High Priority Fixes
1. [Issue Title] - [Brief description of fix]

### Quick Wins
1. [Issue Title] - [Brief description of fix]

---

## Issue Resolution Status

### Fully Resolved ✅
- [Issue ID] - [Title]
- [Issue ID] - [Title]

### Partially Resolved ⚠️
- [Issue ID] - [Title] - [What remains]
- [Issue ID] - [Title] - [What remains]

### Not Resolved ❌
- [Issue ID] - [Title] - [Why not resolved]
- [Issue ID] - [Title] - [Why not resolved]

### Skipped ⏭️
- [Issue ID] - [Title] - [Reason for skipping]
- [Issue ID] - [Title] - [Reason for skipping]

---

## Remaining Issues

### Critical
- [Issue description]

### High Priority
- [Issue description]

### Medium Priority
- [Issue description]

### Low Priority
- [Issue description]

---

## Quality Assessment

### Strengths Maintained
- [Strength 1]
- [Strength 2]

### New Strengths
- [Strength 1]
- [Strength 2]

### Areas for Continued Improvement
- [Area 1]
- [Area 2]

---

## Recommendations

### Immediate Actions
1. [Action 1]
2. [Action 2]

### Future Improvements
1. [Improvement 1]
2. [Improvement 2]

### Next Review
- Recommended timing: [When to review again]
- Recommended focus: [What to focus on]
- Recommended approach: [How to approach]

---

## Conclusion

**Overall Assessment**: [Ready for use / Needs more work / Not ready]

**Summary**: [Brief summary of the review outcome]

**Recommendation**: [What to do next]
```

## Review History Template

```markdown
## Review History

### Iteration 1 - [Date]
- **Reviewer**: [Perspective applied]
- **Initial Quality Rating**: [Rating]
- **Issues Found**: [N]
  - Critical: [N]
  - High: [N]
  - Medium: [N]
  - Low: [N]
- **Issues Fixed**: [N]
- **Quality Improvement**: [Description]
- **Final Quality Rating**: [Rating]

### Iteration 2 - [Date]
- **Reviewer**: [Perspective applied]
- **Initial Quality Rating**: [Rating]
- **Issues Found**: [N]
  - Critical: [N]
  - High: [N]
  - Medium: [N]
  - Low: [N]
- **Issues Fixed**: [N]
- **Quality Improvement**: [Description]
- **Final Quality Rating**: [Rating]

### Iteration 3 - [Date]
- **Reviewer**: [Perspective applied]
- **Initial Quality Rating**: [Rating]
- **Issues Found**: [N]
  - Critical: [N]
  - High: [N]
  - Medium: [N]
  - Low: [N]
- **Issues Fixed**: [N]
- **Quality Improvement**: [Description]
- **Final Quality Rating**: [Rating]
```

## Priority Scoring Template

```markdown
### Priority Scoring Framework

Priority = Severity × Impact × Frequency

**Severity**:
- Critical = 4
- High = 3
- Medium = 2
- Low = 1

**Impact**:
- Affects many = 3
- Affects some = 2
- Affects few = 1

**Frequency**:
- Always = 3
- Often = 2
- Rarely = 1

**Priority Levels**:
- 12-36: Critical priority
- 8-11: High priority
- 4-7: Medium priority
- 1-3: Low priority

### Example Calculation

**Issue**: Missing error handling in Step 3
- Severity: 3 (High)
- Impact: 3 (Affects many users)
- Frequency: 2 (Often occurs)
- Priority: 3 × 3 × 2 = 18 (Critical priority)
```

## Correlation Matrix Template

```markdown
### Correlation Matrix

| Issue ID | Perspective | Category | Related Issues | Root Cause | Priority Score |
|----------|-------------|----------|----------------|------------|----------------|
| S-001    | Standards   | YAML     | E-003, C-002   | Missing frontmatter field | 12 |
| E-001    | Execution   | Flow     | S-002          | Unclear step ordering | 15 |
| C-001    | Completeness| Context  | None           | Missing reference file | 8 |
```

## Standards Conflicts Template

```markdown
## Standards Conflicts

### Conflict 1: [Description of conflict]
- **Source A**: [Standard from source A, e.g., "agentskills.io recommends X"]
- **Source B**: [Standard from source B, e.g., "Anthropic skill-creator recommends Y"]
- **Decision**: [Which standard was chosen and why]
- **Rationale**: [Explanation of the decision, e.g., "Chose Source A because it's more recent (within last 12 months) and is an official specification document"]

### Conflict 2: [Description of conflict]
- **Source A**: [Standard from source A]
- **Source B**: [Standard from source B]
- **Decision**: [Which standard was chosen and why]
- **Rationale**: [Explanation of the decision]
```

## Prioritization Guidance Template

```markdown
## Prioritization Guidance

When multiple issues have the same severity level, use this order to prioritize:

1. **By Impact** (within same severity):
   - Affects many users > Affects some users > Affects few users

2. **By Fix Effort** (within same impact):
   - Easy fixes first (quick wins) > Medium effort > Complex fixes

3. **By Risk** (if applicable):
   - High risk if not fixed > Medium risk > Low risk

**Example**: If you have 3 high-priority issues:
- Issue A: Affects many users, easy fix → Fix first
- Issue B: Affects some users, medium fix → Fix second
- Issue C: Affects few users, complex fix → Fix third
```
