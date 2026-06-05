# Skill Builder - Planning Phase

This document provides detailed guidance for Steps 1-5 of the skill-builder workflow.

## Step 1: Determine Skill vs Workflow

### Understanding the Difference

**Skills** (automatic invocation):
- The AI agent can invoke them automatically based on task context
- Use progressive disclosure (name/description shown first, full content loaded when invoked)
- Best for: complex multi-step tasks that the AI agent should recognize and execute on its own
- Stored in skill directories with SKILL.md and supporting files
- Can be @mentioned by users for manual invocation

**Workflows** (manual invocation):
- Only invoked via slash command by users
- The AI agent never invokes them automatically
- Best for: repetitive processes that users want to trigger manually
- Stored as single markdown files in workflows directories
- Simpler structure, no progressive disclosure needed

### Decision Framework

Ask these questions:
1. Should the AI agent recognize when to use this automatically? → Skill
2. Is this a process I want to trigger manually every time? → Workflow
3. Does this require complex context that should load progressively? → Skill
4. Is this a straightforward step-by-step guide I want to run on command? → Workflow

### Examples

**Use a Skill when:**
- Deploying a service (the AI agent should recognize deployment context)
- Code review guidelines (the AI agent should apply during code changes)
- Testing procedures (the AI agent should invoke when testing is needed)
- Debugging workflows (the AI agent should recognize error patterns)

**Use a Workflow when:**
- Creating project specifications (user-driven planning process)
- Running specific audit checks (user-initiated reviews)
- Generating documentation (user-triggered documentation process)
- Setting up new projects (user-controlled setup process)

**Concrete Example:**
- **Task**: "I want to automate running security audits on my code"
- **Decision**: Workflow - This is a specific audit check that the user wants to trigger manually on demand, not something the AI agent should automatically invoke during normal coding
- **Task**: "I want the AI agent to automatically apply code style fixes whenever it edits files"
- **Decision**: Skill - This should happen automatically whenever the AI agent edits code, without the user needing to explicitly trigger it

## Step 2: Define Purpose and Scope

### Purpose Statement Template

Create a clear, concise purpose statement:

```
This [skill/workflow] [verb] [what] for [who/what] by [how].
```

Example:
```
This skill automates deployment of web applications to production environments
for development teams by following a standardized deployment checklist.
```

### Scope Definition

Define what the skill/workflow:
- **Includes**: Specific tasks, contexts, and use cases covered
- **Excludes**: Tasks and contexts explicitly out of scope
- **Assumes**: Prerequisites and initial conditions
- **Delivers**: Expected outputs and end states

### Scope Boundaries

Clearly state:
- What technologies or domains are covered
- What file types or project structures are supported
- What environments or contexts are applicable
- What skill level or expertise is assumed

## Step 3: Identify Use Cases

### Use Case Mapping

For each use case, document:
1. **Trigger**: What initiates the skill/workflow
2. **Context**: What state or situation exists
3. **Goal**: What outcome is desired
4. **User**: Who is using it (if applicable)

### Use Case Template

```
### Use Case [N]: [Title]
**Trigger**: [When/why this is invoked]
**Context**: [What situation exists]
**Goal**: [What should be accomplished]
**User**: [Who is using it]
**Example**: [Concrete example scenario]
```

### Common Use Case Patterns

- **Setup/Initialization**: Getting started with something
- **Execution/Operation**: Performing a core task
- **Validation/Review**: Checking quality or correctness
- **Maintenance/Update**: Keeping something current
- **Troubleshooting**: Fixing issues or problems

## Step 4: Gather Requirements

### Requirements Categories

**Functional Requirements**:
- What the skill/workflow must do
- Specific steps or actions required
- Inputs needed and outputs expected

**Non-Functional Requirements**:
- Performance characteristics
- Error handling needs
- Security considerations
- Compatibility requirements

**Context Requirements**:
- What information the AI agent needs
- What files or resources must be available
- What state must exist before invocation

### Supporting Materials Inventory

Identify what supporting files are needed:
- **Templates**: Code templates, file templates, configuration templates
- **Scripts**: Shell scripts, build scripts, utility scripts
- **Checklists**: Step-by-step checklists, validation checklists
- **Reference Docs**: API docs, architecture docs, process docs
- **Examples**: Sample inputs, sample outputs, example scenarios

### Progressive Disclosure Planning

Plan how to organize information:
- **Level 1**: Name and description (always visible)
- **Level 2**: Core SKILL.md content (loaded on invocation)
- **Level 3**: Supporting files (loaded as needed)
- **Level 4**: Rarely used context (loaded only in specific scenarios)

## Step 5: Design Progressive Disclosure Structure

### Progressive Disclosure Principles

Based on agent skills design principles:
- Start with minimal context (name + description)
- Load more detail only when needed
- Split large content into separate files
- Reference supporting files by name from SKILL.md
- Keep paths separate for mutually exclusive contexts

### Structure Design

**For Skills**:
```
skill-directory/
├── SKILL.md              # Core content (Level 2)
├── reference.md          # Reference material (Level 3)
├── templates/            # Templates (Level 3)
│   ├── template1.md
│   └── template2.md
└── scripts/              # Scripts (Level 3)
    ├── script1.sh
    └── script2.sh
```

**For Workflows**:
```
workflow.md              # Single file with all content
```

### File Organization Guidelines

- Keep SKILL.md focused on core workflow
- Move detailed reference material to separate files
- Group related files in subdirectories
- Use clear, descriptive filenames
- Reference files with relative paths from SKILL.md

### Content Splitting Criteria

Split into separate files when:
- Content exceeds 200-300 lines
- Content is only relevant in specific scenarios
- Content is mutually exclusive with other content
- Content can be reused across multiple skills
- Content is better presented as code or structured data

### Reference Strategy

From SKILL.md, reference files using:
- Clear section headers indicating what file contains
- Relative paths to supporting files
- Context about when to read each file
- Instructions on how to use referenced content
