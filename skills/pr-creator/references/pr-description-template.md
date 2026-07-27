# PR Description Template

Use this template when generating PR descriptions. Adapt the content based on the actual changes detected in the git history.

## Summary

[Provide a high-level overview of the changes. Include what was done and why it was done. Keep this concise but informative.]

Example:
This PR adds user authentication functionality using JWT tokens. It includes login/logout endpoints, token validation middleware, and user session management.

## Changes

### Added Files
- `path/to/new/file1.ts`: [Brief description of what this file does]
- `path/to/new/file2.ts`: [Brief description of what this file does]

### Modified Files
- `path/to/modified/file1.ts`: [Description of changes made]
- `path/to/modified/file2.ts`: [Description of changes made]

### Deleted Files
- `path/to/deleted/file1.ts`: [Reason for deletion]

## Testing

[Provide instructions on how to test the changes. Include specific test cases or scenarios.]

Example:
- Test login with valid credentials
- Test login with invalid credentials
- Verify token validation middleware
- Test logout functionality
- Check session management

## Breaking Changes

[List any breaking changes. If there are none, state "No breaking changes."]

Example:
- This PR changes the authentication API structure. Existing clients will need to update their authentication flow.

## Context for Reviewers

[Provide additional context that might help reviewers understand the changes. Include design decisions, trade-offs, or relevant background information.]

Example:
- JWT tokens were chosen over session-based auth for better scalability
- Token expiration is set to 24 hours for security
- Refresh tokens are implemented for better user experience
