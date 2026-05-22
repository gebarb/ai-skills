# Cascade Skills

A collection of reusable workflows and documentation for Cascade AI development.

## Overview

This repository contains skills/workflows that can be used with Cascade AI to streamline development processes. These skills are designed to be copied to your local Cascade/Windsurf configuration directory for immediate use.

## Available Skills

### `/create-specs`
**Description**: Create comprehensive design and spec plans for a project with phases and implementation details.

**Use Case**: When starting a new project or when you need to create detailed specifications with phased implementation plans.

**Features**:
- Project overview gathering
- Phase organization (sequential, categorized, or custom)
- Detailed phase definition with implementation tasks
- Technical requirements and success criteria
- Validation and quality assessment
- Iteration mode for refinements

**File**: `workflows/create-specs.md`

### `/implement-specs`
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

**File**: `workflows/implement-specs.md`

## Installation

### Quick Install

Run the installation script to copy all skills to the global Windsurf directory:

```bash
./install.sh
```

This will copy the workflows to `~/.codeium/windsurf/global_workflows/` and the docs to `~/.codeium/windsurf/docs/`, making them available in every workspace on your machine.

### Manual Installation

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

## Usage

Once installed, use the skills directly in Cascade by typing the slash command:

```
/create-specs
```

or

```
/implement-specs
```

## Directory Structure

```
cascade-skills/
├── README.md              # This file
├── install.sh            # Installation script
├── workflows/            # Workflow/skill definitions
│   ├── create-specs.md   # Spec creation workflow
│   └── implement-specs.md # Spec implementation workflow
└── docs/                 # Reference documentation
    └── specs-references/ # Detailed reference materials for spec workflows
        ├── create-specs-guidelines.md
        ├── create-specs-maintenance.md
        ├── create-specs-templates.md
        ├── implement-specs-handling.md
        └── implement-specs-progress.md
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
