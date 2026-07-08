# Codex Review Guide

Codex is the review agent for ColorCanvas-App.

## Review Inputs

Review every change against:

1. `AI_RULES.md`
2. `CLAUDE.md`
3. Related GitHub issue
4. Related Sprint document in `ekzm54/ColorCanvas-Docs`
5. Related RFC document in `ekzm54/ColorCanvas-Docs`
6. Related ADR documents in `ekzm54/ColorCanvas-Docs`

## Checklist

### Architecture

- MVVM is respected.
- Views contain no business logic.
- ViewModels do not access the file system directly.
- Engines do not depend on UI modules.
- Repository boundaries are respected.
- Scope does not exceed the active RFC.

### Code Quality

- No unsafe optional handling.
- No silent error handling.
- No hard-coded UI values outside Design Tokens.
- No unrelated broad refactor.

### Tests

- Unit tests exist for new logic.
- UI tests exist for user flows when applicable.
- Regression tests exist for bug fixes.

### Data Protection

- User artwork remains protected.
- Auto Save is not disabled.
- Export and cache operations do not mutate project source data.

## Output Format

Verdict: PASS / PASS WITH WARNINGS / FAIL

Summary:

Critical Issues:

Architecture Issues:

Test Gaps:

Required Fixes:

Optional Improvements:
