# Step 4: Requirements

## Functional Requirements
- Analyze git history to detect changes between current branch and target branch
- Determine if a PR already exists for the current branch
- Create a new PR if one doesn't exist
- Update an existing PR if one already exists
- Generate comprehensive PR description including:
  - Summary of changes
  - File-by-file breakdown
  - Context for reviewers
  - Testing recommendations
  - Breaking changes (if any)
- Perform fresh analysis on each invocation with no context pollution
- Handle both initial and follow-up invocations within a session

## Non-Functional Requirements
- Performance: Should complete analysis within 30 seconds for typical branch changes
- Error handling: Gracefully handle missing git history, API failures, permission issues
- Idempotency: Multiple invocations should produce consistent results
- Fresh analysis: Each invocation must analyze git history from scratch, not reuse previous context

## Context Requirements
- Git repository must be initialized and accessible
- Current branch must exist
- Target branch (e.g., main, develop) must exist
- Git history must be available for analysis
- PR creation/update API must be accessible (GitHub CLI, GitLab CLI, or similar)
- User must have appropriate permissions to create/update PRs

## Supporting Materials Inventory

### Templates
- PR description template (markdown format)
- Change summary template
- File breakdown template

### Scripts
- Git analysis script (to detect changes)
- PR existence check script
- PR creation script
- PR update script

### Reference Docs
- Git commands reference
- PR API documentation (GitHub/GitLab)
- Markdown formatting guide for PR descriptions

### Examples
- Sample PR description output
- Example git history analysis
- Example change detection output

## Progressive Disclosure Planning

### Level 1: Always Visible (Metadata)
- Skill name: pr-creator
- Skill description: When to trigger and what it does

### Level 2: Core SKILL.md Content (Loaded on Invocation)
- Main workflow steps
- Git analysis instructions
- PR creation/update logic
- Error handling procedures

### Level 3: Supporting Files (Loaded as Needed)
- references/pr-description-template.md - Template for PR descriptions
- references/git-commands.md - Git command reference
- references/api-commands.md - PR API command reference
- examples/sample-pr-description.md - Example output

### Level 4: Rarely Used Context
- Advanced troubleshooting scenarios
- Platform-specific configurations
- Custom template modifications
