# Step 5: Progressive Disclosure Structure

## Directory Structure

```
skills/pr-creator/
├── SKILL.md                      # Core content (Level 2)
├── references/                   # Reference material (Level 3)
│   ├── pr-description-template.md
│   ├── git-commands.md
│   └── api-commands.md
├── examples/                     # Examples (Level 3)
│   └── sample-pr-description.md
└── evals/                        # Test cases (Level 4)
    └── evals.json
```

## Content Organization

### Level 1: Metadata (Always Visible)
- **name**: pr-creator
- **description**: Comprehensive description including what it does and when to trigger
- **compatibility**: Required tools (git, gh or gitlab-cli)
- **license**: MIT

### Level 2: SKILL.md Core Content (Loaded on Invocation)
- Main workflow steps (git analysis → PR check → create/update)
- Git history analysis instructions
- PR existence detection logic
- PR creation/update procedures
- Error handling and edge cases
- When to read reference files

### Level 3: Supporting Files (Loaded as Needed)
- **references/pr-description-template.md**: Template structure for PR descriptions
- **references/git-commands.md**: Git commands for change detection and analysis
- **references/api-commands.md**: CLI commands for PR creation/update
- **examples/sample-pr-description.md**: Example of a complete PR description

### Level 4: Rarely Used Context
- **evals/evals.json**: Test cases for validation
- Advanced troubleshooting scenarios (documented in SKILL.md if needed)

## File Reference Strategy

From SKILL.md, reference files using:
- Clear section headers: "Read references/pr-description-template.md for the PR description structure"
- Relative paths: "references/git-commands.md"
- Context about when to read: "When generating the PR description, read references/pr-description-template.md"
- Instructions on usage: "Use the template as a guide, but adapt based on the actual changes"

## Content Splitting Criteria

Split into separate files when:
- Content exceeds 200-300 lines (templates and references)
- Content is only relevant in specific scenarios (API commands for different platforms)
- Content can be reused (PR description template)
- Content is better presented as structured data (evals.json)
