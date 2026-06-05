# Skill Builder - Troubleshooting

This document provides troubleshooting guidance for common issues encountered during the skill-builder workflow.

## Common Issues

### Issue: Step 0 web searches fail or time out
**Solution**: Use the fallback mechanism - proceed with `references/guidelines.md` as a baseline and document the limitation
**Prevention**: Ensure you have internet access before starting Step 0

### Issue: SKILL.md becomes too long (>300 lines)
**Solution**: Move detailed content to supporting reference files using progressive disclosure principles
**Prevention**: Plan progressive disclosure structure in Step 5

### Issue: Unclear whether to create a Skill or Workflow
**Solution**: Use the decision framework in `references/planning.md` Step 1
**Key question**: Should the AI agent invoke this automatically? If yes → Skill, if no → Workflow

### Issue: Validation checklists reveal many issues
**Solution**: Prioritize critical and high-priority issues first, iterate through refinement phase
**Prevention**: Follow creation phase guidelines carefully and self-review as you go

### Issue: Supporting files are missing or not loading
**Solution**: Create missing files using templates in `references/templates.md`
**Prevention**: Verify file structure in Step 6 and reference paths in SKILL.md

### Issue: Skill/workflow doesn't trigger as expected
**Solution**: Review name and description in YAML frontmatter - ensure they are clear and specific
**Prevention**: Test triggering during Step 21 testing phase

### Issue: Getting stuck on a specific step
**Solution**: Consult the relevant reference file for that phase (planning.md, creation.md, validation.md, or refinement.md)
**Alternative**: Skip to the next phase and return later with fresh perspective

## Getting Help

If you encounter issues not covered above:
- Review the relevant reference file for the phase you're in
- Run `/skill-review` on your skill/workflow for additional guidance
- Consult the examples in `references/templates.md`
- Check the guidelines in `references/guidelines.md`
