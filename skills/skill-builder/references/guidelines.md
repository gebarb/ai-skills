# Skill Builder - Guidelines

This document provides a comprehensive framework for creating skills and workflows. **Important**: This framework should be used in conjunction with the dynamic standards lookup performed in Step 0 of the skill-builder workflow (see `references/standards-lookup.md`), which retrieves the most current best practices from all available external sources.

## How to Use This Document

1. Perform Step 0 of the workflow to retrieve current external standards from all available sources
2. Use the sections below as a structural framework
3. Apply the specific requirements found during live research, regardless of source
4. Synthesize findings from multiple sources into a cohesive approach
5. Update your understanding based on retrieved findings
6. Reference specific sources when documenting compliance decisions
7. Adapt the approach based on what standards are actually available

## AI Agent Skills Standards

### Core Principles

**Progressive Disclosure**:
- Only name and description shown by default
- Full SKILL.md content loaded only when invoked
- Supporting files loaded as needed
- Keeps context window lean

**Automatic Invocation**:
- Skills can be invoked automatically by the AI agent
- The AI agent decides when to use based on task context
- Users can also @mention skills manually
- Name and description are critical for triggering

**File Structure**:
- Skills are directories with SKILL.md
- Supporting files can be bundled
- Referenced by name from SKILL.md
- No strict limit on bundled content

### YAML Frontmatter Requirements

**Required fields**:
```yaml
---
name: skill-name
description: Brief description (1-2 sentences)
---
```

**Description guidelines**:
- Clear and specific
- 1-2 sentences maximum
- Action-oriented
- Includes when/why it's used
- Enables accurate triggering

**Naming conventions**:
- Lowercase with hyphens
- Descriptive but concise
- No special characters
- kebab-case

### Progressive Disclosure Implementation

**Level 1: Name + Description**
- Always visible to the AI agent
- Used for decision-making
- Should be sufficient for triggering

**Level 2: Core SKILL.md**
- Loaded on invocation
- Contains core workflow
- References supporting files
- Should be < 300 lines

**Level 3: Supporting Files**
- Loaded as needed
- Detailed reference material
- Templates and examples
- Scripts and utilities

**Level 4: Rare Context**
- Edge case handling
- Advanced configurations
- Troubleshooting guides
- Historical context

### File Organization

**Directory structure**:
```
skills/skill-name/
├── SKILL.md              # Core content
├── reference.md          # Reference material
├── templates/            # Templates
│   ├── template1.md
│   └── template2.md
└── scripts/              # Scripts
    ├── script1.sh
    └── script2.sh
```

**File naming**:
- Descriptive and clear
- Consistent conventions
- Appropriate extensions
- Group related files

## AI Agent Workflows Standards

### Core Principles

**Manual Invocation Only**:
- Invoked via slash command only
- The AI agent never invokes automatically
- User-controlled execution
- Simpler structure than skills

**File Structure**:
- Single markdown file
- No progressive disclosure needed
- All content in one file
- Stored in workflows/ directory

### YAML Frontmatter Requirements

Same as skills:
```yaml
---
name: workflow-name
description: Brief description (1-2 sentences)
---
```

### When to Use Workflows vs Skills

**Use Workflows when**:
- User wants manual control
- Process is user-initiated
- No automatic triggering needed
- Simpler, linear process

**Use Skills when**:
- The AI agent should recognize context
- Automatic invocation desired
- Complex multi-step process
- Progressive disclosure beneficial

## Agent Skills Guidelines

### Progressive Disclosure Principles

**Core design principle**:
- Information loads only as needed
- Like a well-organized manual
- Table of contents → chapters → appendix
- Effectively unbounded context possible

**Implementation**:
- Start with evaluation
- Structure for scale
- Think from the AI agent's perspective
- Iterate based on usage observations

### Development Guidelines

**Start with Evaluation**:
- Identify capability gaps
- Run on representative tasks
- Observe where agent struggles
- Build skills incrementally

**Structure for Scale**:
- Split SKILL.md when unwieldy
- Separate mutually exclusive contexts
- Keep rarely used content separate
- Code as executable and documentation

**Think from AI Agent's Perspective**:
- Monitor real usage
- Iterate based on observations
- Watch for unexpected trajectories
- Pay attention to name and description

**Iterate Based on Usage**:
- Capture successful approaches
- Document common mistakes
- Self-reflect on failures
- Discover actual needed context

### Content Quality Guidelines

**Clarity**:
- Specific and unambiguous
- Actionable and concrete
- No jargon without explanation
- Examples for complex concepts

**Completeness**:
- All necessary steps included
- Prerequisites clearly stated
- Expected outputs defined
- Edge cases considered

**Consistency**:
- Consistent terminology
- Consistent formatting
- Consistent style
- Consistent naming

## General Best Practices

### Writing Style

**Tone**:
- Professional and objective
- Clear and direct
- Helpful and supportive
- Not overly casual

**Voice**:
- Active voice preferred
- Present tense for instructions
- Second person for direct address
- Concise but complete

**Structure**:
- Logical flow
- Clear sections
- Smooth transitions
- No redundancy

### Content Organization

**Section hierarchy**:
- H1: Document title
- H2: Major sections
- H3: Subsections
- H4: Details

**Lists**:
- Use for steps
- Use for options
- Use for requirements
- Keep items parallel

**Code blocks**:
- Use for commands
- Use for code
- Use for file contents
- Specify language

### Error Handling

**Anticipate errors**:
- Common failure modes
- Missing prerequisites
- Invalid inputs
- Permission issues

**Provide solutions**:
- Clear error messages
- Recovery procedures
- Troubleshooting steps
- Where to get help

**Validation**:
- Verify prerequisites
- Verify intermediate states
- Verify final state
- Clear success criteria

### Testing and Validation

**Self-review**:
- Walk through execution
- Test with fresh context
- Identify ambiguities
- Verify completeness

**User testing**:
- Test with actual users
- Observe usage patterns
- Collect feedback
- Iterate based on findings

**Continuous improvement**:
- Monitor usage
- Collect issues
- Update regularly
- Version appropriately

## Security Considerations

### Safe Practices

**No sensitive information**:
- No API keys
- No passwords
- No secrets
- No personal data

**Safe commands**:
- Validate inputs
- Sanitize commands
- Use safe defaults
- Document risks

**Permissions**:
- Minimum required
- Document needs
- Check before execution
- Handle failures

### Code Safety

**Input validation**:
- Validate all inputs
- Sanitize user input
- Check file paths
- Verify permissions

**Command safety**:
- Use absolute paths
- Avoid dangerous commands
- Check return codes
- Handle errors

**File operations**:
- Verify before write
- Backup before modify
- Use safe operations
- Document changes

## Performance Considerations

### Context Efficiency

**Progressive disclosure**:
- Load only what's needed
- Split large files
- Reference supporting files
- Keep SKILL.md lean

**Content optimization**:
- Remove redundancy
- Use concise language
- Avoid unnecessary detail
- Focus on essentials

### Execution Efficiency

**Step optimization**:
- Minimize steps
- Parallelize when possible
- Cache results
- Avoid redundant work

**Resource usage**:
- Document requirements
- Specify resource needs
- Optimize for common cases
- Handle resource limits

## Accessibility

**Clear structure**:
- Descriptive headers
- Logical organization
- Clear navigation
- Consistent formatting

**Readable content**:
- Plain language
- Explain jargon
- Provide examples
- Use consistent terminology

**Alternative formats**:
- Code blocks for technical content
- Tables for structured data
- Lists for steps
- Diagrams for complex concepts

## Maintenance

### Versioning

**Semantic versioning**:
- Major: Breaking changes
- Minor: New features
- Patch: Bug fixes

**Change tracking**:
- Document all changes
- Use version numbers
- Tag releases

### Documentation

**Keep current**:
- Update with changes
- Remove outdated info
- Add new examples
- Fix errors

**User-facing**:
- README.md
- Quick start guide
- Examples
- Troubleshooting

**Developer-facing**:
- Design docs
- Architecture
- Extension points
- Maintenance guide

### Testing

**Regular testing**:
- Test after changes
- Test on updates
- Test with new scenarios
- Regression testing

**Automated testing**:
- Unit tests for scripts
- Integration tests
- End-to-end tests
- Continuous integration

## Distribution

### Preparation

**Clean up**:
- Remove temporary files
- Remove test files
- Organize structure
- Verify permissions

**Documentation**:
- Update README
- Update examples
- Add release notes

**Testing**:
- Final end-to-end test
- Test on clean system
- Test with users
- Verify all features

### Release

**Version control**:
- Tag version
- Create release
- Document changes
- Archive old versions

**Distribution channels**:
- Repository
- Package manager
- Documentation site
- Announcement

### Support

**Issue tracking**:
- Document known issues
- Track bug reports
- Track feature requests
- Prioritize improvements

**Communication**:
- Release notes
- Migration guides
- Breaking changes
- Support channels
