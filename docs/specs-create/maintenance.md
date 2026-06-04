---
description: Spec maintenance and versioning strategies
---

# Spec Maintenance and Versioning

This file contains strategies for maintaining and versioning specs.

## Spec Migration Strategy

When specs need to be reorganized, split, merged, or have breaking changes, follow this migration strategy:

**Phase Renaming:**
1. Update the phase file name (e.g., `phase-1-old-name.md` → `phase-1-new-name.md`)
2. Update the phase title in the file content
3. Update all references in README.md
4. Update dependency references in other phase files
5. Update `.specs-progress.json` if implementation has started
6. Document the change in CHANGELOG.md

**Phase Splitting:**
1. Create new phase file(s) for the split content
2. Move appropriate tasks from original phase to new phase(s)
3. Update dependencies for all affected phases
4. Update README.md to include new phase(s)
5. Update phase numbering if sequential
6. Document the split in CHANGELOG.md
7. If implementation has started, update progress tracking accordingly

**Phase Merging:**
1. Choose which phase file will be the merged result
2. Move all tasks from the phase being merged into the target phase
3. Update dependencies to point to the merged phase
4. Remove the obsolete phase file
5. Update README.md to remove the merged phase
6. Update phase numbering if sequential
7. Document the merge in CHANGELOG.md
8. If implementation has started, update progress tracking

**Breaking Changes:**
1. Identify all phases affected by the breaking change
2. Update affected phase files with new structure/requirements
3. Update dependencies as needed
4. Update README.md to reflect changes
5. Increment spec version (major version for breaking changes)
6. Document breaking changes in CHANGELOG.md
7. If implementation has started, assess impact on completed phases
8. May require re-implementation of affected phases

**Dependency Restructuring:**
1. Map out current dependency graph
2. Identify dependencies to add, remove, or modify
3. Update dependency declarations in phase files
4. Validate no circular dependencies are introduced
5. Update README.md dependency information
6. Document changes in CHANGELOG.md
7. If implementation has started, update progress tracking

**Migration Checklist:**
- [ ] All affected files identified
- [ ] Changes documented in CHANGELOG.md
- [ ] README.md updated
- [ ] Dependencies validated
- [ ] Progress tracking updated (if applicable)
- [ ] No circular dependencies introduced
- [ ] Validation rules pass
- [ ] Spec version incremented (if breaking change)

**Rollback Strategy:**
If a migration causes issues:
1. Restore previous state from backup
2. Update CHANGELOG.md to document rollback
3. Review and revise migration plan before retrying

## Spec Versioning

As your project evolves, specs may need to be updated:

**Versioning Strategy:**
- Use semantic versioning for spec versions (v1.0, v1.1, v2.0)
- Document breaking changes in a CHANGELOG.md in specs/

**When to Version Specs:**
- Major version change: Complete restructuring of phases, breaking changes
- Minor version change: Adding/removing phases, significant phase updates, dependency restructuring
- Patch version change: Minor clarifications, typo fixes, non-breaking updates

**Change Documentation:**
```markdown
# specs/CHANGELOG.md

## [Unreleased]

## [1.1.0] - 2024-01-15
### Added
- Phase 15: New Feature
- Phase 16: Another Feature

### Changed
- Updated Phase 5 to include new requirements
- Modified dependencies for Phase 10

### Removed
- Phase 8: Deprecated feature removed

## [1.0.0] - 2024-01-01
### Added
- Initial spec release with 14 phases
```

## Examples

When creating your specs, consider these organizational patterns:
- **Sequential organization**: Phases numbered sequentially (Phase 1, 2, 3, 4...)
- **Categorized organization**: Phases grouped by category (e.g., Foundational, Foundation, Core, Enhanced)
- **Custom organization**: Define your own category structure based on project needs

## Import/Export Functionality

You can import and export specs for sharing or backup:

**Export Specs:**
```bash
# Export specs as a tarball for backup
tar -czf specs-backup-$(date +%Y%m%d).tar.gz specs/
```

**Import Specs:**
```bash
# Import from backup
tar -xzf specs-backup-20240115.tar.gz

# Verify import
ls -la specs/
```

**Sharing Specs:**
- Share specs via file transfer for access
- Share specs via file transfer for external collaborators
- Use separate spec proposal files for spec proposal workflows

**Backup/Restore Coordination with Implementation:**
- Spec backups (specs-create) and implementation checkpoints (specs-implement) serve different purposes
- Spec backups preserve the design and specification documents
- Implementation checkpoints preserve the code state during phase implementation
- When restoring from a spec backup, ensure it aligns with the current implementation state
- If implementation has progressed, consider whether spec changes require re-implementation of affected phases
- Coordinate spec version changes with checkpoint creation to maintain traceability

## Visual Dependency Graph

Generate a visual representation of phase dependencies:

**Manual Graph Creation:**
- Create dependency graph based on phase definitions
- Include in README.md for visual reference

**Manual Graph Maintenance:**
- Update graphs manually when specs change
- Keep graphs in sync with phase dependencies
- Include graphs in README.md for visual reference
