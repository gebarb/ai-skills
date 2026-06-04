---
description: Validate specs through comprehensive multi-perspective review - Part 4: User Interaction Phase (Steps 10-12)
---

# Spec Validation Workflow - Part 4: User Interaction Phase

This is Part 4 of the specs-validate workflow, covering Steps 10-12: Presenting the validation report, gathering user feedback, and implementing approved changes.

For the complete workflow, see:
- Initial Assessment: `~/.codeium/windsurf/docs/specs-references/specs-validate-initial.md` (Steps 1-3)
- Multi-Perspective Review: `~/.codeium/windsurf/docs/specs-references/specs-validate-review.md` (Steps 4-6)
- Synthesis: `~/.codeium/windsurf/docs/specs-references/specs-validate-synthesis.md` (Steps 7-9)
- User Interaction: This file (Steps 10-12)
- Finalization: `~/.codeium/windsurf/docs/specs-references/specs-validate-finalization.md` (Steps 13-14)

## Usage

Run this workflow from the root of your repository:

```
/specs-validate
```

## Workflow Steps

### 10. Present Validation Report to User

**Objective:** Clearly communicate validation findings to the user.

**Presentation Approach:**

**Executive Summary First:**
- Start with high-level overview
- Present overall health score
- Show issue summary by severity
- Provide clear Go/No-Go recommendation

**Detailed Findings:**
- Present issues in priority order (P0 → P3)
- For each issue, provide:
  - Clear description
  - Impact explanation
  - Affected phases
  - Recommended fix
  - Effort estimate (if available)

**Visual Organization:**
- Use clear headings and sections
- Highlight critical issues prominently
- Use bullet points for readability
- Group related issues together

**Contextual Information:**
- Explain why each issue matters
- Provide context for recommendations
- Note any conflicting perspectives from subagents
- Highlight interdependencies between issues

**Presentation Template:**
```
=== Spec Validation Complete ===

📊 Executive Summary
-------------------
Overall Health Score: [X]%
Critical Issues: [X]
High Priority: [X]
Medium Priority: [X]
Low Priority: [X]

Recommendation: [GO / GO WITH CONDITIONS / NO-GO]

🚨 Critical Issues (Must Fix)
------------------------------
[Present P0 issues with details]

⚠️  High Priority Issues (Should Fix)
-------------------------------------
[Present P1 issues with details]

📝 Medium Priority Issues (Recommended)
-----------------------------------------
[Present P2 issues with details]

💡 Low Priority Issues (Optional)
----------------------------------
[Present P3 issues with details]

🔍 Subagent Insights
--------------------
[Present key insights from each subagent]

📈 Phase-by-Phase Health
-------------------------
[Present phase health scores]

⚠️  Risk Assessment
--------------------
[Present overall risk level and key risks]

📋 Recommendations
------------------
[Present prioritized recommendations]

🚀 Next Steps
-------------
[Present recommended next steps]
```

**User Engagement:**
- Ask user if they have questions about findings
- Offer to clarify any issues
- Provide additional context if requested
- Be prepared to dive deeper into specific areas

### 11. Gather User Feedback and Decisions

**Objective:** Understand user's perspective on findings and determine action plan.

**Feedback Collection:**

**Decision Points:**
Present clear options to the user:

```
=== Decision Required ===

Based on the validation findings, please choose:

Option A: Proceed to Implementation
- Address critical issues only
- Accept medium/low priority issues as-is
- Continue to specs-implement workflow

Option B: Fix Issues First
- Address critical and high priority issues
- Re-validate after fixes
- Then proceed to implementation

Option C: Comprehensive Refinement
- Address all issues (P0, P1, P2)
- Re-validate after fixes
- Then proceed to implementation

Option D: Return to Specs-Create
- Specs need major rework
- Start over with specs-create workflow

Option E: Custom Approach
- Specify which issues to address
- Define custom action plan

Please select Option A, B, C, D, or E:
```

**Issue-by-Issue Decisions:**
For each issue, gather user input:
- Should this issue be fixed?
- How should it be fixed (accept recommendation or alternative)?
- Priority adjustment (if any)?
- Defer to later phase?

**Clarification Requests:**
- Ask for clarification on ambiguous requirements
- Confirm technology choices if issues found
- Validate architectural decisions if questioned
- Confirm acceptance criteria if unclear

**Feedback Format:**
```
=== User Decisions ===

Overall Approach: [Option A/B/C/D/E]

Issue Decisions:
- [Issue ID]: [Fix/Defer/Accept] - [Notes]
- [Issue ID]: [Fix/Defer/Accept] - [Notes]
...

Additional Requirements:
- [Any additional user requirements]
- [Any constraints or preferences]
- [Any timeline considerations]

Custom Instructions:
- [Any specific instructions for implementation]
```

**Confirmation:**
- Confirm understanding of user decisions
- Summarize action plan based on decisions
- Verify timeline and resource implications
- Get final approval to proceed

### 12. Implement Approved Changes

**Objective:** Apply user-approved changes to the specs.

**Implementation Approach:**

**Change Categories:**

**Critical Fixes (P0):**
- Must be implemented if user chose Option B, C, or E
- Focus on blocking issues
- Ensure fixes don't introduce new issues
- Validate fix effectiveness

**High Priority Fixes (P1):**
- Implement if user chose Option B, C, or E
- Address significant risks
- Ensure implementation feasibility
- Document rationale for changes

**Medium Priority Fixes (P2):**
- Implement if user chose Option C or E
- Improve spec quality
- Address gaps and ambiguities
- Enhance completeness

**Low Priority Fixes (P3):**
- Implement only if user specifically requested (Option E)
- Cosmetic improvements
- Documentation enhancements
- Nice-to-have additions

**Implementation Process:**

**For Each Approved Change:**
1. Identify the spec file(s) to modify
2. Locate the specific section requiring change
3. Apply the fix or improvement
4. Ensure consistency across related sections
5. Update dependencies if affected
6. Verify change doesn't break other parts

**Change Types:**

**Additions:**
- Add missing requirements
- Add missing success criteria
- Add missing technical details
- Add missing edge cases

**Modifications:**
- Clarify ambiguous language
- Correct technical inaccuracies
- Adjust task sequencing
- Update dependencies

**Deletions:**
- Remove redundant information
- Remove conflicting requirements
- Remove out-of-scope items

**Reorganizations:**
- Reorder tasks for better flow
- Restructure phase boundaries
- Reorganize sections for clarity

**Validation During Implementation:**
- After each change, verify:
  - Change addresses the identified issue
  - No new issues introduced
  - Consistency maintained
  - Dependencies still valid

**Implementation Tracking:**
```
=== Change Implementation Log ===

[Issue ID] - [Issue Description]
- Status: [Implemented/Skipped/Deferred]
- Files Modified: [list files]
- Changes Made: [description]
- Validation: [Passed/Failed]
- Notes: [any notes]

[Issue ID] - [Issue Description]
- Status: [Implemented/Skipped/Deferred]
...
```

**Batch Implementation:**
- Group related changes together
- Implement changes in logical order
- Validate after each batch
- Maintain change log

**User Communication:**
- Inform user of progress
- Highlight any unexpected issues
- Ask for clarification if needed
- Confirm completion of changes

**If User Chose Option D (Return to Specs-Create):**
- Do not implement changes
- Recommend returning to specs-create workflow
- Provide summary of why major rework is needed
- Offer guidance for next specs-create run

**If User Chose Option A (Proceed to Implementation):**
- Document accepted issues as known limitations
- Create implementation notes
- Proceed to specs-implement workflow
- Carry forward known issues to implementation phase

## Continue to Part 5

For Steps 13-14 (Finalization Phase), see `~/.codeium/windsurf/docs/specs-references/specs-validate-finalization.md`.
