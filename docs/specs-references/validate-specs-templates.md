---
description: Templates and checklists for the validate-specs workflow
---

# Spec Validation Workflow - Templates and Checklists

This document provides templates and checklists used throughout the validate-specs workflow.

## Validation Report Template

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
[Assessment text - 2-3 sentences describing overall state]

### Recommendation
[GO / GO WITH CONDITIONS / NO-GO]

---

## Critical Issues (P0)

### [Issue ID]: [Issue Title]
**Description:** [Detailed description]
**Impact:** [Why this is critical]
**Affected Phases:** [List phases]
**Subagent:** [Which subagent identified this]
**Recommended Fix:** [Specific fix recommendation]
**Effort Estimate:** [If available]

---

## High Priority Issues (P1)

### [Issue ID]: [Issue Title]
**Description:** [Detailed description]
**Impact:** [Why this is high priority]
**Affected Phases:** [List phases]
**Subagent:** [Which subagent identified this]
**Recommended Fix:** [Specific fix recommendation]
**Effort Estimate:** [If available]

---

## Medium Priority Issues (P2)

### [Issue ID]: [Issue Title]
**Description:** [Detailed description]
**Impact:** [Why this matters]
**Affected Phases:** [List phases]
**Subagent:** [Which subagent identified this]
**Recommended Fix:** [Specific fix recommendation]

---

## Low Priority Issues (P3)

### [Issue ID]: [Issue Title]
**Description:** [Detailed description]
**Impact:** [Why this is noted]
**Affected Phases:** [List phases]
**Subagent:** [Which subagent identified this]
**Recommended Fix:** [Specific fix recommendation]

---

## Subagent Insights

### Technical & Architecture Review
**Overall Assessment:** [PASS/NEEDS IMPROVEMENT/FAIL]

**Key Findings:**
- [Finding 1]
- [Finding 2]

**Strengths:**
- [Strength 1]
- [Strength 2]

**Areas for Improvement:**
- [Area 1]
- [Area 2]

---

### Implementation Feasibility Review
**Overall Assessment:** [PASS/NEEDS IMPROVEMENT/FAIL]

**Key Findings:**
- [Finding 1]
- [Finding 2]

**Strengths:**
- [Strength 1]
- [Strength 2]

**Areas for Improvement:**
- [Area 1]
- [Area 2]

---

### Completeness & Gaps Review
**Overall Assessment:** [PASS/NEEDS IMPROVEMENT/FAIL]

**Key Findings:**
- [Finding 1]
- [Finding 2]

**Strengths:**
- [Strength 1]
- [Strength 2]

**Areas for Improvement:**
- [Area 1]
- [Area 2]

---

## Phase-by-Phase Analysis

### Phase 1: [Phase Name]
**Health Score:** [X]%
**Issues:** [X] ([X] critical, [X] high, [X] medium, [X] low)
**Status:** [HEALTHY / NEEDS ATTENTION / CRITICAL]

**Issues:**
- [Issue ID]: [Brief description]

**Recommendations:**
- [Recommendation 1]
- [Recommendation 2]

---

### Phase 2: [Phase Name]
**Health Score:** [X]%
**Issues:** [X] ([X] critical, [X] high, [X] medium, [X] low)
**Status:** [HEALTHY / NEEDS ATTENTION / CRITICAL]

**Issues:**
- [Issue ID]: [Brief description]

**Recommendations:**
- [Recommendation 1]
- [Recommendation 2]

---

## Risk Assessment

### Overall Risk Level: [LOW / MEDIUM / HIGH]

### Key Risks

1. **[Risk Category]: [Risk Description]**
   - **Likelihood:** [High/Medium/Low]
   - **Impact:** [High/Medium/Low]
   - **Mitigation:** [Mitigation strategy]

2. **[Risk Category]: [Risk Description]**
   - **Likelihood:** [High/Medium/Low]
   - **Impact:** [High/Medium/Low]
   - **Mitigation:** [Mitigation strategy]

---

## Recommendations

### Immediate Actions (Required)
1. **[Action]**
   - **Priority:** P0
   - **Effort:** [Low/Medium/High]
   - **Rationale:** [Why this is required]

2. **[Action]**
   - **Priority:** P0
   - **Effort:** [Low/Medium/High]
   - **Rationale:** [Why this is required]

---

### Recommended Improvements
1. **[Improvement]**
   - **Priority:** P1
   - **Effort:** [Low/Medium/High]
   - **Benefit:** [What this improves]

2. **[Improvement]**
   - **Priority:** P1
   - **Effort:** [Low/Medium/High]
   - **Benefit:** [What this improves]

---

### Optional Enhancements
1. **[Enhancement]**
   - **Priority:** P2/P3
   - **Effort:** [Low/Medium/High]
   - **Benefit:** [What this enhances]

2. **[Enhancement]**
   - **Priority:** P2/P3
   - **Effort:** [Low/Medium/High]
   - **Benefit:** [What this enhances]

---

## Next Steps

Based on the validation findings, the recommended path is:

[Recommended next steps with clear actions]

---

## Appendix

### Validation Criteria Used
- Technical soundness
- Implementation feasibility
- Completeness coverage
- Risk assessment
- Best practices alignment

### Scoring Methodology
- Health score calculated based on issue severity and count
- Phase health based on issues affecting that phase
- Overall health is weighted average of phase health

### Glossary
- **P0 (Critical):** Must fix before implementation
- **P1 (High):** Should fix before implementation
- **P2 (Medium):** Recommended to fix
- **P3 (Low):** Optional improvements
```

## Subagent Review Checklist

### Subagent 1: Technical & Architecture Review

**Technology Stack:**
- [ ] Technology choices are appropriate
- [ ] Framework versions are compatible
- [ ] No conflicting technologies
- [ ] Security considerations addressed
- [ ] Performance implications considered

**Architecture:**
- [ ] Architectural patterns appropriate
- [ ] Component boundaries clear
- [ ] Data flow well-defined
- [ ] State management appropriate
- [ ] Scalability addressed

**Consistency:**
- [ ] Terminology consistent
- [ ] No conflicting decisions
- [ ] Data models consistent
- [ ] API contracts coherent

**Performance:**
- [ ] Performance requirements defined
- [ ] Scalability documented
- [ ] Resource constraints identified
- [ ] Caching strategies considered

**Security:**
- [ ] Auth/authorization defined
- [ ] Encryption requirements specified
- [ ] Input validation addressed
- [ ] Security best practices followed

---

### Subagent 2: Implementation Feasibility Review

**Task Breakdown:**
- [ ] Tasks appropriately granular
- [ ] Tasks actionable and specific
- [ ] Task sequencing logical
- [ ] Task dependencies clear
- [ ] No missing critical tasks
- [ ] No redundant tasks

**Dependencies:**
- [ ] Dependencies accurate
- [ ] Dependency ordering correct
- [ ] No circular dependencies
- [ ] External dependencies identified
- [ ] Dependency risks assessed

**Estimates:**
- [ ] Time estimates realistic
- [ ] Resource requirements identified
- [ ] Complexity accurately assessed
- [ ] Buffer time included
- [ ] Parallelization identified

**Clarity:**
- [ ] Implementation approach clear
- [ ] Technical requirements specific
- [ ] Acceptance criteria measurable
- [ ] Success criteria achievable
- [ ] Testing requirements defined

**Risks:**
- [ ] High-risk tasks identified
- [ ] Mitigation strategies proposed
- [ ] Alternative approaches considered
- [ ] Blocker risks highlighted
- [ ] Contingency plans suggested

---

### Subagent 3: Completeness & Gaps Review

**Requirements Coverage:**
- [ ] All user requirements addressed
- [ ] Functional requirements complete
- [ ] Non-functional requirements specified
- [ ] Business rules documented
- [ ] User stories covered

**Edge Cases:**
- [ ] Error scenarios considered
- [ ] Boundary conditions defined
- [ ] Empty/null states handled
- [ ] Invalid input specified
- [ ] Concurrency addressed

**Ambiguity:**
- [ ] Vague language identified
- [ ] Undefined terms noted
- [ ] Subjective criteria flagged
- [ ] Missing context highlighted
- [ ] Assumptions explicit

**Success Criteria:**
- [ ] Success criteria specific
- [ ] Acceptance criteria clear
- [ ] Testing criteria defined
- [ ] Verification methods specified
- [ ] Completion criteria unambiguous

**Integration:**
- [ ] Integration points defined
- [ ] API contracts complete
- [ ] Data migration considered
- [ ] Backward compatibility addressed
- [ ] Third-party integrations specified

## Change Implementation Log Template

```markdown
# Change Implementation Log

**Validation Date:** [Date]
**Repository:** [Repository Name]

---

## Changes Implemented

### [Issue ID]: [Issue Description]
**Status:** [Implemented/Skipped/Deferred]
**Priority:** [P0/P1/P2/P3]
**Files Modified:**
- [File 1]
- [File 2]

**Changes Made:**
- [Change 1]
- [Change 2]

**Validation:** [Passed/Failed]
**Notes:** [Any additional notes]

---

### [Issue ID]: [Issue Description]
**Status:** [Implemented/Skipped/Deferred]
**Priority:** [P0/P1/P2/P3]
**Files Modified:**
- [File 1]

**Changes Made:**
- [Change 1]

**Validation:** [Passed/Failed]
**Notes:** [Any additional notes]

---

## Summary

**Total Issues:** [X]
**Implemented:** [X]
**Skipped:** [X]
**Deferred:** [X]

**Files Modified:** [X]
**Total Changes:** [X]
```

## Final Summary Template

```markdown
# Spec Validation - Final Summary

**Validation Date:** [Date]
**Repository:** [Repository Name]
**Workflow Version:** [Version]

---

## Validation Overview

**Initial Assessment:**
- Health Score: [X]%
- Critical Issues: [X]
- High Priority: [X]
- Medium Priority: [X]
- Low Priority: [X]
- Completeness: [X]%

**Actions Taken:**
- Approach: [Option A/B/C/D/E]
- Changes Implemented: [X]
- Issues Resolved: [X]
- Issues Deferred: [X]

**Final Assessment:**
- Health Score: [X]%
- Critical Issues: [X]
- High Priority: [X]
- Medium Priority: [X]
- Low Priority: [X]
- Completeness: [X]%

**Improvement:**
- Health Score Change: [+X% / -X%]
- Issues Resolved: [X]
- New Issues: [X]

---

## Final Status

**Readiness: [READY / NEEDS WORK / NOT READY]**

---

## Remaining Issues (If Any)

**Critical:**
- [List remaining critical issues]

**High Priority:**
- [List remaining high priority issues]

**Medium Priority:**
- [List remaining medium priority issues]

**Low Priority:**
- [List remaining low priority issues]

---

## Known Limitations

- [Limitation 1]
- [Limitation 2]

---

## Implementation Guidance

**If Ready:**
The specs are ready for implementation. Run:
```
/implement-specs
```

**Special Considerations:**
- [Consideration 1]
- [Consideration 2]

**If Needs Work:**
Recommended next steps:
1. [Step 1]
2. [Step 2]

Re-run validation after completing:
```
/validate-specs
```

---

## Next Steps

[Clear next steps based on final status]
```

## Bash Script Templates

### Spec Structure Validation

```bash
#!/bin/bash
set -e  # Exit on error
set -u  # Exit on undefined variable

# Validate spec structure
echo "=== Validating Spec Structure ==="

# Check specs directory
if [ ! -d "specs" ]; then
  echo "ERROR: specs/ directory not found"
  exit 1
fi

# Check README
if [ ! -f "specs/README.md" ]; then
  echo "ERROR: specs/README.md not found"
  exit 1
fi

# Check phase files
phase_count=$(find specs -name "phase-*.md" | wc -l)
if [ $phase_count -eq 0 ]; then
  echo "ERROR: No phase files found (expected pattern: phase-*.md)"
  exit 1
fi

echo "✓ Spec structure validation passed"
echo "  Found $phase_count phase files"
```

### Completeness Scoring

```bash
#!/bin/bash
set -e  # Exit on error
set -u  # Exit on undefined variable

# Calculate completeness score for a phase
# NOTE: This script is a template and requires adaptation to your actual spec file structure
# 
# Adaptation Guide:
# 1. Review your spec file structure to identify the section headers or markers
# 2. Update the 'required_elements' array to match your actual section names
# 3. If your spec uses different section formats (e.g., ## Section vs ### Section), adjust the grep pattern
# 4. For more complex structures, consider using awk instead of grep for better parsing
#
# Example Adaptation:
# If your spec uses "## Overview" instead of "phase_description", change the array element to "## Overview"
# If your spec uses markdown headers with specific formatting, adjust the grep pattern accordingly
#
phase_file=$1

# Define required elements
# IMPORTANT: Adjust these patterns to match your actual spec file structure
# Common patterns include: "## Section Name", "### Section Name", or custom markers
required_elements=(
  "phase_description"
  "dependencies"
  "implementation_tasks"
  "success_criteria"
  "technical_requirements"
  "acceptance_criteria"
)

present_count=0
total_count=${#required_elements[@]}

for element in "${required_elements[@]}"; do
  if grep -q "$element" "$phase_file"; then
    ((present_count++))
  fi
done

score=$((present_count * 100 / total_count))
echo "Completeness: $score% ($present_count/$total_count elements)"
```

### Quick Re-validation

```bash
#!/bin/bash
set -e  # Exit on error
set -u  # Exit on undefined variable

# Quick validation of modified specs
echo "=== Re-validating Modified Specs ==="

# Check structure still valid
if [ ! -d "specs" ]; then
  echo "ERROR: specs/ directory missing"
  exit 1
fi

# Count phase files
phase_count=$(find specs -name "phase-*.md" | wc -l)
echo "Phase files: $phase_count"

# Check for basic structure issues
# Add specific checks based on changes made

echo "✓ Quick validation passed"
```
