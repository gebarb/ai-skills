---
name: pr-creator
description: Automatically creates or updates pull requests with comprehensive descriptions based on branch changes. Use this skill whenever the user mentions creating a PR, updating a PR description, wants to summarize branch changes, needs to document their work for review, or asks for PR automation. Always invoke when git history analysis is needed for PR documentation.
version: 1.0.0
license: MIT
compatibility: Requires git, GitHub CLI (gh) or GitLab CLI (glab), and repository write access
---

# PR Creator

This skill automatically creates or updates pull requests with comprehensive descriptions by analyzing git history, detecting changes, and generating detailed PR documentation. Each invocation performs a fresh analysis with no context pollution, ensuring accurate descriptions on both initial creation and follow-up updates.

## When to Use This Skill

Invoke this skill when:
- User wants to create a PR for their current branch
- User needs to update an existing PR description
- User mentions summarizing branch changes
- User asks for PR automation or documentation
- User wants to document their work for code review
- User has made additional commits and wants to refresh the PR description

## Prerequisites

Before invoking this skill, verify:
- Git repository is initialized and accessible
- Current branch exists and has commits
- Target branch (e.g., main, develop) exists
- GitHub CLI (gh) or GitLab CLI (glab) is installed and authenticated
- User has write permissions to create/update PRs
- Git history is available for analysis

## Workflow Steps

### Step 1: Detect Current Branch and Target Branch

Identify the current branch and determine the appropriate target branch:
- Run `git branch --show-current` to get the current branch name
- Determine target branch (usually `main` or `develop`)
- If target branch is ambiguous, ask the user to specify

**If this fails:**
- Not in a git repository: Ask user to initialize git or navigate to a git repository
- No current branch: Ask user to checkout or create a branch
- Target branch doesn't exist: Ask user to specify the target branch

### Step 2: Analyze Git History for Changes

Perform a fresh analysis of git history to detect changes:
- Run `git log target..current --oneline` to get commit list
- Run `git diff target..current --stat` to get file change statistics
- Run `git diff target..current` to get detailed diff for each changed file
- Identify added, modified, and deleted files
- Note any breaking changes or significant refactoring

**Important**: Always perform fresh analysis on each invocation. Do not reuse previous context or cached analysis results.

**If this fails:**
- No commits found: Inform user that branch has no changes compared to target
- Git history unavailable: Ask user to ensure git history is accessible
- Large diff or truncated output: When `git diff target..current` output is truncated or too large, run `git diff target..current -- filepath` for each modified file individually to capture complete changes. Always check for truncation indicators and analyze specific files when needed.

### Step 3: Check if PR Already Exists

Determine if a PR already exists for the current branch:
- For GitHub: Run `gh pr list --head current-branch-name --json number,title,body`
- For GitLab: Run `glab mr list --source-branch current-branch-name`
- Check if any PR/MR is returned for the current branch

**If this fails:**
- CLI not authenticated: Ask user to authenticate with `gh auth login` or `glab auth login`
- API error: Inform user of the error and suggest manual PR creation
- Platform detection fails: Ask user which platform they're using (GitHub/GitLab)

### Step 4: Generate PR Description

Generate a comprehensive PR description based on the git analysis:
- Read `references/pr-description-template.md` for the template structure
- Include a summary of changes (what was done and why)
- List all changed files with brief descriptions of their purpose
- Highlight breaking changes or significant modifications
- Provide testing recommendations
- Include any relevant context for reviewers

For the PR description structure, use this format:
- **Summary**: High-level overview of changes
- **Changes**: File-by-file breakdown
- **Testing**: How to test the changes
- **Breaking Changes**: Any breaking changes (if applicable)
- **Context**: Additional context for reviewers

**If this fails:**
- Template file missing: Use the standard PR description format shown in examples
- Unable to analyze changes: Inform user and ask for manual description input

### Step 5: Create or Update PR

Based on whether a PR exists:

**If PR does not exist:**
- Create a new PR using the generated description
- For GitHub: Run `gh pr create --base target-branch --title "PR Title" --body "PR Description"`
- For GitLab: Run `glab mr create --source-branch current-branch --target-branch target-branch --title "MR Title" --description "MR Description"`
- Use a descriptive title based on the changes (e.g., "feat: add user authentication" or "fix: resolve login bug")

**If PR already exists:**
- Update the existing PR with the fresh description
- For GitHub: Run `gh pr edit pr-number --body "Updated PR Description"`
- For GitLab: Run `glab mr edit mr-number --description "Updated MR Description"`
- Ensure the update reflects all changes including new commits since the PR was created

**If this fails:**
- Permission denied: Inform user they don't have write access
- API rate limit: Inform user and suggest manual update
- Invalid branch: Ask user to verify branch names

### Step 6: Verify and Report

Verify the PR was created or updated successfully:
- Confirm the PR exists and is accessible
- Check that the description was applied correctly
- Report the PR URL to the user
- Provide a summary of what was done

**If this fails:**
- PR not found: Inform user and suggest manual verification
- Description not updated: Inform user and suggest manual edit

## Supporting Files

### references/pr-description-template.md
Contains the template structure for PR descriptions. Read this when generating the PR description to ensure consistent formatting.

### references/git-commands.md
Contains git commands for change detection and analysis. Read this when you need specific git commands for analyzing changes.

### references/api-commands.md
Contains CLI commands for PR creation and update on GitHub and GitLab. Read this when you need platform-specific API commands.

### examples/sample-pr-description.md
Contains an example of a complete PR description. Read this to understand the expected output format.

## Error Handling

### Common Issues and Solutions

**Issue: Git history not available**
- Cause: Repository is not initialized or git is not accessible
- Solution: Ask user to initialize git or navigate to a valid git repository

**Issue: No changes detected**
- Cause: Branch has no commits compared to target branch
- Solution: Inform user that there are no changes to create a PR for

**Issue: CLI not authenticated**
- Cause: GitHub CLI or GitLab CLI is not authenticated
- Solution: Ask user to run `gh auth login` or `glab auth login`

**Issue: Permission denied**
- Cause: User doesn't have write access to create/update PRs
- Solution: Inform user of permission issue and suggest manual PR creation

**Issue: PR creation fails**
- Cause: API error, network issue, or invalid parameters
- Solution: Inform user of the specific error and suggest manual PR creation

## Examples

### Basic Usage: Creating a New PR

**Scenario**: User has completed work on `feature/user-authentication` branch and wants to create a PR

**Steps**:
1. Detect current branch: `feature/user-authentication`
2. Determine target branch: `main`
3. Analyze git history: Found 5 commits with changes to auth files
4. Check PR existence: No PR exists
5. Generate PR description with summary of auth changes
6. Create PR: `gh pr create --base main --title "feat: add user authentication" --body "[generated description]"`
7. Report PR URL to user

**Expected output**: PR created successfully with comprehensive description

### Update Usage: Refreshing PR Description

**Scenario**: User has added more commits to an existing PR and wants to update the description

**Steps**:
1. Detect current branch: `feature/user-authentication`
2. Determine target branch: `main`
3. Analyze git history: Found 8 commits (3 new since PR creation)
4. Check PR existence: PR #123 exists
5. Generate updated PR description with all 8 commits
6. Update PR: `gh pr edit 123 --body "[updated description]"`
7. Report successful update to user

**Expected output**: PR description updated with fresh analysis including new commits

### Follow-up Session Update

**Scenario**: User invokes the skill again in the same session after initial PR creation

**Steps**:
1. Perform fresh git analysis (no context pollution from previous invocation)
2. Check PR existence: PR exists from previous invocation
3. Generate new description based on current git state
4. Update PR with fresh description
5. Report successful update

**Expected output**: PR updated with accurate description based on current git state

## Platform Detection

This skill supports both GitHub and GitLab. It automatically detects the platform:
- If `gh` is available and authenticated, use GitHub
- If `glab` is available and authenticated, use GitLab
- If both are available, prefer GitHub unless user specifies otherwise
- If neither is available, ask user to install and authenticate the appropriate CLI
