# Step 3: Use Cases

### Use Case 1: Initial PR Creation
**Trigger**: User has made changes on a feature branch and wants to create a PR
**Context**: Branch has commits that need to be reviewed, no PR exists yet
**Goal**: Create a new PR with comprehensive description based on branch changes
**User**: Developer working on a feature
**Example**: Developer completes work on `feature/user-authentication` branch and runs the skill to create a PR

### Use Case 2: PR Description Update
**Trigger**: User makes additional changes to the branch and wants to update the PR description
**Context**: PR already exists, branch has new commits since PR was created
**Goal**: Update existing PR description with fresh analysis of all changes
**User**: Developer iterating on a feature
**Example**: Developer adds more commits to `feature/user-authentication` and runs the skill again to update the PR description

### Use Case 3: Follow-up Session Update
**Trigger**: User invokes the skill again in the same session after initial PR creation
**Context**: PR exists, skill was previously invoked in the same session
**Goal**: Re-analyze git history with no context pollution and update PR description
**User**: Developer in an ongoing coding session
**Example**: After creating a PR, developer makes more changes and invokes the skill again to update the description with fresh analysis

### Use Case 4: Manual Invocation for Existing Branch
**Trigger**: User explicitly @mentions the skill for an existing branch with an existing PR
**Context**: Branch and PR both exist, user wants to refresh the description
**Goal**: Perform fresh analysis and update PR description
**User**: Developer wanting to ensure PR description is current
**Example**: Developer types "@pr-creator" to refresh the PR description for their current branch
