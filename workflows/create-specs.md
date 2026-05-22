---
name: create-specs
description: Create comprehensive design and spec plans for a project with phases and implementation details
---

# Spec Creation Workflow

This workflow guides you through creating a comprehensive design and spec plan for your project. It generates a `specs/` directory with a README.md and individual phase files based on your project requirements.

## Prerequisites

- Clear understanding of your project's goals and features
- Basic knowledge of the technology stack you'll use
- Ideas about how to break down the project into phases

## Platform Requirements

This workflow uses bash scripts for quality score calculation and validation. The following are required:
- Bash shell (version 4.0+ recommended for advanced features)
- Standard Unix tools: awk, grep, find, wc, sed
- jq (recommended for JSON parsing, fallback methods available)
- Access to the repository root directory

For systems without bash or with older bash versions, some automated features may require manual intervention.

## Usage

Run this workflow from the root of your repository:

```
/create-specs
```

## Workflow Steps

The complete workflow is split into two phases to keep each document under 500 lines:

### Planning Phase (Steps 1-5)
See `docs/specs-references/create-specs-planning.md` for:
1. Repository Review (Required First Step)
2. New Codebase Detection and Technology Guidance
3. Project Overview Gathering
4. Phase Organization Strategy
5. Phase Definition

### Execution Phase (Steps 6-13)
See `docs/specs-references/create-specs-execution.md` for:
6. Phase Detail Gathering
7. README.md Generation
8. Validate Spec Structure
9. Spec Readiness Assessment
10. File Generation
11. Review and Refine
12. Iteration Mode
13. Finalization

## Reference Materials

For detailed templates, maintenance strategies, and guidelines, see:
- **Planning Phase**: `docs/specs-references/create-specs-planning.md` - Steps 1-5
- **Execution Phase**: `docs/specs-references/create-specs-execution.md` - Steps 6-13
- **Templates**: `docs/specs-references/create-specs-templates.md` - Phase file and README templates
- **Maintenance**: `docs/specs-references/create-specs-maintenance.md` - Migration, versioning, and import/export
- **Guidelines**: `docs/specs-references/create-specs-guidelines.md` - Best practices and quality metrics
