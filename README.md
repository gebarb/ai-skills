# Cascade Skills

A collection of reusable workflows and documentation for Cascade AI development.

## Overview

This repository contains skills/workflows that can be used with Cascade AI to streamline development processes. These skills are designed to be copied to your local Cascade/Windsurf configuration directory for immediate use.

## Available Skills

### `/specs-create`
**Description**: Create comprehensive design and spec plans for a project with phases and implementation details.

**Use Case**: When starting a new project or when you need to create detailed specifications with phased implementation plans.

**Features**:
- Project overview gathering
- Phase organization (sequential, categorized, or custom)
- Detailed phase definition with implementation tasks
- Technical requirements and success criteria
- Validation and quality assessment
- Iteration mode for refinements

**File**: `workflows/specs-create.md`

### `/specs-validate`
**Description**: Validate specs through comprehensive multi-perspective review before implementation.

**Use Case**: When you have completed spec creation and want to validate them before implementation to identify issues, bugs, or gaps.

**Features**:
- Multi-perspective review (3 subagents: Technical/Architecture, Implementation Feasibility, Completeness/Gaps)
- Comprehensive issue identification and prioritization
- Health scoring and readiness assessment
- User interaction for feedback and decisions
- Implementation of approved changes
- Re-validation of modified specs

**File**: `workflows/specs-validate.md`

### `/specs-implement`
**Description**: Implement specs and phases from a repository with progress tracking and user confirmation.

**Use Case**: When you have existing specs in a `specs/` directory and want to implement them systematically.

**Features**:
- Progress tracking with `.specs-progress.json`
- Phase selection (all phases, specific phase, or resume from progress)
- Dependency resolution
- Parallel phase support
- Implementation checkpoints for rollback
- Code quality checks and testing
- User confirmation between phases

**File**: `workflows/specs-implement.md`

### `/skill-builder`
**Description**: Walk through creating a highly performant and accurate AI skill/workflow that follows Windsurf and Anthropic best practices and standards.

**Use Case**: When creating new skills or workflows for Cascade/Windsurf to ensure they follow best practices and are optimized for successful execution.

**Features**:
- Skill vs workflow decision framework
- Progressive disclosure structure design
- Windsurf and Anthropic standards compliance
- Comprehensive validation and testing
- Iterative refinement process
- Templates and guidelines

**File**: `workflows/skill-builder.md`

### `/skill-review`
**Description**: Perform comprehensive 3-perspective review of AI skills/workflows with fresh context to ensure standards compliance and optimize execution success.

**Use Case**: When reviewing and refining skills/workflows after creation or modification. Run 3+ times for optimal results.

**Features**:
- Three distinct analytical perspectives (Standards, Execution, Completeness)
- Fresh context for each review iteration
- Comprehensive issue identification and prioritization
- User interaction for feedback and decisions
- Implementation of approved changes
- Re-validation and finalization

**File**: `workflows/skill-review.md`

## Installation

### Quick Install

Run the installation script to copy all skills to the global directory for your AI agent:

```bash
./install.sh
```

The script will prompt you to select your AI agent (Windsurf or Claude) and copy the workflows and docs to the appropriate directories, making them available in every workspace on your machine.

**Supported Agents:**
- **Windsurf**: Workflows to `~/.codeium/windsurf/global_workflows/`, Docs to `~/.codeium/windsurf/docs/`
- **Claude**: Workflows to `~/.claude/workflows/`, Docs to `~/.claude/docs/`

### Manual Installation

For Windsurf:
1. Copy the workflow files to the global Windsurf workflows directory:
   ```bash
   mkdir -p ~/.codeium/windsurf/global_workflows
   cp -r workflows/* ~/.codeium/windsurf/global_workflows/
   ```

2. Copy the documentation files to the global Windsurf docs directory:
   ```bash
   mkdir -p ~/.codeium/windsurf/docs
   cp -r docs/* ~/.codeium/windsurf/docs/
   ```

For Claude:
1. Copy the workflow files to the Claude workflows directory:
   ```bash
   mkdir -p ~/.claude/workflows
   cp -r workflows/* ~/.claude/workflows/
   ```

2. Copy the documentation files to the Claude docs directory:
   ```bash
   mkdir -p ~/.claude/docs
   cp -r docs/* ~/.claude/docs/
   ```

### Path Resolution

Workflow files use **placeholder paths** (`{{DOCS_DIR}}`) that are replaced with absolute paths during installation. This ensures compatibility across different AI agents and execution contexts:

- **Source files** in this repository use `{{DOCS_DIR}}` placeholders
- **During installation**, the install.sh script replaces `{{DOCS_DIR}}` with the actual absolute path to the docs directory for the selected agent
- **Installed files** contain absolute paths (e.g., `~/.codeium/windsurf/docs/` or `~/.claude/docs/`) that work regardless of where the AI agent executes from

This approach ensures that paths are correct whether the agent executes from the workflows directory, the repository root, or any other location.

## Usage

Once installed, use the skills directly in Cascade by typing the slash command:

```
/specs-create
```

Then validate your specs:

```
/specs-validate
```

Finally, implement your validated specs:

```
/specs-implement
```

For creating new skills or workflows:

```
/skill-builder
```

For reviewing and refining skills/workflows:

```
/skill-review
```

## Directory Structure

```
cascade-skills/
├── README.md              # This file
├── install.sh            # Installation script
├── workflows/            # Workflow/skill definitions
│   ├── specs-create.md   # Spec creation workflow
│   ├── specs-validate.md # Spec validation workflow
│   ├── specs-implement.md # Spec implementation workflow
│   ├── skill-builder.md  # Skill/workflow creation workflow
│   └── skill-review.md   # Skill/workflow review workflow
└── docs/                 # Reference documentation
    ├── specs-create/  # Spec creation references
    │   ├── guidelines.md
    │   ├── maintenance.md
    │   ├── templates.md
    │   ├── execution.md
    │   └── planning.md
    ├── specs-implement/  # Spec implementation references
    │   ├── handling.md
    │   ├── progress.md
    │   ├── setup.md
    │   └── implementation.md
    └── specs-validate/  # Spec validation references
        ├── guidelines.md
        ├── initial.md
        ├── interaction.md
        ├── finalization.md
        ├── review.md
        ├── synthesis.md
        └── templates.md
```

## Contributing

To add a new skill:

1. Create a new markdown file in the `workflows/` directory
2. Follow the naming convention: `skill-name.md`
3. Add the YAML frontmatter with a description:
   ```yaml
   ---
   description: Brief description of what this skill does
   ---
   ```
4. Update this README with the new skill details
5. Submit a pull request

## License

This repository is public and intended for use with Cascade AI. Feel free to use, modify, and distribute these skills as needed.

## Support

For issues or questions about these skills, please open an issue in this repository.
