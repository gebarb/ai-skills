# Skill Review - Guidelines

This document provides comprehensive guidelines for conducting effective skill/workflow reviews.

## Path Resolution Pattern

**Critical**: All skills and workflows MUST use the `{{DOCS_DIR}}` placeholder pattern for referencing their **internal reference documentation files**. This ensures compatibility across different AI agents and execution contexts.

### When to Use {{DOCS_DIR}}

Use `{{DOCS_DIR}}` ONLY for:
- **Internal reference docs**: Documentation files that belong to the skill/workflow itself (e.g., `{{DOCS_DIR}}/skill-name/guidelines.md`)
- **Cascade-skills repository docs**: Reference materials that are part of this repository's documentation structure
- **Skill's own supporting files**: Documentation files that are bundled with the skill/workflow

### When NOT to Use {{DOCS_DIR}}

DO NOT use `{{DOCS_DIR}}` for:
- **External URLs**: Keep URLs as-is (e.g., `https://example.com/docs`)
- **User-provided files**: Keep user file paths as provided (e.g., `/path/to/user/file.md`)
- **Absolute paths to external resources**: Keep external absolute paths unchanged
- **Files from prompts**: Keep file references from user prompts unchanged
- **System paths**: Keep system-specific paths unchanged

### Path Format

When referencing internal documentation files from a workflow or skill:
- Use: `{{DOCS_DIR}}/skill-name/file-name.md`
- Example: `{{DOCS_DIR}}/skill-review/guidelines.md`
- Example: `{{DOCS_DIR}}/specs-create/planning.md`

### Why This Pattern Matters

- AI agents execute workflows from the user's repository root, not from the workflows directory
- Relative paths (e.g., `../docs/`) would resolve incorrectly
- Absolute paths are agent-specific and not portable
- The `{{DOCS_DIR}}` placeholder is replaced at install time with the correct absolute path for the selected agent
- Ensures internal doc references work regardless of execution context

### Enforcement

- All workflow files MUST use `{{DOCS_DIR}}` for **internal doc references only**
- All doc files that reference **other internal docs** MUST use `{{DOCS_DIR}}`
- The install.sh script automatically replaces placeholders during installation
- Skills reviewed using this workflow MUST follow this pattern for internal docs
- Reviewers MUST verify that skills/workflows use the correct path pattern for internal docs
- External references, URLs, and user-provided paths MUST remain unchanged

## Review Philosophy

### Fresh Context Principle

Each review should approach the skill/workflow with fresh context:
- Read as if encountering for the first time
- Don't rely on previous knowledge
- Simulate real user experience
- Identify implicit assumptions

**Why fresh context matters**:
- Removes bias from creation process
- Identifies gaps creators overlook
- Uncovers hidden assumptions
- Provides objective assessment

### Multi-Perspective Approach

Apply three distinct analytical perspectives:
1. **Standards & Best Practices**: Compliance and adherence to guidelines
2. **Execution & Structure**: How it works and structural integrity
3. **Completeness & Gaps**: Whether requirements are met and gaps exist

**Why multiple perspectives**:
- Each perspective catches different issues
- Comprehensive coverage of quality dimensions
- Reduces blind spots
- Provides balanced assessment

### Iterative Review

Run reviews multiple times (3+ recommended):
- Each run provides fresh context
- Different issues surface in different runs
- Enables continuous improvement
- Builds quality over iterations

**Why iterative review**:
- First run catches major issues
- Second run catches execution issues
- Third run catches subtle issues
- Further runs polish and optimize

## Review Process Guidelines

### Preparation

**Before reviewing**:
- Ensure you have time for thorough review
- Understand the review framework
- Have access to all files
- Prepare to take detailed notes

**Setting up**:
- Create a clean workspace
- Open all relevant files
- Prepare note-taking template
- Set aside distractions

### Conducting the Review

**Pacing**:
- Take time to understand thoroughly
- Don't rush through steps
- Pause when uncertain
- Document questions as they arise

**Note-taking**:
- Record specific issues with evidence
- Note exact locations (file, line, section)
- Capture quotes for clarity
- Suggest specific fixes

**Depth**:
- Go beyond surface-level checks
- Understand why something is an issue
- Consider impact and severity
- Think about user experience

### After the Review

**Synthesis**:
- Correlate findings across perspectives
- Identify root causes
- Prioritize issues appropriately
- Generate actionable report

**Communication**:
- Present findings clearly
- Balance issues with strengths
- Provide specific recommendations
- Enable informed decisions

## Perspective-Specific Guidelines

### Standards & Best Practices Review

**Focus areas**:
- Windsurf specifications compliance
- Anthropic guidelines compliance
- Industry best practices
- Project-specific standards

**Review approach**:
- Use checklists systematically
- Verify each requirement
- Document specific violations
- Reference standard/guideline

**Common issues to look for**:
- Missing or incorrect YAML frontmatter
- Poor progressive disclosure
- File structure violations
- Naming convention violations
- Documentation gaps

### Execution & Structure Review

**Focus areas**:
- Step-by-step execution flow
- Instruction clarity
- Error handling
- Edge case coverage

**Review approach**:
- Walk through execution mentally
- Test with fresh context
- Identify bottlenecks
- Check for ambiguities

**Common issues to look for**:
- Missing steps
- Unclear instructions
- Missing error handling
- Poor step sequencing
- Undefined variables

### Completeness & Gaps Review

**Focus areas**:
- Requirements coverage
- Context completeness
- Goal achievement
- Success criteria

**Review approach**:
- Compare against stated goals
- Identify missing elements
- Check for gaps in coverage
- Validate completeness

**Common issues to look for**:
- Missing functionality
- Incomplete documentation
- Missing prerequisites
- Undefined success criteria
- Context gaps

## Issue Identification Guidelines

### Issue Documentation

For each issue, document:
- **Title**: Clear, descriptive title
- **Severity**: Critical/High/Medium/Low
- **Location**: Exact location in skill/workflow
- **Problem**: Clear description of the problem
- **Impact**: What this affects and why it matters
- **Evidence**: Specific evidence (quotes, examples)
- **Recommended Fix**: Specific, actionable fix
- **Example**: Before/after example if applicable

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

**Low** (Polish):
- Formatting improvements
- Minor wording tweaks
- Additional examples
- Enhanced documentation
- Nice-to-have features

### Evidence Collection

Collect specific evidence:
- **Quotes**: Exact text from skill/workflow
- **Examples**: Specific scenarios where issue occurs
- **Test results**: Results of testing the issue
- **References**: Link to relevant standards or guidelines

## Prioritization Guidelines

### Prioritization Framework

Use a systematic approach:
```
Priority = Severity × Impact × Frequency
```

**Severity**: Critical=4, High=3, Medium=2, Low=1
**Impact**: Affects many=3, Affects some=2, Affects few=1
**Frequency**: Always=3, Often=2, Rarely=1

**Priority Levels**:
- 12-36: Critical priority
- 8-11: High priority
- 4-7: Medium priority
- 1-3: Low priority

### Prioritization Considerations

**User impact**:
- How many users affected?
- How severely affected?
- How often encountered?

**Fix effort**:
- How difficult to fix?
- How long to fix?
- What resources needed?

**Risk of not fixing**:
- What happens if not fixed?
- What are the consequences?
- Is it acceptable to defer?

## Communication Guidelines

### Report Presentation

**Clear structure**:
- Executive summary first
- Critical issues prominent
- Prioritized presentation
- Balanced with strengths

**Actionable recommendations**:
- Specific fixes suggested
- Implementation guidance provided
- Options presented
- Trade-offs explained

**Constructive tone**:
- Professional and objective
- Balanced feedback
- Focus on improvement
- Enable informed decisions

### User Interaction

**Gather feedback**:
- Present options clearly
- Explain trade-offs
- Recommend approach
- Respect user decisions

**Implement changes**:
- Follow user decisions
- Implement approved changes
- Verify fixes work
- Document changes

## Quality Assurance Guidelines

### Review Quality

**Before presenting report**:
- Verify all findings documented
- Check prioritization is sound
- Ensure recommendations are actionable
- Validate report is complete

**Self-check questions**:
- Is this report clear?
- Are recommendations specific?
- Is prioritization justified?
- Is tone constructive?

### Consistency

**Across reviews**:
- Use consistent severity definitions
- Use consistent prioritization
- Use consistent documentation format
- Use consistent terminology

**Within review**:
- Apply criteria consistently
- Document consistently
- Prioritize consistently
- Communicate consistently

## Iteration Guidelines

### Multiple Reviews

**Why multiple reviews**:
- Fresh context each time
- Different issues surface
- Continuous improvement
- Quality builds over time

**Review strategy**:
- **First run**: Focus on major structural issues, standards compliance, obvious gaps
- **Second run**: Focus on execution flow, clarity, edge cases
- **Third+ runs**: Focus on optimization, polish, subtle improvements

### Review Frequency

**When to review**:
- After initial creation
- After significant changes
- After user feedback
- On regular schedule (e.g., quarterly)

**Review depth**:
- Full review for major changes
- Focused review for minor changes
- Quick review for documentation updates
- Comprehensive review periodically

## Best Practices

### Do's

- **Do** approach with fresh context each time
- **Do** document specific evidence for each issue
- **Do** provide actionable recommendations
- **Do** balance issues with strengths
- **Do** prioritize issues systematically
- **Do** communicate clearly and constructively
- **Do** respect user decisions
- **Do** iterate multiple times

### Don'ts

- **Don't** rely on previous review context
- **Don't** make vague or general complaints
- **Don't skip documenting evidence
- **Don't ignore strengths
- **Don't prioritize arbitrarily
- **Don't be overly critical
- **Don't override user decisions
- **Don't stop after one review

### Common Pitfalls

**Pitfall**: Reviewing with bias from creation
- **Solution**: Always approach with fresh context

**Pitfall**: Making vague recommendations
- **Solution**: Always provide specific, actionable fixes

**Pitfall**: Focusing only on problems
- **Solution**: Always balance with strengths

**Pitfall**: Arbitrary prioritization
- **Solution**: Use systematic prioritization framework

**Pitfall**: Single review and done
- **Solution**: Plan for multiple iterations

## Review Ethics

### Objectivity

- Maintain professional objectivity
- Avoid personal biases
- Base findings on evidence
- Acknowledge limitations

### Constructiveness

- Focus on improvement
- Provide helpful feedback
- Enable informed decisions
- Support skill/workflow quality

### Respect

- Respect creator's work
- Respect user's decisions
- Respect time and effort
- Provide value

### Transparency

- Be clear about methodology
- Document review process
- Explain reasoning
- Acknowledge uncertainties
