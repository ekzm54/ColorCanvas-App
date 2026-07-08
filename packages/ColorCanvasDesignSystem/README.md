# ColorCanvasDesignSystem

## Responsibility

The single source of truth for ColorCanvas UI values: design tokens, typography, color system, elevation/surface system, and shared component styling (see `Book4-Design-System-UI-Bible`). Tokens and components land in Sprint 002; Sprint 000 only establishes the package.

## What Belongs Here

- Design tokens: color, typography, spacing, radius, elevation, animation/motion curves.
- Shared, style-only SwiftUI components (buttons, cards) and view modifiers that apply tokens.
- Component state token definitions (e.g. pressed/disabled/focused visual states).

## What Must Not Belong Here

- Business logic or navigation/state management — this package is presentation-only.
- Screen-specific composition (that belongs in `ColorCanvasUI`).
- Direct FileManager, networking, or persistence access.
- Any raw hard-coded value that bypasses the token system it defines.

## Dependency Rules

- Depends on nothing else in this monorepo — the design system must be usable without pulling in domain or application logic.
- Consumed by `ColorCanvasUI`. Must never depend on `ColorCanvasUI`, `ColorCanvasApplication`, or `ColorCanvasDomain`.
