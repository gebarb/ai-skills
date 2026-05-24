---
description: Validate specs through comprehensive multi-perspective review - Part 2: Multi-Perspective Review Phase (Steps 4-6)
---

# Spec Validation Workflow - Part 2: Multi-Perspective Review Phase

This is Part 2 of the validate-specs workflow, covering Steps 4-6: Three subagent reviews (Technical/Architecture, Implementation Feasibility, Completeness/Gaps).

For the complete workflow, see:
- Initial Assessment: `docs/specs-references/validate-specs-initial.md` (Steps 1-3)
- Multi-Perspective Review: This file (Steps 4-6)
- Synthesis: `docs/specs-references/validate-specs-synthesis.md` (Steps 7-9)
- User Interaction: `docs/specs-references/validate-specs-interaction.md` (Steps 10-12)
- Finalization: `docs/specs-references/validate-specs-finalization.md` (Steps 13-14)

## Usage

Run this workflow from the root of your repository:

```
/validate-specs
```

## Workflow Steps

### 4. Subagent 1: Technical & Architecture Review

**Perspective:** Focus on technical soundness, architectural decisions, and technology choices.

**Review Scope:**

**Technology Stack Analysis:**
- [ ] Technology choices are appropriate for project requirements
- [ ] Framework versions are compatible and current
- [ ] Technology combinations are well-integrated
- [ ] No conflicting or redundant technologies
- [ ] Security considerations are addressed
- [ ] Performance implications are considered

**Architecture Review:**
- [ ] Architectural patterns are appropriate (e.g., MVC, microservices, monolithic)
- [ ] Component boundaries are clear and logical
- [ ] Data flow is well-defined
- [ ] State management strategy is appropriate
- [ ] Scalability considerations are addressed
- [ ] Error handling strategy is defined

**Technical Consistency Check:**
- [ ] Terminology is consistent across phases
- [ ] Technical decisions don't conflict between phases
- [ ] Data models are consistent
- [ ] API contracts are coherent
- [ ] Integration points are well-defined

**Performance & Scalability:**
- [ ] Performance requirements are defined
- [ ] Scalability considerations are documented
- [ ] Resource constraints are identified
- [ ] Caching strategies are considered (if applicable)
- [ ] Database indexing strategies are defined (if applicable)

**Security Analysis:**
- [ ] Authentication/authorization is defined (if applicable)
- [ ] Data encryption requirements are specified
- [ ] Input validation is addressed
- [ ] Security best practices are followed
- [ ] Compliance requirements are noted (if applicable)

**Review Output Format:**
```
=== Subagent 1: Technical & Architecture Review ===

Overall Assessment: [PASS/NEEDS IMPROVEMENT/FAIL]

Technology Stack:
- Issues: [list issues]
- Recommendations: [list recommendations]

Architecture:
- Issues: [list issues]
- Recommendations: [list recommendations]

Technical Consistency:
- Issues: [list issues]
- Recommendations: [list recommendations]

Performance & Scalability:
- Issues: [list issues]
- Recommendations: [list recommendations]

Security:
- Issues: [list issues]
- Recommendations: [list recommendations]

Critical Issues:
- [Critical issue 1]
- [Critical issue 2]
...

Phase-Specific Findings:
Phase 1: [summary]
Phase 2: [summary]
...
```

### 5. Subagent 2: Implementation Feasibility Review

**Perspective:** Focus on practical implementation, task breakdown, and execution feasibility.

**Review Scope:**

**Task Breakdown Analysis:**
- [ ] Tasks are appropriately granular
- [ ] Tasks are actionable and specific
- [ ] Task sequencing is logical
- [ ] Task dependencies are clear and valid
- [ ] No missing critical tasks
- [ ] No redundant or overlapping tasks

**Dependency Analysis:**
- [ ] Dependencies are accurate and complete
- [ ] Dependency ordering is correct
- [ ] No circular dependencies
- [ ] External dependencies are identified
- [ ] Dependency risks are assessed

**Time & Resource Estimates:**
- [ ] Time estimates are realistic
- [ ] Resource requirements are identified
- [ ] Complexity is accurately assessed
- [ ] Buffer time is included for unknowns
- [ ] Parallelization opportunities are identified

**Implementation Clarity:**
- [ ] Implementation approach is clear
- [ ] Technical requirements are specific
- [ ] Acceptance criteria are measurable
- [ ] Success criteria are achievable
- [ ] Testing requirements are defined

**Risk Assessment:**
- [ ] High-risk tasks are identified
- [ ] Risk mitigation strategies are proposed
- [ ] Alternative approaches are considered
- [ ] Blocker risks are highlighted
- [ ] Contingency plans are suggested

**Review Output Format:**
```
=== Subagent 2: Implementation Feasibility Review ===

Overall Assessment: [PASS/NEEDS IMPROVEMENT/FAIL]

Task Breakdown:
- Issues: [list issues]
- Recommendations: [list recommendations]

Dependencies:
- Issues: [list issues]
- Recommendations: [list recommendations]

Time & Resource Estimates:
- Issues: [list issues]
- Recommendations: [list recommendations]

Implementation Clarity:
- Issues: [list issues]
- Recommendations: [list recommendations]

Risk Assessment:
- High Risks: [list high risks]
- Medium Risks: [list medium risks]
- Mitigation Strategies: [list strategies]

Critical Issues:
- [Critical issue 1]
- [Critical issue 2]
...

Phase-Specific Findings:
Phase 1: [summary]
Phase 2: [summary]
...
```

### 6. Subagent 3: Completeness & Gaps Review

**Perspective:** Focus on coverage, edge cases, and specification completeness.

**Review Scope:**

**Requirements Coverage:**
- [ ] All user requirements are addressed
- [ ] Functional requirements are complete
- [ ] Non-functional requirements are specified
- [ ] Business rules are documented
- [ ] User stories are covered

**Edge Case Analysis:**
- [ ] Error scenarios are considered
- [ ] Boundary conditions are defined
- [ ] Empty/null states are handled
- [ ] Invalid input handling is specified
- [ ] Concurrency issues are addressed (if applicable)

**Ambiguity Detection:**
- [ ] Vague or ambiguous language is identified
- [ ] Undefined terms are noted
- [ ] Subjective criteria are flagged
- [ ] Missing context is highlighted
- [ ] Assumptions are made explicit

**Success Criteria Validation:**
- [ ] Success criteria are specific and measurable
- [ ] Acceptance criteria are clear
- [ ] Testing criteria are defined
- [ ] Verification methods are specified
- [ ] Completion criteria are unambiguous

**Integration & Compatibility:**
- [ ] Integration points are defined
- [ ] API contracts are complete
- [ ] Data migration is considered (if applicable)
- [ ] Backward compatibility is addressed (if applicable)
- [ ] Third-party integrations are specified

**Review Output Format:**
```
=== Subagent 3: Completeness & Gaps Review ===

Overall Assessment: [PASS/NEEDS IMPROVEMENT/FAIL]

Requirements Coverage:
- Gaps: [list gaps]
- Recommendations: [list recommendations]

Edge Case Analysis:
- Missing Edge Cases: [list missing cases]
- Recommendations: [list recommendations]

Ambiguity Detection:
- Ambiguous Specifications: [list ambiguities]
- Clarifications Needed: [list clarifications]

Success Criteria:
- Issues: [list issues]
- Recommendations: [list recommendations]

Integration & Compatibility:
- Gaps: [list gaps]
- Recommendations: [list recommendations]

Critical Gaps:
- [Critical gap 1]
- [Critical gap 2]
...

Phase-Specific Findings:
Phase 1: [summary]
Phase 2: [summary]
...
```

## Subagent Coordination

**Execution Order:**
1. Execute Subagent 1 (Technical & Architecture)
2. Execute Subagent 2 (Implementation Feasibility)
3. Execute Subagent 3 (Completeness & Gaps)

**Note on Subagent Implementation:**
The "subagents" in this workflow are conceptual perspectives applied sequentially by the main agent, not actual parallel processes. The main agent applies each perspective independently, documents findings from that viewpoint, then moves to the next perspective. This ensures comprehensive coverage from different analytical angles without requiring actual parallel execution.

**Independent Analysis:**
Each subagent perspective should:
- Review specs independently from other perspectives
- Apply their specific analytical viewpoint
- Document findings without consulting other perspectives
- Use consistent output format

**Cross-Reference:**
After all subagents complete:
- Identify overlapping findings
- Note conflicting recommendations
- Correlate issues across perspectives
- Prepare for synthesis phase

## Continue to Part 3

For Steps 7-9 (Synthesis Phase), see `docs/specs-references/validate-specs-synthesis.md`.
