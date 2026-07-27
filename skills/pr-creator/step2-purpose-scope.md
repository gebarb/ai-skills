# Step 2: Purpose and Scope

## Purpose Statement

This skill automatically creates or updates pull requests with comprehensive descriptions based on branch changes for development teams by analyzing git history, detecting changes, and generating detailed PR descriptions that can be updated on follow-up invocations with fresh analysis.

## Scope and Boundaries

### Included
- Analyzing git history to detect changes on a branch
- Creating new PRs with comprehensive descriptions
- Updating existing PR descriptions with fresh analysis
- Handling both initial invocation and follow-up updates within a session
- Generating detailed change summaries
- Identifying affected files and their purposes
- Providing context for reviewers

### Excluded
- Merging PRs
- Adding reviewers or assignees
- Setting PR labels or milestones
- Creating draft PRs (always creates ready-for-review PRs)
- Handling PR conflicts
- Managing branch protection rules
- Interacting with CI/CD systems

### Assumptions
- Repository uses git version control
- User has write access to create/update PRs
- Branch is based on a valid target branch (e.g., main, develop)
- Git history is available and accessible
- PR creation/update API is available (GitHub, GitLab, etc.)

### Delivers
- Comprehensive PR description with:
  - Summary of changes
  - Detailed file-by-file breakdown
  - Context for reviewers
  - Testing recommendations
  - Breaking changes (if any)
- Updated PR description on follow-up invocations
