# Skill Builder - Templates

This document provides templates for creating skills and workflows.

## SKILL.md Template

```markdown
---
name: skill-name
description: Brief description (1-2 sentences) of what this skill does
---

# Skill Name

Brief overview of what this skill does and when the AI agent should use it.

## When to Use This Skill

Use this skill when:
- [Condition 1]
- [Condition 2]
- [Condition 3]

## Prerequisites

Before using this skill, ensure:
- [Prerequisite 1]
- [Prerequisite 2]
- [Prerequisite 3]

## Workflow Steps

### Step 1: [Step Title]

[Detailed instructions for this step]

**Validation**: [How to verify this step completed successfully]

**If this fails**: [What to do if something goes wrong]

### Step 2: [Step Title]

[Detailed instructions for this step]

**Validation**: [How to verify this step completed successfully]

**If this fails**: [What to do if something goes wrong]

### Step 3: [Step Title]

[Detailed instructions for this step]

**Validation**: [How to verify this step completed successfully]

**If this fails**: [What to do if something goes wrong]

## Supporting Files

- [file1.md]: [Purpose and when to read it]
- [file2.md]: [Purpose and when to read it]
- [scripts/script.sh]: [Purpose and when to run it]

## Examples

### Basic Usage

[Scenario description]

```
[Example code or commands]
```

**Expected output**: [What should happen]

### Advanced Usage

[Scenario description with step-by-step walkthrough]

## Troubleshooting

### Common Issue 1
**Symptom**: [What you see]
**Solution**: [How to fix it]

### Common Issue 2
**Symptom**: [What you see]
**Solution**: [How to fix it]
```

## Workflow Markdown Template

```markdown
---
name: workflow-name
description: Brief description (1-2 sentences) of what this workflow does
---

# Workflow Name

Brief overview of what this workflow does and when to use it.

## Prerequisites

Before running this workflow, ensure:
- [Prerequisite 1]
- [Prerequisite 2]
- [Prerequisite 3]

## Usage

Run this workflow from the root of your repository:

```
/workflow-name
```

## Workflow Steps

### Step 1: [Step Title]

[Detailed instructions for this step]

**Validation**: [How to verify this step completed successfully]

**If this fails**: [What to do if something goes wrong]

### Step 2: [Step Title]

[Detailed instructions for this step]

**Validation**: [How to verify this step completed successfully]

**If this fails**: [What to do if something goes wrong]

### Step 3: [Step Title]

[Detailed instructions for this step]

**Validation**: [How to verify this step completed successfully]

**If this fails**: [What to do if something goes wrong]

## Examples

### Basic Usage

[Scenario description]

```
[Example code or commands]
```

**Expected output**: [What should happen]

### Advanced Usage

[Scenario description with step-by-step walkthrough]

## Troubleshooting

### Common Issue 1
**Symptom**: [What you see]
**Solution**: [How to fix it]

### Common Issue 2
**Symptom**: [What you see]
**Solution**: [How to fix it]
```

## README.md Template for Skills

```markdown
# [Skill Name]

[One-line description]

## Overview

[Brief overview of what this skill does and when to use it]

## Quick Start

To get started immediately:

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Usage

This skill is automatically invoked by the AI agent when [condition].

You can also manually invoke it by @mentioning the skill name.

## Examples

### Basic Example

[Scenario description]

[Step-by-step walkthrough]

### Advanced Example

[Scenario description]

[Step-by-step walkthrough]

## Configuration

[If applicable, describe configuration options]

## Troubleshooting

See [troubleshooting.md](troubleshooting.md) for common issues and solutions.

## Contributing

To contribute improvements to this skill:

1. [Step 1]
2. [Step 2]
3. [Step 3]

## License

[License information]
```

## Reference Documentation Template

```markdown
# Reference Documentation for [Skill Name]

## [Topic 1]

[Detailed reference information about topic 1]

### [Subtopic 1.1]

[Details about subtopic]

### [Subtopic 1.2]

[Details about subtopic]

## [Topic 2]

[Detailed reference information about topic 2]

## [Topic 3]

[Detailed reference information about topic 3]
```

## Template File Template

```markdown
# [Template Name]

This is a template for [purpose].

## Usage

[How to use this template]

## Variables

Replace the following variables:
- `{{variable1}}`: [Description]
- `{{variable2}}`: [Description]
- `{{variable3}}`: [Description]

## Example

[Example of the template filled in]
```

## Script Template (Shell)

```bash
#!/bin/bash

# Script: [Script Name]
# Purpose: [What this script does]
# Usage: [How to run this script]

set -e  # Exit on error

# Configuration
VAR1="default_value"
VAR2="default_value"

# Functions
function_name() {
    # Function description
    echo "Function output"
}

# Main execution
echo "Starting script..."

# Script logic here

echo "Script completed successfully"
```

## Troubleshooting Guide Template

```markdown
# Troubleshooting [Skill Name]

## Common Issues

### Issue Title
**Symptoms**: What you see when this issue occurs
**Cause**: Why this issue happens
**Solution**: Step-by-step solution

1. [Step 1]
2. [Step 2]
3. [Step 3]

### Issue Title
**Symptoms**: What you see when this issue occurs
**Cause**: Why this issue happens
**Solution**: Step-by-step solution

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Error Messages

### Error Message Text
**Meaning**: What this error means
**Solution**: How to resolve it

### Error Message Text
**Meaning**: What this error means
**Solution**: How to resolve it

## Getting Help

If you're still having trouble:
- [Resource 1]
- [Resource 2]
- [Resource 3]
```

## Example Scenario Template

```markdown
# Example: [Scenario Title]

## Scenario Description

[Describe the scenario and context]

## Prerequisites

- [Prerequisite 1]
- [Prerequisite 2]

## Step-by-Step

1. **Step 1**: [Action]
   - [Detail]
   - [Detail]

2. **Step 2**: [Action]
   - [Detail]
   - [Detail]

3. **Step 3**: [Action]
   - [Detail]
   - [Detail]

## Expected Outcome

[What should happen when following these steps]

## Variations

### Variation 1
[Description of variation and how to adapt the steps]

### Variation 2
[Description of variation and how to adapt the steps]
```

## Design Document Template

```markdown
# Design: [Skill Name]

## Overview

[High-level overview of the skill design]

## Goals

- [Goal 1]
- [Goal 2]
- [Goal 3]

## Non-Goals

- [What this skill explicitly does not do]
- [What is out of scope]

## Architecture

[Description of the skill architecture]

### Components

- [Component 1]: [Description]
- [Component 2]: [Description]
- [Component 3]: [Description]

### Data Flow

[Description of how data flows through the skill]

## Design Decisions

### Decision 1: [Title]
**Context**: [Why this decision was needed]
**Decision**: [What was decided]
**Alternatives considered**: [Other options and why they were rejected]

### Decision 2: [Title]
**Context**: [Why this decision was needed]
**Decision**: [What was decided]
**Alternatives considered**: [Other options and why they were rejected]

## Future Enhancements

- [Potential enhancement 1]
- [Potential enhancement 2]
- [Potential enhancement 3]
```
