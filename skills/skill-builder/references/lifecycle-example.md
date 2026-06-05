# Skill Builder - Full Lifecycle Example

This document provides a concrete example of the complete skill/workflow development lifecycle.

## Scenario: Creating a "deployment-skill" for automating web application deployments

### Step 1 - Create with skill-builder

```
/skill-builder
```

- Follow Steps 0-20 to create the skill
- Define purpose: "Automate web application deployment to production environments"
- Create SKILL.md with proper YAML frontmatter
- Add supporting files (templates, scripts, reference docs)
- Validate and refine the skill

### Step 2 - Review with skill-review (first pass)

```
/skill-review skills/deployment-skill
```

- Review identifies: ambiguous step in "Configure Environment" section
- Fix: Add specific commands and file paths
- Update version to 1.0.1

### Step 3 - Review with skill-review (second pass)

```
/skill-review skills/deployment-skill
```

- Review identifies: missing error handling for Docker failures
- Fix: Add error handling section with recovery procedures
- Update version to 1.0.2

### Step 4 - Review with skill-review (third pass)

```
/skill-review skills/deployment-skill
```

- Review identifies: progressive disclosure could be improved
- Fix: Move detailed Docker reference to separate file
- Update version to 1.1.0

### Step 5 - Test and install

- Test skill with realistic deployment scenarios
- Verify automatic invocation works correctly
- Install in target environment
- Monitor usage and collect feedback

### Step 6 - Iterate based on usage

- Run `/skill-review` again if issues are discovered
- Update based on user feedback
- Increment version appropriately

## Key Takeaways

This iterative approach ensures high-quality skills that:
- Meet current standards from the start
- Work reliably in practice
- Improve over time based on real usage
- Maintain quality through continuous review

## Recommended Review Cadence

- **Initial creation**: Use skill-builder to create the skill/workflow
- **First review**: Run skill-review immediately after creation
- **Second review**: Run skill-review after addressing first review findings
- **Third review**: Run skill-review after addressing second review findings
- **Ongoing**: Run skill-review periodically or when issues are discovered
- **After major changes**: Run skill-review after significant updates

This multi-pass review approach catches issues at different levels of granularity and ensures comprehensive quality.
