# Git Commands Reference

This document contains git commands used for analyzing branch changes and history.

## Branch Detection

### Get Current Branch
```bash
git branch --show-current
```
Returns the name of the current branch.

### List All Branches
```bash
git branch -a
```
Lists all local and remote branches.

## Change Detection

### Get Commit List
```bash
git log target..current --oneline
```
Shows commits in current branch that are not in target branch.

Example:
```bash
git log main..feature/user-auth --oneline
```

### Get File Change Statistics
```bash
git diff target..current --stat
```
Shows file change statistics (number of lines added/removed per file).

Example:
```bash
git diff main..feature/user-auth --stat
```

### Get Detailed Diff
```bash
git diff target..current
```
Shows the full diff between target and current branches.

Example:
```bash
git diff main..feature/user-auth
```

### Get Diff for Specific File
```bash
git diff target..current -- path/to/file
```
Shows diff for a specific file only.

Example:
```bash
git diff main..feature/user-auth -- src/auth/login.ts
```

### Get List of Changed Files
```bash
git diff --name-only target..current
```
Lists only the names of changed files.

Example:
```bash
git diff --name-only main..feature/user-auth
```

### Get List of Changed Files with Status
```bash
git diff --name-status target..current
```
Lists changed files with their status (added, modified, deleted).

Example:
```bash
git diff --name-status main..feature/user-auth
```

## History Analysis

### Get Commit Details
```bash
git log target..current --format="%h %s %an"
```
Shows commit hash, message, and author.

Example:
```bash
git log main..feature/user-auth --format="%h %s %an"
```

### Get Commit Count
```bash
git rev-list --count target..current
```
Counts the number of commits in current branch not in target.

Example:
```bash
git rev-list --count main..feature/user-auth
```

### Get Last N Commits
```bash
git log -n 5 --oneline
```
Shows the last 5 commits on current branch.

## Common Patterns

### Analyze All Changes
```bash
# Get commit list
git log main..feature-branch --oneline

# Get file statistics
git diff main..feature-branch --stat

# Get detailed diff for analysis
git diff main..feature-branch
```

### Quick Summary
```bash
# Get commit count
git rev-list --count main..feature-branch

# Get changed files
git diff --name-only main..feature-branch
```

### Large Repository Optimization
```bash
# Use --stat first to get overview
git diff main..feature-branch --stat

# Then analyze specific files if needed
git diff main..feature-branch -- path/to/important/file
```
