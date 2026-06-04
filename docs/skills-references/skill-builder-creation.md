# Skill Builder - Creation Phase

This document provides detailed guidance for Steps 6-12 of the skill-builder workflow.

## Step 6: Create Skill/Workflow Directory

### Directory Structure

**For Skills**:
```bash
mkdir -p workflows/skill-name
cd workflows/skill-name
```

**For Workflows**:
```bash
# Workflows are single files in workflows/ directory
# No subdirectory needed
```

### Naming Conventions

- Use lowercase with hyphens: `my-skill-name`
- Be descriptive but concise: `deployment-workflow` not `automated-deployment-process-for-web-applications`
- Avoid special characters and spaces
- Use kebab-case consistently

### File Permissions

Ensure files are readable:
```bash
chmod 644 SKILL.md
chmod 755 scripts/*.sh  # For executable scripts
```

## Step 7: Write YAML Frontmatter

### Required Fields

All skills/workflows must have:

```yaml
---
name: skill-name
description: Brief description of what this skill does (1-2 sentences)
---
```

### Description Best Practices

Based on Windsurf and Anthropic standards:
- **Clear**: State exactly what the skill/workflow does
- **Concise**: Keep to 1-2 sentences maximum
- **Action-oriented**: Start with a verb
- **Specific**: Mention key capabilities or scope
- **Context-aware**: Include when/why it's used

### Good Examples

```
description: Automate web application deployment to production environments
description: Review code for security vulnerabilities and best practices
description: Generate comprehensive API documentation from codebase
```

### Poor Examples

```
description: This is a skill that helps with deployment  # Too vague
description: A comprehensive multi-step workflow for automating the deployment process of web applications to production environments including testing and validation  # Too long
description: Deployment  # Too short, no context
```

### Optional Frontmatter Fields

For skills, you may add:
```yaml
---
name: skill-name
description: Brief description
version: 1.0.0
author: Your Name
tags: [deployment, automation, production]
---
```

## Step 8: Draft Core Content

### SKILL.md Structure

```markdown
---
name: skill-name
description: Brief description
---

# Skill Name

Brief overview of what this skill does.

## When to Use This Skill

[Conditions or contexts where this skill is applicable]

## Prerequisites

[What must exist before this skill can be used]

## Workflow Steps

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Supporting Files

- [File 1]: [Purpose]
- [File 2]: [Purpose]

## Examples

[Example usage scenarios]
```

### Workflow Markdown Structure

```markdown
---
name: workflow-name
description: Brief description
---

# Workflow Name

Brief overview of what this workflow does.

## Prerequisites

[What must exist before this workflow can be used]

## Usage

```
/workflow-name
```

## Workflow Steps

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Examples

[Example usage scenarios]
```

### Content Writing Guidelines

- **Be specific**: Use concrete, actionable language
- **Be complete**: Include all necessary steps
- **Be clear**: Avoid ambiguity and jargon
- **Be concise**: Remove unnecessary words
- **Be structured**: Use headers, lists, and formatting
- **Be consistent**: Use consistent terminology and style

### Step Writing Best Practices

For each step:
1. **Start with a verb**: "Create file", "Run command", "Verify output"
2. **Be specific**: Include exact commands, file paths, or actions
3. **Provide context**: Explain why this step is needed
4. **Include validation**: How to verify the step completed successfully
5. **Handle errors**: What to do if something goes wrong

## Step 9: Add Supporting Files

### File Types and Purposes

**Reference Files** (.md):
- Detailed documentation
- API references
- Architecture diagrams
- Process explanations

**Template Files** (.md, .json, .yaml, etc.):
- Code templates
- Configuration templates
- File structure templates
- Response templates

**Script Files** (.sh, .py, .js, etc.):
- Utility scripts
- Build scripts
- Validation scripts
- Automation scripts

**Checklist Files** (.md):
- Step-by-step checklists
- Validation checklists
- Review checklists

### File Creation Guidelines

- Use clear, descriptive filenames
- Include file purpose in comments at top
- Make scripts executable when appropriate
- Use appropriate file extensions
- Keep files focused on single purpose

### Referencing Files from SKILL.md

```markdown
## Supporting Files

### reference.md
Contains detailed reference material for [topic]. Read this when you need [specific information].

### templates/deployment-template.md
Template for deployment configuration. Use this as a starting point for new deployments.

### scripts/validate.sh
Validation script to check deployment readiness. Run this before deploying.
```

## Step 10: Implement Progressive Disclosure

### Level 1: Name and Description

Always visible to Cascade. This is the YAML frontmatter.

### Level 2: Core SKILL.md Content

Loaded when skill is invoked. Should contain:
- Overview and purpose
- When to use the skill
- Core workflow steps
- References to supporting files
- Basic examples

### Level 3: Supporting Files

Loaded as needed during execution. Should contain:
- Detailed reference material
- Templates and examples
- Scripts and utilities
- Specialized checklists

### Level 4: Rarely Used Context

Loaded only in specific scenarios. Should contain:
- Edge case handling
- Advanced configurations
- Troubleshooting guides
- Historical context

### Progressive Disclosure Implementation

In SKILL.md, use section headers to indicate when to load supporting files:

```markdown
## Step 3: Configure Deployment

For detailed configuration options, see `reference.md#configuration`.

Use the template in `templates/deployment-template.md` as a starting point.
```

## Step 11: Add Error Handling and Edge Cases

### Error Handling Strategy

For each step, consider:
1. **What could go wrong?**
2. **How will the user know?**
3. **What should they do?**

### Error Handling Template

```markdown
### Step N: [Step Name]

[Instructions for the step]

**If this fails:**
- [Error condition 1]: [Solution]
- [Error condition 2]: [Solution]

**Common issues:**
- [Issue 1]: [Prevention or fix]
- [Issue 2]: [Prevention or fix]
```

### Edge Case Coverage

Identify and handle:
- Missing prerequisites
- Invalid inputs
- Permission issues
- Network failures
- Timeout scenarios
- Version conflicts
- Environment differences

### Validation Checkpoints

Add validation steps at key points:
- Before starting: Verify prerequisites
- During execution: Verify intermediate states
- After completion: Verify final state

## Step 12: Include Examples and Usage Instructions

### Example Types

**Basic Example**: Simple, common use case
**Advanced Example**: Complex or specialized use case
**Error Example**: How to handle errors
**Integration Example**: How to use with other skills/workflows

### Example Format

```markdown
## Examples

### Basic Usage

[Scenario description]

```
[Example code or commands]
```

**Expected output**: [What should happen]

### Advanced Usage

[Scenario description]

[Step-by-step walkthrough]

### Troubleshooting Example

[Problem description]

[Solution steps]
```

### Usage Instructions

Include:
- How to invoke (for skills: automatic or @mention; for workflows: slash command)
- Required parameters or inputs
- Expected outputs
- Time estimates (if applicable)
- Resource requirements (if applicable)

### Quick Start Guide

Provide a minimal working example:

```markdown
## Quick Start

To get started immediately:

1. [Step 1]
2. [Step 2]
3. [Step 3]

That's it! The skill/workflow will [what it does].
```
