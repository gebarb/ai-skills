# Skill Review - Multi-Perspective Review Phase

This document provides detailed guidance for Steps 4-6 of the skill-review workflow, which apply three distinct analytical perspectives sequentially.

## Overview of Three-Perspective Approach

The three perspectives are applied sequentially as conceptual subagents, each with fresh context and a specific analytical focus:

1. **Standards & Best Practices Review**: Focus on compliance with current standards retrieved in Step 0 from all available sources
2. **Execution & Structure Review**: Focus on how the skill/workflow executes and its structural integrity
3. **Completeness & Gaps Review**: Focus on whether all requirements are met and gaps are identified

Each perspective reviews the skill/workflow independently, then findings are synthesized in the next phase.

## Subagent 1: Standards & Best Practices Review

### Review Focus

This perspective evaluates compliance with current standards retrieved in Step 0 from all available external sources:
- AI agent skill/workflow standards from any platform
- Platform-specific guidelines when applicable
- Industry best practices
- Project-specific standards
- Apply the most current standards found, regardless of source

### Platform Standards Checklist

**Note**: Use the current standards retrieved in Step 0. The following provides a general framework that should be adapted based on the specific standards found during live research.

**General Standards Framework**:
- [ ] Contains required `name` field
- [ ] Contains required `description` field
- [ ] Description is 1-2 sentences maximum
- [ ] Description is clear and specific
- [ ] Name follows kebab-case convention (lowercase with hyphens)
- [ ] No special characters in name
- [ ] Name is descriptive but concise

**Progressive Disclosure** (Skills only):
- [ ] Name and description are concise (Level 1)
- [ ] Core SKILL.md is focused and not overwhelming (Level 2)
- [ ] SKILL.md is under 300 lines (recommended, unless current standards specify otherwise)
- [ ] Supporting files are referenced appropriately (Level 3)
- [ ] File references use clear section headers
- [ ] Rarely used context is separated (Level 4)
- [ ] Information loads only as needed

**File Structure**:
- [ ] Directory structure follows conventions
- [ ] File names are descriptive and consistent
- [ ] Supporting files are properly organized
- [ ] File permissions are correct (644 for files, 755 for executable scripts)
- [ ] No temporary or test files in distribution

**Skill vs Workflow Appropriateness**:
- [ ] If skill: appropriate for automatic invocation
- [ ] If workflow: appropriate for manual invocation
- [ ] Choice between skill/workflow is justified
- [ ] Structure matches the type chosen
- [ ] For hybrid approaches (combining skill and workflow characteristics): document the hybrid nature and ensure both automatic and manual invocation scenarios are supported

### Platform-Specific Standards Checklist

**Note**: If platform-specific standards were found during Step 0 research, apply those here. Otherwise, use the general framework above.

**YAML Frontmatter**:
- [ ] Contains required `name` field
- [ ] Contains required `description` field
- [ ] Description is 1-2 sentences maximum
- [ ] Description is clear and specific
- [ ] Name follows kebab-case convention (lowercase with hyphens)
- [ ] No special characters in name
- [ ] Name is descriptive but concise

**Progressive Disclosure** (Skills only):
- [ ] Name and description are concise (Level 1)
- [ ] Core SKILL.md is focused and not overwhelming (Level 2)
- [ ] SKILL.md is under 300 lines (recommended)
- [ ] Supporting files are referenced appropriately (Level 3)
- [ ] File references use clear section headers
- [ ] Rarely used context is separated (Level 4)
- [ ] Information loads only as needed

**File Structure**:
- [ ] Directory structure follows conventions
- [ ] File names are descriptive and consistent
- [ ] Supporting files are properly organized
- [ ] File permissions are correct (644 for files, 755 for executable scripts)
- [ ] No temporary or test files in distribution

**Skill vs Workflow Appropriateness**:
- [ ] If skill: appropriate for automatic invocation
- [ ] If workflow: appropriate for manual invocation
- [ ] Choice between skill/workflow is justified
- [ ] Structure matches the type chosen

### Agent Skills Guidelines Checklist

**Note**: If agent skills-specific standards were found during Step 0 research (including from agentskills.io specification or other sources), apply those here. Otherwise, use the general framework above.

**Progressive Disclosure Principles**:
- [ ] Information loads only as needed
- [ ] SKILL.md is not unwieldy
- [ ] Large content is split into separate files
- [ ] Mutually exclusive contexts are kept separate
- [ ] Code serves as both executable and documentation where appropriate
- [ ] Like a well-organized manual (table of contents → chapters → appendix)

**Content Quality**:
- [ ] Skill addresses specific capability gaps
- [ ] Content is structured for scale
- [ ] Instructions are clear from the AI agent's perspective
- [ ] Name and description enable accurate triggering
- [ ] Skill can be iterated based on usage observations

**Development Best Practices**:
- [ ] Started with evaluation (evidence of gap identification)
- [ ] Structured for scale (evidence of planning)
- [ ] Considers the AI agent's perspective (clear instructions)
- [ ] Designed for iteration (extensible structure)

### Industry Best Practices Checklist

**Documentation Standards**:
- [ ] Clear section headers
- [ ] Logical organization
- [ ] Consistent formatting
- [ ] Proper use of markdown
- [ ] Code blocks with language tags
- [ ] Descriptive link text

**Writing Quality**:
- [ ] Grammar is correct
- [ ] Spelling is correct
- [ ] Punctuation is consistent
- [ ] Capitalization follows conventions
- [ ] No typos
- [ ] Professional tone

**Accessibility**:
- [ ] Clear language
- [ ] Jargon explained or avoided
- [ ] Examples provided for complex concepts
- [ ] Consistent terminology
- [ ] Descriptive headers

### Standards Review Output

Document findings as:
```
## Standards & Best Practices Review

### Sources Consulted (from Step 0)
- List all sources consulted during Step 0 with key standards identified from each
- Example: "agentskills.io specification: progressive disclosure, description format"
- Example: "Anthropic skill-creator: kebab-case naming, <500 line limit"

### Platform Standards Compliance
- **Compliant**: [List compliant items with source citations]
- **Non-compliant**: [List issues with severity and source citations]
- **Needs Review**: [Items requiring clarification with source citations]

### Agent Skills Guidelines Compliance
- **Compliant**: [List compliant items with source citations]
- **Non-compliant**: [List issues with severity and source citations]
- **Needs Review**: [Items requiring clarification with source citations]

### Best Practices Compliance
- **Compliant**: [List compliant items with source citations]
- **Non-compliant**: [List issues with severity and source citations]
- **Needs Review**: [Items requiring clarification with source citations]

### Critical Standards Issues
[List any critical standards violations that must be fixed, with source citations]
```

**IMPORTANT: Always cite sources when documenting compliance findings**
- When stating a standard is met or violated, reference which source(s) established that standard
- Example: "Description exceeds 2 sentences (violates Anthropic skill-creator guideline)"
- Example: "Name follows kebab-case (compliant with agentskills.io and Anthropic standards)"
- This transparency helps the user understand where each requirement comes from

## Subagent 2: Execution & Structure Review

### Review Focus

This perspective evaluates:
- Step-by-step execution flow
- Clarity and unambiguity of instructions
- Potential execution bottlenecks or failures
- Missing or incomplete steps
- Error handling and edge case coverage

### Execution Flow Analysis

**Step Sequencing**:
- [ ] Steps are in logical order
- [ ] Dependencies between steps are clear
- [ ] No circular dependencies
- [ ] Each step has clear starting point
- [ ] Each step has clear ending point
- [ ] Transitions between steps are smooth

**Actionability**:
- [ ] Each step specifies exactly what to do
- [ ] Commands are complete and accurate
- [ ] File paths are correct and complete
- [ ] Required inputs are specified
- [ ] No undefined variables or placeholders
- [ ] No ambiguous instructions

**Validation Points**:
- [ ] Each step has validation method
- [ ] Success criteria are defined
- [ ] Failure modes are identified
- [ ] Next steps are clear after validation
- [ ] Validation is achievable

### Structure Analysis

**Content Organization**:
- [ ] Document has logical flow
- [ ] Sections are in sensible order
- [ ] Related content is grouped
- [ ] No redundant content
- [ ] Clear hierarchy (H1, H2, H3)

**Instruction Clarity**:
- [ ] Language is specific and unambiguous
- [ ] Steps are actionable and concrete
- [ ] No vague quantifiers (some, many, few)
- [ ] All pronouns have clear antecedents
- [ ] Technical terms are defined or explained

**Completeness of Steps**:
- [ ] All necessary steps are included
- [ ] No critical steps are missing
- [ ] No intermediate steps are missing
- [ ] Step dependencies are satisfied
- [ ] Each step is sufficiently detailed

### Error Handling Analysis

**Error Anticipation**:
- [ ] Common errors are anticipated
- [ ] Error messages are clear
- [ ] Recovery procedures are provided
- [ ] Failure modes are documented
- [ ] Error handling is practical

**Edge Case Coverage**:
- [ ] Edge cases are identified
- [ ] Edge cases are handled
- [ ] Edge cases are documented
- [ ] Edge case handling is tested
- [ ] No unhandled edge cases

**Error Handling Structure**:
- [ ] Each step has "if this fails" section
- [ ] Common issues are documented
- [ ] Troubleshooting guide exists
- [ ] Error conditions are specific
- [ ] Solutions are actionable

### Execution Review Output

Document findings as:
```
## Execution & Structure Review

### Execution Flow
- **Strengths**: [What works well]
- **Issues**: [Execution flow problems with severity]
- **Recommendations**: [How to improve flow]

### Instruction Clarity
- **Strengths**: [Clear instructions]
- **Ambiguities**: [Unclear instructions with examples]
- **Recommendations**: [How to improve clarity]

### Error Handling
- **Strengths**: [Good error handling]
- **Gaps**: [Missing error handling with scenarios]
- **Recommendations**: [How to improve error handling]

### Critical Execution Issues
[List any critical execution problems that must be fixed]
```

## Subagent 3: Completeness & Gaps Review

### Review Focus

This perspective evaluates:
- Whether all requirements are addressed
- Missing context or supporting materials
- Ambiguous specifications
- Success criteria and acceptance criteria
- Whether the skill/workflow achieves its stated goals

### Requirements Coverage

**Functional Requirements**:
- [ ] All stated functionality is covered
- [ ] All use cases are addressed
- [ ] All inputs are specified
- [ ] All outputs are defined
- [ ] All features described are implemented

**Non-Functional Requirements**:
- [ ] Performance characteristics addressed
- [ ] Security considerations included
- [ ] Compatibility requirements specified
- [ ] Resource requirements documented

**Context Requirements**:
- [ ] All necessary information is provided
- [ ] All required files are listed
- [ ] All required state is described
- [ ] All dependencies are identified

### Gap Analysis

**Missing Content**:
- [ ] No critical information missing
- [ ] No steps missing
- [ ] No prerequisites missing
- [ ] No validation missing
- [ ] No error handling missing

**Incomplete Content**:
- [ ] No partially described steps
- [ ] No vague instructions
- [ ] No undefined terms
- [ ] No incomplete examples
- [ ] No incomplete error handling

**Context Gaps**:
- [ ] No missing reference material
- [ ] No missing templates
- [ ] No missing scripts
- [ ] No missing examples
- [ ] No missing documentation

### Goal Achievement Analysis

**Primary Goal**:
- [ ] Primary goal is achievable
- [ ] Steps lead to primary goal
- [ ] Success criteria defined for primary goal
- [ ] Primary goal is realistic

**Secondary Goals**:
- [ ] Secondary goals are achievable
- [ ] No goal conflicts
- [ ] Secondary goals support primary goal
- [ ] Success criteria defined for secondary goals

**Success Criteria**:
- [ ] Success criteria are defined
- [ ] Success criteria are measurable
- [ ] Success criteria are achievable
- [ ] Success criteria are relevant

### Completeness Review Output

Document findings as:
```
## Completeness & Gaps Review

### Requirements Coverage
- **Covered**: [Requirements that are addressed]
- **Missing**: [Requirements not addressed with severity]
- **Incomplete**: [Partially addressed requirements with severity]

### Context Gaps
- **Missing Context**: [Missing information or materials]
- **Incomplete Context**: [Incomplete information]
- **Recommendations**: [What context to add]

### Goal Achievement
- **Primary Goal**: [Assessment of achievability]
- **Secondary Goals**: [Assessment of achievability]
- **Success Criteria**: [Assessment of adequacy]

### Critical Completeness Issues
[List any critical gaps that must be addressed]
```

## Perspective Application Notes

### Fresh Context for Each Perspective

Each perspective should be applied with fresh context:
- Re-read the skill/workflow as if for the first time
- Apply the specific analytical lens
- Document findings independently
- Don't be influenced by previous perspectives

**Techniques for achieving fresh context:**
- Re-read the file from start to end before starting next perspective
- Do not refer to previous notes or findings
- For AI agents: Approach the file as if encountering it for the first time, without memory of previous analysis
- For human reviewers: Take a 5-minute break between perspectives OR clear mental context by focusing on a different task briefly
- **Measurable criteria**: Fresh context achieved when you can answer "What is this skill/workflow about?" without referring to previous notes

### Perspective Independence

Each perspective should operate independently:
- Focus only on the assigned analytical domain
- Don't cross-reference other perspectives during review
- Document findings specific to the perspective
- Let synthesis phase correlate findings

### Perspective Depth

Each perspective should go deep:
- Don't just check boxes
- Provide specific examples of issues
- Explain why something is a problem
- Suggest specific improvements

### Perspective Balance

Each perspective should be balanced:
- Note strengths as well as weaknesses
- Provide constructive feedback
- Prioritize issues by severity
- Focus on actionable recommendations

## Example Fresh Context Application

**Example: After completing Standards Review**
1. Take a 5-minute break (step away from the task)
2. Clear your mental context by focusing on something unrelated
3. Re-read SKILL.md from line 1 to end
4. Start Execution Review without looking at Standards Review findings
5. Document findings as if this is your first time reviewing the skill

**Example: After completing Execution Review**
1. Take a 5-minute break
2. Re-read SKILL.md from line 1 to end
3. Start Completeness Review without looking at previous findings
4. Document findings independently
