---
description: Guidelines and best practices for the validate-specs workflow
---

# Spec Validation Workflow - Guidelines and Best Practices

This document provides guidelines and best practices for conducting effective spec validation.

## Validation Principles

### 1. Comprehensive Coverage
- Review all aspects of the specs
- Don't skip phases or sections
- Consider multiple perspectives
- Look for both obvious and subtle issues

### 2. Constructive Feedback
- Focus on improvement, not criticism
- Provide actionable recommendations
- Explain the "why" behind issues
- Offer specific solutions

### 3. Context Awareness
- Understand project goals and constraints
- Consider technology stack limitations
- Account for team expertise
- Respect timeline and resource constraints

### 4. Balance
- Balance thoroughness with efficiency
- Balance idealism with pragmatism
- Balance detail with clarity
- Balance criticism with encouragement

## Subagent Review Guidelines

### Subagent 1: Technical & Architecture Review

**Focus Areas:**
- Technology choices and compatibility
- Architectural patterns and decisions
- System design and component interaction
- Performance and scalability
- Security and compliance

**Best Practices:**
- Consider industry best practices
- Evaluate technology fit for purpose
- Assess long-term maintainability
- Check for anti-patterns
- Consider future extensibility

**Common Issues to Look For:**
- Incompatible technology versions
- Missing security considerations
- Poor separation of concerns
- Scalability bottlenecks
- Inconsistent architectural patterns

**When to Escalate:**
- Fundamental architectural flaws
- Security vulnerabilities
- Technology incompatibilities
- Performance that cannot meet requirements

---

### Subagent 2: Implementation Feasibility Review

**Focus Areas:**
- Task breakdown and sequencing
- Dependency management
- Time and resource estimates
- Implementation clarity
- Risk assessment

**Best Practices:**
- Think like an implementer
- Consider real-world constraints
- Account for testing and debugging time
- Identify hidden complexity
- Assess team capability requirements

**Common Issues to Look For:**
- Overly optimistic time estimates
- Missing dependencies
- Vague task descriptions
- Impossible sequencing
- Underestimated complexity

**When to Escalate:**
- Implementation appears impossible
- Estimates are unrealistic by factor of 2+
- Critical dependencies are missing
- High-risk tasks lack mitigation

---

### Subagent 3: Completeness & Gaps Review

**Focus Areas:**
- Requirements coverage
- Edge case handling
- Ambiguity detection
- Success criteria validation
- Integration completeness

**Best Practices:**
- Think like a tester
- Consider user workflows
- Look for what's missing
- Question assumptions
- Validate end-to-end scenarios

**Common Issues to Look For:**
- Missing error handling
- Undefined edge cases
- Ambiguous requirements
- Incomplete success criteria
- Missing integration points

**When to Escalate:**
- Critical requirements missing
- Major functionality gaps
- No error handling strategy
- Success criteria undefined

## Issue Prioritization Guidelines

### P0 - Critical (Must Fix Before Implementation)

**Definition:**
Issues that will prevent successful implementation or cause significant problems if not addressed.

**Examples:**
- Security vulnerabilities
- Architectural impossibilities
- Missing critical requirements
- Circular dependencies
- Technology incompatibilities

**Action:**
Must be fixed before proceeding to implementation.

---

### P1 - High (Should Fix Before Implementation)

**Definition:**
Issues that will likely cause significant problems, delays, or rework during implementation.

**Examples:**
- Major gaps in specifications
- High-risk dependencies
- Performance concerns
- Important missing edge cases
- Unrealistic estimates

**Action:**
Should be fixed before implementation, but can proceed with documented risk if user insists.

---

### P2 - Medium (Recommended to Fix)

**Definition:**
Issues that may cause minor problems or inefficiencies but won't block implementation.

**Examples:**
- Minor inconsistencies
- Clarification needed on ambiguous specs
- Small gaps in coverage
- Optimization opportunities
- Nice-to-have improvements

**Action:**
Recommended to fix, but can proceed to implementation and address later.

---

### P3 - Low (Optional)

**Definition:**
Issues that are cosmetic, minor, or represent ideal improvements.

**Examples:**
- Cosmetic issues
- Minor documentation improvements
- Nice-to-have features
- Low-risk optimizations
- Style preferences

**Action:**
Optional - fix only if time permits or user specifically requests.

## Health Score Calculation

### Phase Health Score

**Formula:**
```
Phase Health = 100 - (Critical * 25) - (High * 15) - (Medium * 5) - (Low * 1)
```

**Example:**
- 1 Critical issue: 100 - 25 = 75%
- 2 High issues: 75 - 30 = 45%
- 3 Medium issues: 45 - 15 = 30%
- 5 Low issues: 30 - 5 = 25%

**Interpretation:**
- 90-100%: Healthy
- 70-89%: Needs attention
- 50-69%: Significant issues
- <50%: Critical state

---

### Overall Health Score

**Formula:**
```
Overall Health = Weighted average of phase health scores
Weights based on phase complexity and dependency count
```

**Simplified Approach:**
```
Overall Health = Average of all phase health scores
```

**Interpretation:**
- 90-100%: Ready for implementation
- 70-89%: Ready with conditions
- 50-69%: Needs work before implementation
- <50%: Not ready, return to create-specs

## Readiness Assessment Criteria

### Ready for Implementation

**Criteria:**
- Overall health score ≥ 80%
- No P0 (critical) issues
- P1 (high) issues ≤ 2
- Completeness ≥ 85%
- Dependencies validated

**Action:**
Proceed to implement-specs workflow.

---

### Ready with Conditions

**Criteria:**
- Overall health score 70-79%
- No P0 (critical) issues
- P1 (high) issues 3-5
- Completeness 75-84%
- Dependencies validated

**Action:**
Proceed with documented conditions and known limitations.

---

### Needs Work

**Criteria:**
- Overall health score 50-69%
- P0 (critical) issues = 0
- P1 (high) issues > 5
- Completeness 60-74%

**Action:**
Address issues before implementation, then re-validate.

---

### Not Ready

**Criteria:**
- Overall health score < 50%
- P0 (critical) issues > 0
- Completeness < 60%
- Unresolvable dependencies

**Action:**
Return to create-specs workflow for major rework.

## Communication Guidelines

### Presenting Findings

**Do:**
- Start with executive summary
- Use clear, non-technical language when possible
- Provide context for issues
- Offer specific, actionable recommendations
- Highlight positive findings as well as issues

**Don't:**
- Overwhelm with too much detail upfront
- Use jargon without explanation
- Present issues without solutions
- Be overly critical or negative
- Ignore the user's constraints

---

### Gathering User Feedback

**Do:**
- Present clear options
- Explain implications of each option
- Allow user to make informed decisions
- Respect user's priorities and constraints
- Offer guidance without being prescriptive

**Don't:**
- Make decisions for the user
- Pressure user toward specific options
- Ignore user's concerns
- Dismiss user's constraints
- Be inflexible

---

### Implementing Changes

**Do:**
- Confirm understanding before implementing
- Implement changes in logical order
- Validate after each change
- Communicate progress clearly
- Ask for clarification when needed

**Don't:**
- Make assumptions about user intent
- Implement without confirmation
- Batch too many changes together
- Skip validation
- Ignore user feedback during implementation

## Common Pitfalls

### 1. Over-Engineering
**Problem:** Identifying too many minor issues or suggesting over-complex solutions.

**Solution:** Focus on issues that matter. Prioritize impact over perfection.

---

### 2. Under-Reviewing
**Problem:** Rushing through validation and missing important issues.

**Solution:** Allocate sufficient time. Use checklists to ensure comprehensive coverage.

---

### 3. Context Ignorance
**Problem:** Making recommendations without understanding project constraints.

**Solution:** Always consider project goals, timeline, resources, and team expertise.

---

### 4. Inconsistent Standards
**Problem:** Applying different validation criteria across phases or subagents.

**Solution:** Use consistent checklists and scoring methods. Calibrate across subagents.

---

### 5. Solution Bias
**Problem:** Pushing specific solutions rather than identifying problems.

**Solution:** Focus on identifying issues first. Offer solutions as recommendations, not mandates.

## Best Practices by Phase

### Initial Assessment
- Thoroughly review repository structure
- Validate spec structure before detailed review
- Establish baseline completeness metrics
- Document initial state clearly

---

### Multi-Perspective Review
- Execute subagent reviews independently
- Apply consistent criteria across subagents
- Document findings with specific evidence
- Use standard output formats

---

### Synthesis
- Correlate findings across subagents
- Identify overlapping and conflicting issues
- Prioritize based on impact and urgency
- Generate clear, actionable report

---

### User Interaction
- Present findings in user-friendly format
- Offer clear options with implications
- Listen to user's perspective and constraints
- Implement changes precisely as approved

---

### Finalization
- Re-validate only what changed
- Compare before/after states
- Document all changes made
- Provide clear next steps

## Quality Assurance

### Self-Validation
Before presenting findings to user:
- [ ] All spec files reviewed
- [ ] All subagent reviews completed
- [ ] Findings correlated and prioritized
- [ ] Report is clear and complete
- [ ] Recommendations are actionable

### Accuracy Checks
- [ ] Issue descriptions are accurate
- [ ] Recommendations address the issues
- [ ] Prioritization is justified
- [ ] Phase assignments are correct
- [ ] No false positives or negatives

### Completeness Checks
- [ ] All spec sections reviewed
- [ ] All phases evaluated
- [ ] All dependency paths checked
- [ ] All subagent perspectives applied
- [ ] All findings documented

## Continuous Improvement

### Learning from Validation
- Track common issues across projects
- Identify patterns in spec problems
- Refine checklists based on findings
- Update guidelines based on lessons learned

### Feedback Loop
- Solicit feedback from users
- Track which recommendations are implemented
- Measure validation effectiveness
- Adjust process based on results

### Process Evolution
- Regularly review and update guidelines
- Incorporate new best practices
- Adapt to different project types
- Maintain flexibility while ensuring consistency
