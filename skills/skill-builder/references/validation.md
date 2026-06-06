# Skill Builder - Validation Phase

This document provides detailed guidance for Steps 13-17 of the skill-builder workflow.

## Step 13: Self-Review Against Standards

**IMPORTANT: Cite sources when documenting compliance findings**
- When stating a standard is met or violated, reference which source(s) established that standard from Step 0
- Example: "Description exceeds 2 sentences (violates Anthropic skill-creator guideline)"
- Example: "Name follows kebab-case (compliant with agentskills.io and Anthropic standards)"
- This transparency helps you understand where each requirement comes from

### Platform Standards Checklist

**YAML Frontmatter**:
- [ ] Contains `name` field
- [ ] Contains `description` field
- [ ] Description is 1-2 sentences
- [ ] Description is clear and specific
- [ ] Name follows kebab-case convention

**Progressive Disclosure** (Skills only):
- [ ] Name and description are concise (Level 1)
- [ ] Core SKILL.md is focused and not overwhelming (Level 2)
- [ ] Supporting files are referenced appropriately (Level 3)
- [ ] Rarely used context is separated (Level 4)
- [ ] File references use clear section headers

**File Structure**:
- [ ] Directory structure follows conventions
- [ ] File names are descriptive and consistent
- [ ] Supporting files are properly organized
- [ ] File permissions are correct

### Agent Skills Guidelines Checklist

**Progressive Disclosure**:
- [ ] Information loads only as needed
- [ ] SKILL.md is not unwieldy (< 300 lines recommended)
- [ ] Large content is split into separate files
- [ ] Mutually exclusive contexts are kept separate
- [ ] Code serves as both executable and documentation where appropriate

**Content Quality**:
- [ ] Skill addresses specific capability gaps
- [ ] Content is structured for scale
- [ ] Instructions are clear from the AI agent's perspective
- [ ] Name and description enable accurate triggering
- [ ] Skill can be iterated based on usage observations

### Best Practices Checklist

**Clarity**:
- [ ] Language is specific and unambiguous
- [ ] Steps are actionable and concrete
- [ ] Jargon is explained or avoided
- [ ] Examples are provided for complex concepts

**Completeness**:
- [ ] All necessary steps are included
- [ ] Prerequisites are clearly stated
- [ ] Expected outputs are defined
- [ ] Edge cases are considered

**Consistency**:
- [ ] Terminology is consistent throughout
- [ ] Formatting is consistent
- [ ] Style is consistent with other skills/workflows
- [ ] Naming conventions are followed

## Step 14: Test Execution Path

### Walkthrough Method

Simulate executing the skill/workflow step by step:

1. **Start with fresh context**: Pretend you're encountering this for the first time
2. **Follow each step exactly**: Do exactly what the instructions say
3. **Document issues**: Note where you get stuck, confused, or deviate
4. **Verify outcomes**: Check if each step produces expected results
5. **Test variations**: Try different scenarios or inputs

### Execution Path Testing Checklist

**Step Clarity**:
- [ ] Each step can be understood without prior knowledge
- [ ] Each step has a clear starting point
- [ ] Each step has a clear ending point
- [ ] Transitions between steps are smooth

**Actionability**:
- [ ] Each step specifies exactly what to do
- [ ] Commands are complete and accurate
- [ ] File paths are correct
- [ ] Required inputs are specified

**Validation**:
- [ ] Each step has a way to verify completion
- [ ] Success criteria are defined
- [ ] Failure modes are identified
- [ ] Next steps are clear after validation

### Common Execution Issues to Check For

- Missing intermediate steps
- Unclear transition points
- Ambiguous instructions
- Missing prerequisites
- Undefined variables or placeholders
- Incorrect command syntax
- Wrong file paths
- Missing validation steps

## Step 15: Validate Progressive Disclosure

### Progressive Disclosure Testing

Test that information loads at appropriate levels:

**Level 1 (Name + Description)**:
- [ ] The AI agent can understand when to use this from name/description alone
- [ ] Description is sufficient for decision-making
- [ ] No critical information is missing from Level 1

**Level 2 (Core SKILL.md)**:
- [ ] Core workflow is complete in SKILL.md
- [ ] SKILL.md is not overwhelming (< 300 lines)
- [ ] References to supporting files are clear
- [ ] Most common use cases can be completed with just SKILL.md

**Level 3 (Supporting Files)**:
- [ ] Supporting files are only loaded when needed
- [ ] File references are clear and contextual
- [ ] Supporting files are focused and not redundant
- [ ] File organization is logical

**Level 4 (Rare Context)**:
- [ ] Rarely used information is separated
- [ ] Edge cases are documented separately
- [ ] Advanced topics are not in core content
- [ ] Historical context is separated if needed

### Progressive Disclosure Issues to Fix

- SKILL.md is too long or detailed
- Critical information buried in supporting files
- Supporting files loaded unnecessarily
- No clear indication of when to load supporting files
- Information duplicated across levels
- Missing level indicators in references

## Step 16: Check for Ambiguities

### Ambiguity Detection

Review for these types of ambiguities:

**Word Ambiguities**:
- Multiple meanings of common words
- Unclear pronoun references
- Vague quantifiers (some, many, few)
- Undefined terms

**Structural Ambiguities**:
- Unclear step ordering
- Missing dependencies between steps
- Unclear conditional logic
- Ambiguous branching paths

**Contextual Ambiguities**:
- Undefined environment assumptions
- Unclear scope or boundaries
- Missing context about when to apply
- Unclear target audience or skill level

### Ambiguity Resolution Techniques

**Replace vague terms**:
- "some files" → "all .md files in the docs/ directory"
- "configure appropriately" → "set the value to match your environment"
- "wait a bit" → "wait 30 seconds"

**Add context**:
- "Run the script" → "Run scripts/deploy.sh from the project root"
- "Check the output" → "Verify that the output contains 'Deployment successful'"
- "Use the template" → "Copy templates/config.yaml to config/ and modify values"

**Define terms**:
- First use of technical term: include brief explanation
- Domain-specific jargon: define or avoid
- Acronyms: spell out on first use

### Ambiguity Checklist

- [ ] All pronouns have clear antecedents
- [ ] All technical terms are defined or explained
- [ ] All quantifiers are specific
- [ ] All file paths are complete
- [ ] All commands are complete and executable
- [ ] All conditions are clearly stated
- [ ] All dependencies are explicit

## Step 17: Verify Completeness

### Completeness Dimensions

**Functional Completeness**:
- [ ] All required functionality is covered
- [ ] All use cases are addressed
- [ ] All inputs are specified
- [ ] All outputs are defined

**Contextual Completeness**:
- [ ] All prerequisites are listed
- [ ] All assumptions are stated
- [ ] All environment requirements are specified
- [ ] All dependencies are identified

**Instructional Completeness**:
- [ ] All steps are detailed enough
- [ ] All transitions are explained
- [ ] All validations are included
- [ ] All error handling is covered

### Completeness Validation Methods

**Use Case Coverage**:
- List all identified use cases
- Verify each is addressed in the skill/workflow
- Identify any gaps

**Scenario Testing**:
- Walk through typical scenarios
- Walk through edge case scenarios
- Walk through error scenarios
- Verify each scenario is handled

**Dependency Analysis**:
- Map all dependencies between steps
- Verify all dependencies are satisfied
- Check for circular dependencies
- Verify ordering is correct

### Completeness Checklist

**Prerequisites**:
- [ ] All required tools are listed
- [ ] All required files are specified
- [ ] All required permissions are noted
- [ ] All required knowledge is stated

**Steps**:
- [ ] Every necessary step is included
- [ ] No critical steps are missing
- [ ] Step ordering is logical
- [ ] Step dependencies are clear

**Outputs**:
- [ ] Expected outputs are defined
- [ ] Output formats are specified
- [ ] Output locations are clear
- [ ] Success criteria are defined

**Error Handling**:
- [ ] Common errors are anticipated
- [ ] Error messages are clear
- [ ] Recovery procedures are provided
- [ ] Failure modes are documented

### Gap Identification

If gaps are found, categorize them:
- **Critical gaps**: Must fix before use
- **Important gaps**: Should fix before common use
- **Nice-to-have gaps**: Can defer to future iteration
- **Out of scope**: Document as explicitly excluded
