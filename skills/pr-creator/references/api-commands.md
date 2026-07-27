# PR API Commands Reference

This document contains CLI commands for creating and updating pull requests on GitHub and GitLab.

## GitHub CLI (gh)

### Check Authentication
```bash
gh auth status
```
Verifies that gh is authenticated.

### List PRs for Current Branch
```bash
gh pr list --head branch-name --json number,title,body
```
Lists PRs for a specific branch with JSON output.

Example:
```bash
gh pr list --head feature/user-auth --json number,title,body
```

### Create a New PR
```bash
gh pr create --base target-branch --title "PR Title" --body "PR Description"
```
Creates a new PR from the current branch.

Example:
```bash
gh pr create --base main --title "feat: add user authentication" --body "## Summary\nThis PR adds user authentication..."
```

### Create PR with Draft
```bash
gh pr create --base target-branch --title "PR Title" --body "PR Description" --draft
```
Creates a draft PR.

### Update PR Description
```bash
gh pr edit pr-number --body "Updated PR Description"
```
Updates the description of an existing PR.

Example:
```bash
gh pr edit 123 --body "## Summary\nUpdated description with new changes..."
```

### Update PR Title
```bash
gh pr edit pr-number --title "New Title"
```
Updates the title of an existing PR.

### Get PR Details
```bash
gh pr view pr-number
```
Shows details of a specific PR.

### Get PR URL
```bash
gh pr view pr-number --json url
```
Gets the URL of a specific PR.

## GitLab CLI (glab)

### Check Authentication
```bash
glab auth status
```
Verifies that glab is authenticated.

### List MRs for Current Branch
```bash
glab mr list --source-branch branch-name
```
Lists merge requests for a specific branch.

Example:
```bash
glab mr list --source-branch feature/user-auth
```

### Create a New MR
```bash
glab mr create --source-branch current-branch --target-branch target-branch --title "MR Title" --description "MR Description"
```
Creates a new merge request.

Example:
```bash
glab mr create --source-branch feature/user-auth --target-branch main --title "feat: add user authentication" --description "## Summary\nThis MR adds user authentication..."
```

### Create MR with Draft
```bash
glab mr create --source-branch current-branch --target-branch target-branch --title "MR Title" --description "MR Description" --draft
```
Creates a draft merge request.

### Update MR Description
```bash
glab mr edit mr-number --description "Updated MR Description"
```
Updates the description of an existing MR.

Example:
```bash
glab mr edit 123 --description "## Summary\nUpdated description with new changes..."
```

### Update MR Title
```bash
glab mr edit mr-number --title "New Title"
```
Updates the title of an existing MR.

### Get MR Details
```bash
glab mr view mr-number
```
Shows details of a specific merge request.

### Get MR URL
```bash
glab mr view mr-number --web
```
Opens the MR in a web browser.

## Platform Detection

### Detect Available CLIs
```bash
# Check if gh is available
which gh

# Check if glab is available
which glab
```

### Detect Git Remote
```bash
git remote -v
```
Shows the git remote URLs to determine if using GitHub or GitLab.

- GitHub URLs contain `github.com`
- GitLab URLs contain `gitlab.com`

## Error Handling

### Common GitHub CLI Errors
- **Not authenticated**: Run `gh auth login`
- **Repository not found**: Verify repository exists and you have access
- **Permission denied**: Verify you have write access to the repository

### Common GitLab CLI Errors
- **Not authenticated**: Run `glab auth login`
- **Project not found**: Verify project exists and you have access
- **Permission denied**: Verify you have write access to the project

## Best Practices

1. Always check authentication before attempting PR operations
2. Use JSON output for programmatic parsing
3. Include descriptive titles that follow commit message conventions
4. Use markdown formatting in descriptions for better readability
5. Test commands with dry-run flags if available
