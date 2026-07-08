# CLAUDE-APP-001 — Sprint 000 Project Bootstrap

## Repository

`ekzm54/ColorCanvas-App`

## Role

You are the lead iOS engineer for ColorCanvas.

## Goal

Implement Sprint 000: create the initial monorepo and Swift package-ready structure for the iPad coloring app.

## Read First

From this repository:

1. `AI_RULES.md`
2. `CLAUDE.md`
3. `AGENTS.md`

From `ekzm54/ColorCanvas-Docs`:

1. `AI_RULES.md`
2. `docs/books/Book0-Foundation-Bible.md`
3. `docs/books/Book8-Engineering-Standards.md`
4. `docs/sprints/Sprint000-Project-Bootstrap.md`
5. `docs/sprints/Sprint-Index.md`

## Required Structure

Create or verify:

```text
apps/ipad/
packages/ColorCanvasDomain/
packages/ColorCanvasApplication/
packages/ColorCanvasUI/
packages/ColorCanvasDesignSystem/
packages/ColorCanvasCanvasEngine/
packages/ColorCanvasSafeColor/
packages/ColorCanvasDocument/
packages/ColorCanvasData/
packages/ColorCanvasExport/
packages/ColorCanvasResources/
packages/ColorCanvasTesting/
packages/ColorCanvasShared/
scripts/
.github/
```

## Required Files

Add README files for each package explaining:

- responsibility
- what belongs here
- what must not belong here
- dependency rules

Add scripts:

- `scripts/build.sh`
- `scripts/test.sh`
- `scripts/lint.sh`
- `scripts/format.sh`

Add tooling placeholders:

- `.swiftlint.yml`
- `.swiftformat`

Add GitHub workflow placeholder:

- `.github/workflows/ci.yml`

## Rules

- Do not implement product features.
- Do not implement Home/Gallery/Studio.
- Do not implement rendering.
- Do not implement Safe Color.
- Do not add dependencies without justification.
- Keep files small and clear.
- Make scripts safe and executable.

## Done Criteria

- Repository structure exists.
- Package responsibilities are documented.
- Tooling placeholders exist.
- CI placeholder exists.
- No feature implementation added.

## Completion Report

Report:

1. Files created
2. Architecture notes
3. Any missing local tooling assumptions
4. Next recommended Sprint
