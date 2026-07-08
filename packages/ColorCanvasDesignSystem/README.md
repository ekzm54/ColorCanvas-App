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

## Sprint 001

- `DesignTokens` — an empty namespace enum. It exists only as the anchor point Sprint 002 (Design System) extends with real color/typography/spacing/radius/elevation/animation tokens; Sprint 001 intentionally adds no token values.

## Sprint 002

All token values live under `Tokens/`, all extending the `DesignTokens` namespace: `Space`, `Radius`, `BorderWidth`, `IconSize`, `ButtonSize`, `Size` (component-specific fixed sizes not covered by the above, e.g. card thumbnail height), `Elevation` (shadow levels + a `View.elevation(_:)` modifier), `AnimationToken`, `OpacityToken`, `Color` (a light/dark-adaptive semantic palette — `background`, `surface`, `surfaceVariant`, `primary`, `onPrimary`, `border`, `textPrimary`, `textSecondary`, `textDisabled`, `success`, `warning`, `error`, `shadow`, `clear` — built on a private `Color(light:dark:)` helper, no asset catalog required), `Typography` (semantic names mapped onto SwiftUI's built-in Dynamic-Type text styles, so text scales automatically), and `ComponentState`/`ComponentStateToken` (the enabled/pressed/disabled → opacity mapping every interactive component shares).

Reusable components live under `Components/`: `PrimaryButton`, `SecondaryButton`, `IconButton`, `ToolButton` (each a `View` wrapping a private `ButtonStyle` — never expose the style type itself), `BaseCard`, `ProjectCardSkeleton` and `TemplateCardSkeleton` (deliberately minimal structural skeletons — the real Projects/Gallery features land in Sprint 006/Sprint 005 respectively, so these take a plain `title: String`, not a domain model), and `EmptyStateView`/`ErrorStateView`/`LoadingStateView`.

`Previews/PreviewMatrix.swift` renders every component together for visual QA (light, dark, and large Dynamic Type). Every individual component file also carries its own light/dark `#Preview` pair, per the Sprint 002 critical rule "Components must support Light/Dark previews."

Every token value (color, spacing, radius, elevation, animation, opacity) is defined exactly once, inside `Tokens/`. Nothing under `Components/` or `Previews/` contains a raw numeric or color literal — everything routes through `DesignTokens.*`, per Book 4's implementation rule ("Raw colors, fonts, spacing, radius, elevation, and animation values are forbidden outside token definitions").
