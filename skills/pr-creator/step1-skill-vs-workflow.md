# Step 1: Skill vs Workflow Decision

## Decision: Skill

**Rationale:**
- The AI agent should automatically recognize when PR creation/update is needed based on context
- Requires complex context (git history analysis, change detection) that benefits from progressive disclosure
- Should handle both initial creation and updates automatically without manual triggering
- User can still @mention for manual invocation when needed

**Why not a Workflow:**
- Not a repetitive process that users want to trigger manually every time
- Requires intelligent context analysis that benefits from automatic invocation
- Should integrate seamlessly into development workflow
