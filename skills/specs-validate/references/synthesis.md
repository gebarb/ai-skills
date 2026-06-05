---
description: Validate specs through comprehensive multi-perspective review - Part 3: Synthesis Phase (Steps 7-9)
---

# Spec Validation Workflow - Part 3: Synthesis Phase

This is Part 3 of the specs-validate workflow, covering Steps 7-9: Aggregating findings, prioritizing issues, and generating the validation report.

For the complete workflow, see:
- Initial Assessment: `initial.md` (Steps 1-3)
- Multi-Perspective Review: `review.md` (Steps 4-6)
- Synthesis: This file (Steps 7-9)
- User Interaction: `interaction.md` (Steps 10-12)
- Finalization: `finalization.md` (Steps 13-14)

## Usage

Run this workflow from the root of your repository:

```
/specs-validate
```

## Workflow Steps

### 7. Aggregate and Correlate Findings

**Objective:** Combine findings from all three subagents into a unified view.

**Aggregation Process:**

**Collect All Findings:**
- Compile all issues from Subagent 1 (Technical & Architecture)
- Compile all issues from Subagent 2 (Implementation Feasibility)
- Compile all issues from Subagent 3 (Completeness & Gaps)
- Compile all recommendations from all subagents

**Categorize Findings:**
Group findings by category:
- Critical Issues (blocking implementation)
- High Priority (significant impact)
- Medium Priority (important but not blocking)
- Low Priority (nice to have, minor improvements)

**Correlation Analysis:**
Identify relationships between findings:
- **Overlapping Issues:** Same issue identified by multiple subagents
- **Related Issues:** Issues that are causally related
- **Conflicting Recommendations:** Subagents disagree on approach
- **Compound Issues:** Multiple issues that compound each other

**Correlation Matrix:**
```
Issue ID | Subagent 1 | Subagent 2 | Subagent 3 | Related To | Conflicts With
---------|------------|------------|------------|------------|----------------
T001     | ✓          |            |            | I005       |
I003     |            | ✓          | ✓          | T001       |
...
```

**Phase-Level Aggregation:**
For each phase, aggregate:
- All issues affecting the phase
- All recommendations for the phase
- Overall phase health score
- Phase-specific risk assessment

**Aggregation Output Format:**
```
=== Findings Aggregation ===

Total Issues Found: [X]
- Critical: [X]
- High: [X]
- Medium: [X]
- Low: [X]

Overlapping Issues:
- [Issue] (identified by [subagents])
- [Issue] (identified by [subagents])

Conflicting Recommendations:
- [Conflict 1]: [Subagent A] recommends X, [Subagent B] recommends Y
- [Conflict 2]: ...

Phase-Level Summary:
Phase 1: [X] issues, [X] recommendations, Health: [X]%
Phase 2: [X] issues, [X] recommendations, Health: [X]%
...
```

### 8. Prioritize Issues and Recommendations

**Objective:** Determine the order in which issues should be addressed.

**Prioritization Framework:**

**Priority Levels:**

**P0 - Critical (Must Fix Before Implementation):**
- Blocking issues that prevent implementation
- Security vulnerabilities
- Architectural flaws
- Missing critical requirements
- Circular dependencies

**P1 - High (Should Fix Before Implementation):**
- Significant implementation risks
- Major gaps in specifications
- Performance concerns
- Important missing edge cases
- High-risk dependencies

**P2 - Medium (Recommended to Fix):**
- Minor inconsistencies
- Clarification needed on ambiguous specs
- Small gaps in coverage
- Optimization opportunities
- Nice-to-have improvements

**P3 - Low (Optional):**
- Cosmetic issues
- Minor documentation improvements
- Nice-to-have features
- Low-risk optimizations

**Prioritization Criteria:**
- **Impact:** How severely does this affect implementation?
- **Urgency:** How soon must this be addressed?
- **Risk:** What is the risk of not addressing this?
- **Effort:** How much effort is required to fix?
- **Dependencies:** Does this block other issues?

**Prioritization Matrix:**
```
Issue ID | Category | Impact | Urgency | Risk | Effort | Priority
---------|----------|--------|--------|------|--------|----------
T001     | Tech     | High   | High   | High | Medium | P0
I003     | Impl     | Medium | High   | Med  | Low    | P1
...
```

**Recommendation Prioritization:**
Prioritize recommendations based on:
- Alignment with project goals
- Feasibility of implementation
- Value added
- Cost/benefit ratio

**Prioritized Output Format:**
```
=== Prioritized Issues ===

P0 - Critical (Must Fix):
1. [Issue ID] - [Issue Description]
   - Impact: [description]
   - Affected Phases: [list]
   - Recommended Fix: [fix]

P1 - High (Should Fix):
1. [Issue ID] - [Issue Description]
   - Impact: [description]
   - Affected Phases: [list]
   - Recommended Fix: [fix]

P2 - Medium (Recommended):
1. [Issue ID] - [Issue Description]
   - Impact: [description]
   - Affected Phases: [list]
   - Recommended Fix: [fix]

P3 - Low (Optional):
1. [Issue ID] - [Issue Description]
   - Impact: [description]
   - Affected Phases: [list]
   - Recommended Fix: [fix]

=== Prioritized Recommendations ===

High Value:
1. [Recommendation]
   - Benefit: [description]
   - Effort: [description]

Medium Value:
1. [Recommendation]
   - Benefit: [description]
   - Effort: [description]

Low Value:
1. [Recommendation]
   - Benefit: [description]
   - Effort: [description]
```

### 9. Generate Validation Report

**Objective:** Create a comprehensive, user-friendly report summarizing all findings.

**Report Structure:**

**Executive Summary:**
- Overall spec health score
- Total issues by severity
- Readiness assessment
- Go/No-Go recommendation

**Detailed Findings:**
- Categorized issues (P0, P1, P2, P3)
- Subagent-specific insights
- Phase-by-phase breakdown

**Recommendations:**
- Prioritized action items
- Specific fixes for each issue
- Improvement suggestions

**Risk Assessment:**
- Overall risk level
- Specific risks by category
- Mitigation strategies

**Next Steps:**
- Immediate actions required
- Recommended workflow path
- Timeline considerations

**Report Template:**
```markdown
# Spec Validation Report

**Generated:** [Date]
**Repository:** [Repository Name]
**Spec Version:** [Version if available]

## Executive Summary

### Overall Health Score: [X]%

### Issue Summary
- **Critical (P0):** [X] issues
- **High (P1):** [X] issues
- **Medium (P2):** [X] issues
- **Low (P3):** [X] issues

### Readiness Assessment
[Assessment text]

### Recommendation
[GO / GO WITH CONDITIONS / NO-GO]

---

## Critical Issues (P0)

[Detailed list of P0 issues]

---

## High Priority Issues (P1)

[Detailed list of P1 issues]

---

## Medium Priority Issues (P2)

[Detailed list of P2 issues]

---

## Low Priority Issues (P3)

[Detailed list of P3 issues]

---

## Subagent Insights

### Technical & Architecture Review
[Summary of key findings]

### Implementation Feasibility Review
[Summary of key findings]

### Completeness & Gaps Review
[Summary of key findings]

---

## Phase-by-Phase Analysis

### Phase 1: [Phase Name]
- Health Score: [X]%
- Issues: [X]
- Status: [Status]

### Phase 2: [Phase Name]
- Health Score: [X]%
- Issues: [X]
- Status: [Status]

---

## Risk Assessment

### Overall Risk Level: [LOW / MEDIUM / HIGH]

### Key Risks
1. [Risk 1] - [Mitigation]
2. [Risk 2] - [Mitigation]

---

## Recommendations

### Immediate Actions (Required)
1. [Action 1]
2. [Action 2]

### Recommended Improvements
1. [Improvement 1]
2. [Improvement 2]

### Optional Enhancements
1. [Enhancement 1]
2. [Enhancement 2]

---

## Next Steps

[Recommended next steps based on findings]
```

**Report Delivery:**
- Present report to user in clear, organized format
- Highlight critical issues prominently
- Provide actionable next steps
- Offer to implement fixes if desired

## Continue to Part 4

For Steps 10-12 (User Interaction Phase), see `interaction.md`.
