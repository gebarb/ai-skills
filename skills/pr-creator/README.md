# PR Creator

Automatically creates or updates pull requests with comprehensive descriptions based on branch changes. This skill analyzes git history, detects changes, and generates detailed PR documentation with fresh analysis on each invocation.

## Overview

The PR Creator skill automates the process of creating and updating pull requests with comprehensive descriptions. It performs fresh git analysis on each invocation to ensure accurate descriptions, handles both initial PR creation and updates to existing PRs, and supports both GitHub and GitLab platforms.

**Key Features:**
- Automatic PR creation based on branch changes
- PR description updates with fresh analysis
- Support for GitHub and GitLab platforms
- Comprehensive change detection and documentation
- Fresh analysis on each invocation (no context pollution)
- Handles both initial and follow-up invocations

## Quick Start

To get started immediately:

1. Ensure you have git and either GitHub CLI (`gh`) or GitLab CLI (`glab`) installed and authenticated
2. Navigate to your git repository
3. Make changes on a feature branch
4. Invoke the skill by mentioning it or letting it trigger automatically based on context
5. The skill will analyze your changes and create or update the PR with a comprehensive description

## Usage

### Automatic Invocation

The skill automatically triggers when:
- You mention creating a PR
- You want to update a PR description
- You need to summarize branch changes
- You ask for PR automation or documentation
- You want to document your work for code review

### Manual Invocation

You can manually invoke the skill using:
```
@pr-creator
```

### Prerequisites

Before using this skill, ensure:
- Git repository is initialized and accessible
- Current branch exists and has commits
- Target branch (e.g., main, develop) exists
- GitHub CLI (gh) or GitLab CLI (glab) is installed and authenticated
- You have write permissions to create/update PRs
- Git history is available for analysis

## Examples

### Basic Usage: Creating a New PR

**Scenario**: You've completed work on `feature/user-authentication` branch and want to create a PR

**Steps**:
1. The skill detects your current branch
2. Analyzes git history for changes
3. Checks if a PR already exists
4. Generates a comprehensive PR description
5. Creates a new PR with the description
6. Reports the PR URL to you

**Expected output**: PR created successfully with comprehensive description including summary, file changes, testing recommendations, and context for reviewers.

### Update Usage: Refreshing PR Description

**Scenario**: You've added more commits to an existing PR and want to update the description

**Steps**:
1. The skill performs fresh git analysis
2. Detects that a PR already exists
3. Generates an updated PR description with all commits
4. Updates the existing PR with the fresh description
5. Reports successful update

**Expected output**: PR description updated with accurate description based on current git state.

### Follow-up Session Update

**Scenario**: You invoke the skill again in the same session after initial PR creation

**Steps**:
1. The skill performs fresh git analysis (no context pollution)
2. Checks PR existence
3. Generates new description based on current git state
4. Updates PR with fresh description
5. Reports successful update

**Expected output**: PR updated with accurate description reflecting all changes.

## Workflow Steps

The skill follows these steps:

1. **Detect Current Branch and Target Branch** - Identify the current branch and determine the appropriate target branch
2. **Analyze Git History for Changes** - Perform fresh analysis of git history to detect changes
3. **Check if PR Already Exists** - Determine if a PR already exists for the current branch
4. **Generate PR Description** - Generate a comprehensive PR description based on the git analysis
5. **Create or Update PR** - Create a new PR or update an existing PR based on the analysis
6. **Verify and Report** - Verify the PR was created or updated successfully and report the result

## Platform Support

The skill supports both GitHub and GitLab:
- **GitHub**: Uses GitHub CLI (`gh`) for PR operations
- **GitLab**: Uses GitLab CLI (`glab`) for merge request operations

The skill automatically detects which platform you're using based on:
- Available CLI tools
- Git remote URLs

## Troubleshooting

### Common Issues

**Issue: Git history not available**
- **Cause**: Repository is not initialized or git is not accessible
- **Solution**: Ensure you're in a git repository with accessible history

**Issue: No changes detected**
- **Cause**: Branch has no commits compared to target branch
- **Solution**: Make changes to your branch before creating a PR

**Issue: CLI not authenticated**
- **Cause**: GitHub CLI or GitLab CLI is not authenticated
- **Solution**: Run `gh auth login` or `glab auth login`

**Issue: Permission denied**
- **Cause**: You don't have write access to create/update PRs
- **Solution**: Verify you have appropriate permissions or contact repository admin

**Issue: PR creation fails**
- **Cause**: API error, network issue, or invalid parameters
- **Solution**: Check the specific error message and retry or create PR manually

For more detailed troubleshooting, see the Error Handling section in SKILL.md.

## File Structure

```
skills/pr-creator/
├── SKILL.md                      # Core skill content
├── README.md                     # This file
├── references/                   # Reference documentation
│   ├── pr-description-template.md
│   ├── git-commands.md
│   └── api-commands.md
├── examples/                     # Example outputs
│   └── sample-pr-description.md
├── evals/                        # Test cases
│   └── evals.json
└── step*.md                      # Planning and validation documents
```

## Contributing

To contribute improvements to this skill:
1. Test the skill with your use cases
2. Identify areas for improvement
3. Make changes following the skill-builder workflow
4. Update documentation as needed
5. Test thoroughly before submitting changes

## License

MIT License - See LICENSE file for details
