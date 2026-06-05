# Skill Builder - Refinement Phase

This document provides detailed guidance for Steps 18-20 of the skill-builder workflow.

## Step 18: Iterate Based on Review

### Review Prioritization

Prioritize issues based on impact:

**Critical Issues** (fix immediately):
- Skill/workflow cannot execute
- Missing critical steps
- Incorrect instructions
- Security vulnerabilities
- Major standards violations

**High Priority** (fix before common use):
- Ambiguous instructions
- Missing error handling
- Incomplete edge case coverage
- Poor progressive disclosure
- Inconsistent terminology

**Medium Priority** (improve quality):
- Suboptimal structure
- Missing examples
- Unclear descriptions
- Minor inconsistencies
- Could be more concise

**Low Priority** (polish):
- Formatting improvements
- Minor wording tweaks
- Additional examples
- Enhanced documentation
- Nice-to-have features

### Iteration Process

For each issue:

1. **Understand the root cause**: Why does this issue exist?
2. **Identify the fix**: What change will resolve it?
3. **Consider side effects**: Will this change break anything else?
4. **Implement the fix**: Make the change
5. **Verify the fix**: Test that the issue is resolved
6. **Check for regressions**: Ensure nothing else broke

### Common Fixes

**Ambiguity Fixes**:
- Replace vague terms with specific ones
- Add context to unclear instructions
- Define technical terms
- Specify exact commands or file paths

**Completeness Fixes**:
- Add missing steps
- Add missing prerequisites
- Add missing error handling
- Add missing validation

**Structure Fixes**:
- Reorganize content for better flow
- Split large files into smaller ones
- Consolidate related content
- Improve progressive disclosure

**Clarity Fixes**:
- Simplify complex instructions
- Add examples for complex concepts
- Improve formatting and structure
- Use consistent terminology

### Iteration Tracking

Track changes made:
```markdown
## Revision History

### v1.1 - [Date]
- Fixed ambiguity in Step 3
- Added error handling for Step 5
- Improved progressive disclosure
- Added example for advanced use case

### v1.0 - [Date]
- Initial version
```

## Step 19: Add Documentation

### Documentation Types

**User Documentation**:
- Quick start guide
- Usage examples
- FAQ
- Troubleshooting guide

**Developer Documentation**:
- Design rationale
- Architecture overview
- Extension points
- Maintenance guide

**Reference Documentation**:
- API references
- Configuration options
- Parameter descriptions
- Return value specifications

### Documentation Structure

Create supporting documentation files as needed:

```
skill-directory/
├── SKILL.md
├── README.md              # User-facing overview
├── examples/              # Example scenarios
│   ├── basic-example.md
│   └── advanced-example.md
├── troubleshooting.md     # Common issues and solutions
└── design.md             # Design rationale and architecture
```

### README.md Template

```markdown
# [Skill Name]

[One-line description]

## Overview

[Brief overview of what this skill does and when to use it]

## Quick Start

[Minimal steps to get started]

## Usage

[How to use the skill]

## Examples

[Links to example files or inline examples]

## Troubleshooting

[Common issues and solutions, or link to troubleshooting.md]

## Contributing

[How to contribute improvements]
```

### Examples Documentation

Create example files for:
- Basic usage
- Advanced usage
- Edge cases
- Error scenarios
- Integration with other skills/workflows

Each example should include:
- Scenario description
- Step-by-step walkthrough
- Expected outcome
- Variations and customizations

### Troubleshooting Guide Template

```markdown
# Troubleshooting

## Common Issues

### Issue Title
**Symptoms**: What you see
**Cause**: Why it happens
**Solution**: How to fix it

### Issue Title
**Symptoms**: What you see
**Cause**: Why it happens
**Solution**: How to fix it

## Getting Help

[Where to get additional help]
```

## Step 20: Final Polish

### Quality Checklist

**Content Quality**:
- [ ] All text is grammatically correct
- [ ] Spelling is correct throughout
- [ ] Punctuation is consistent
- [ ] Capitalization follows conventions
- [ ] No typos or errors

**Formatting Quality**:
- [ ] Headers use correct levels (H1, H2, H3)
- [ ] Lists are properly formatted
- [ ] Code blocks use correct language tags
- [ ] Links are valid and working
- [ ] Tables are properly formatted

**Structure Quality**:
- [ ] Document has logical flow
- [ ] Sections are in sensible order
- [ ] Related content is grouped
- [ ] Transitions are smooth
- [ ] No redundant content

**Consistency Quality**:
- [ ] Terminology is consistent
- [ ] Style is consistent
- [ ] Formatting is consistent
- [ ] Naming conventions are followed
- [ ] Tone is consistent

### Professional Quality Standards

**Tone**:
- Professional and objective
- Clear and direct
- Helpful and supportive
- Not overly casual or informal

**Style**:
- Active voice preferred
- Present tense for instructions
- Second person for direct address
- Concise but complete

**Accessibility**:
- Clear section headers
- Descriptive link text
- Alt text for images (if any)
- Sufficient contrast in formatting

### Final Review Questions

Ask yourself:
1. **Would a new user understand this?** Test with fresh eyes
2. **Is this the best way to accomplish this?** Consider alternatives
3. **Is anything missing?** Check against requirements
4. **Is anything unnecessary?** Remove fluff
5. **Is this ready for distribution?** Be honest

### Pre-Distribution Checklist

Before distributing the skill/workflow:

- [ ] All validation steps completed
- [ ] All critical issues resolved
- [ ] All high-priority issues resolved
- [ ] Documentation is complete
- [ ] Examples are tested and working
- [ ] Version number is updated
- [ ] Change log is updated
- [ ] README is comprehensive
- [ ] File permissions are correct
- [ ] No sensitive information included
- [ ] Links and references are valid
- [ ] Code is tested (if applicable)
- [ ] Skill/workflow is tested end-to-end

### Versioning

Use semantic versioning:
- **Major version** (X.0.0): Breaking changes
- **Minor version** (0.X.0): New features, non-breaking changes
- **Patch version** (0.0.X): Bug fixes, minor improvements

Update version in frontmatter:
```yaml
---
name: skill-name
description: Brief description
version: 1.0.0
---
```

### Distribution Preparation

Prepare for distribution:
1. **Clean up**: Remove any temporary or test files
2. **Organize**: Ensure file structure is clean
3. **Document**: Update all documentation
4. **Test**: Final end-to-end test
5. **Package**: If distributing as a package, create package
6. **Tag**: Create git tag for version
7. **Release**: Create release notes

### Release Notes Template

```markdown
# Release v1.0.0

## Features
- [New feature 1]
- [New feature 2]

## Improvements
- [Improvement 1]
- [Improvement 2]

## Bug Fixes
- [Bug fix 1]
- [Bug fix 2]

## Documentation
- [Documentation update]

## Upgrade Notes
[Any special upgrade instructions]
```
