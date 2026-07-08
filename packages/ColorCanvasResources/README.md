# ColorCanvasResources

## Responsibility

Shared, non-code assets for ColorCanvas: image/color assets, fonts, localized strings, and template manifests consumed by other packages and the app target.

## What Belongs Here

- Asset catalogs, bundled images, fonts.
- Localization (`.strings`/`.xcstrings`) resources.
- Non-executable template/manifest data (e.g. coloring template metadata) once later Sprints introduce it.

## What Must Not Belong Here

- Swift business logic or view code — this package holds data, not behavior.
- Anything that duplicates tokens owned by `ColorCanvasDesignSystem` (colors/typography/spacing values live in the design system, not as loose assets here).

## Dependency Rules

- Depends on nothing else in this monorepo.
- May be consumed by any package or the app target that needs bundled assets.
- `Sources/ColorCanvasResources/Resources/` is currently an empty placeholder — Sprint 000 adds no real assets; see Sprint 002 (Design System) and Sprint 015 (Release Candidate / App Store assets) for when real content lands here.
