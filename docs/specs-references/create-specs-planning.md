---
description: Create comprehensive design and spec plans for a project - Part 1: Planning Phase (Steps 1-5)
---

# Spec Creation Workflow - Part 1: Planning Phase

This is Part 1 of the create-specs workflow, covering Steps 1-5: Repository review, new codebase detection, project overview gathering, phase organization strategy, and phase definition.

For the complete workflow, see:
- Planning Phase: This file (Steps 1-5)
- Execution Phase: `docs/specs-references/create-specs-execution.md` (Steps 6-13)

## Usage

Run this workflow from the root of your repository:

```
/create-specs
```

## Workflow Steps

### 1. Repository Review (Required First Step)

**CRITICAL**: Before making any design decisions, execution plans, or implementations, you must review the repository in its entirety to understand the current state of the codebase and its functionality.

**Comprehensive Code Review Process:**
- Examine all files and directories in the repository
- Review all existing code to gain a deep understanding of:
  - Code structure and architecture
  - Design patterns and coding conventions
  - Business logic and data flow
  - Integration points and dependencies
  - Performance characteristics
  - Security considerations
- Identify existing technologies, frameworks, and dependencies
- Check for existing documentation, configuration files, and README files
- Understand the project's current functionality and purpose
- Note any existing design patterns, coding standards, or conventions
- Review any existing specs, tests, or documentation

**Do NOT proceed to subsequent steps until this comprehensive review is complete and you have a deep understanding of the codebase.**

### 2. New Codebase Detection and Technology Guidance

After completing the repository review, determine if this is a new codebase:

**New Codebase Criteria:**
- Repository is empty or contains only initial setup files (e.g., .gitignore, LICENSE)
- No existing source code files
- No existing dependencies or package management files
- No existing configuration files for frameworks or tools

**If this is a new codebase:**
Guide the user through technology and architectural selections:

```
=== Technology Stack Selection ===

Since this is a new codebase, please select the following:

1. Programming Language:
   [e.g., TypeScript, Python, Go, Rust, Java, etc.]

2. Framework(s):
   [e.g., React, Vue, Django, Flask, Express, etc.]

3. Database Technology (if applicable):
   [e.g., PostgreSQL, MongoDB, SQLite, MySQL, etc.]

4. Authentication/Authorization Approach (if applicable):
   [e.g., JWT, OAuth2, Session-based, None, etc.]

5. Testing Framework:
   [e.g., Jest, Pytest, Go test, JUnit, etc.]

6. Deployment Strategy:
   [e.g., Docker, Kubernetes, Serverless, Traditional hosting, etc.]

7. Other Relevant Technologies:
   [e.g., State management, API client, ORM, etc.]

8. Architectural Decisions:
   [e.g., Monolithic vs Microservices, REST vs GraphQL, etc.]
```

Document these decisions in the spec and ensure all subsequent phases align with these choices.

**Technology Stack Documentation:**
- Add a "Technology Stack" section to the specs/README.md documenting all technology decisions
- Include version information where applicable (e.g., React 18, Node.js 20, Python 3.11)
- Document the rationale for each technology choice
- This information will be used by the implement-specs workflow to ensure implementation aligns with decisions

**If this is an existing codebase:**
- Build upon existing technologies and patterns identified in the repository review
- Note any deviations from established patterns with justification
- Ensure new phases are compatible with existing architecture

### 3. Project Overview Gathering

First, gather basic project information:

```
=== Project Overview ===

Please provide the following information:

1. Project Name:
   [Enter your project name]

2. Project Description:
   [Brief description of what this project does]

3. Target Platforms:
   [e.g., iOS, Android, Web, Desktop]

4. Primary Technology Stack:
   [e.g., Flutter, React Native, React, etc.]

5. Project Type:
   [e.g., Mobile App, Web App, Desktop App, Full Stack, etc.]

6. Key Features (list 3-5 main features):
   - Feature 1
   - Feature 2
   - Feature 3
   ...

7. Design/UX Style:
   [e.g., Minimalist, Modern, Corporate, Playful, etc.]

8. Any special requirements or constraints:
   [e.g., Offline-first, Real-time, High security, etc.]
```

### 4. Phase Organization Strategy

Choose how you want to organize your phases:

```
=== Phase Organization ===

How would you like to organize your phases?

Option A: Sequential Phases
- Phase 1: Foundation
- Phase 2: First screen/feature
- Phase 3: Second screen/feature
- ...and so on

Option B: Categorized Phases
- Foundational Specs (Phase 1 specs)
- Foundation Phases (architecture, setup)
- Core Screen Phases (main features)
- Enhanced Screen Phases (advanced features)
- Professional Tool Phases (specialized features)

Option C: Custom Organization
- Define your own categories and phase structure

Choose Option A, B, or C:
```

### 5. Phase Definition

Based on your organization choice, define your phases:

**Phase Sizing Guidance:**

**CRITICAL: Phase Document Length Limit**
- **Each phase document must be limited to 500 lines or less**
- If a phase document would exceed 500 lines, split it into more granular sub-phases based on:
  - Requirements grouping (group related requirements together)
  - Functional intent (separate distinct functional areas)
  - Independent deliverables (create phases that can be completed independently)
- When splitting phases, ensure each sub-phase:
  - Has clear, focused scope
  - Can be completed independently (after dependencies)
  - Maintains logical flow and dependencies
  - Has measurable success criteria

**Time-Based Sizing:**
- Each phase should be completable in 1-3 weeks
- Phases should focus on one screen or component
- Avoid phases that are too large (over 3 weeks) or too small (under 3 days)
- Account for testing and review time in estimates

**Quantitative Metrics:**
- Task count: 5-15 tasks per phase (ideal range, guideline not hard requirement)
  - If a phase naturally requires fewer than 5 tasks, consider combining with another phase or expanding scope
  - If a phase requires more than 15 tasks, consider splitting into multiple sub-phases
  - The goal is to have phases that are completable in 1-3 weeks
- Task categories: 2-4 categories per phase
- Success criteria: 3-7 criteria per phase (ideal range, guideline not hard requirement)
  - Ensure criteria are specific and measurable regardless of count
  - For simple phases, 2-3 criteria may be sufficient
  - For complex phases, up to 10 criteria may be appropriate
- Dependencies: 0-3 direct dependencies per phase
- Complexity indicators:
  - Simple: 5-8 tasks, 0-1 dependencies, familiar patterns
  - Medium: 9-12 tasks, 1-2 dependencies, some new concepts
  - Complex: 13-15 tasks, 2-3 dependencies, significant new architecture

**Sizing Checklist:**
- [ ] Phase has clear, focused scope
- [ ] Task count is within 5-15 range
- [ ] Dependencies are minimal and clear
- [ ] Success criteria are specific and measurable
- [ ] Estimated completion time is 1-3 weeks
- [ ] Phase can be completed independently (after dependencies)
- [ ] Testing requirements are defined

**Examples:**
- Well-sized: Phase with 8 tasks, 1 dependency, clear scope, 1 week estimate
- Too large: Phase with 20 tasks, 4 dependencies, broad scope, 4 week estimate
- Too small: Phase with 2 tasks, no dependencies, trivial scope, 1 day estimate

#### For Option A (Sequential):

```
=== Sequential Phase Definition ===

List your phases in order. For each phase, provide:

Phase N: [Phase Name]
- Focus: [What this phase implements]
- Scope: [Brief description of what's included]
- Dependencies: [Which phases must be completed first, if any]

Example:
Phase 1: Foundation & Project Setup
- Focus: Technical infrastructure and architecture
- Scope: Project structure, state management, storage, navigation
- Dependencies: None

Phase 2: First Screen/Feature
- Focus: Initial user-facing feature
- Scope: UI components, data models, business logic
- Dependencies: Phase 1

Continue listing all phases...
```

#### For Option B (Categorized):

```
=== Categorized Phase Definition ===

Define your categories and phases within each:

**Important**: Phase numbers must be globally sequential (1, 2, 3, 4...) regardless of category. Categories group phases logically for organization, but numbering remains sequential across all phases.

Category 1: [Category Name]
- Description: [What this category covers]
- Phases:
  - Phase N: [Phase Name] - [Brief description]
  - Phase N: [Phase Name] - [Brief description]

Category 2: [Category Name]
- Description: [What this category covers]
- Phases:
  - Phase N: [Phase Name] - [Brief description]
  - Phase N: [Phase Name] - [Brief description]

Example:
Foundational Specs (Architecture & Standards)
- Description: Core data models, validation rules, error handling
- Phases:
  - Phase 1: Feature A - Core data model definitions
  - Phase 2: Feature B - Validation rules and utilities
  - Phase 3: Feature C - Error handling strategy

Foundation Phases (Setup & Architecture)
- Description: Project setup, design system, navigation
- Phases:
  - Phase 4: Feature D - Project initialization
  - Phase 5: Feature E - Theming and components
  - Phase 6: Feature F - Platform-specific icons
  - Phase 7: Feature G - Routing setup

Continue for all categories...
```

#### For Option C (Custom):

```
=== Custom Phase Definition ===

Describe your custom organization structure:

[Your custom organization description]

Then list all phases with their details:

Phase N: [Phase Name]
- Category: [If applicable]
- Focus: [What this phase implements]
- Scope: [Brief description]
- Dependencies: [Required phases]
```

## Continue to Part 2

For Steps 6-13 (Phase Detail Gathering through Finalization), see `docs/specs-references/create-specs-execution.md`.
