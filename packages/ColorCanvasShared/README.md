# ColorCanvasShared

## Responsibility

Cross-cutting utilities with no product-specific meaning: common extensions, error types, State-enum helpers, logging primitives. Anything used by more than one layer that isn't itself a domain concept.

## What Belongs Here

- Generic Swift extensions (Foundation-level helpers).
- Shared error/result types.
- Logging primitives (the concrete logger implementation is Sprint 001's `AppEnvironment`/`DependencyContainer` work; this package may hold the protocol/utility pieces that support it).

## What Must Not Belong Here

- Domain entities or business rules (belongs in `ColorCanvasDomain`).
- UI code of any kind.
- Anything specific to one feature area — if it's only useful to one package, it belongs in that package, not here.

## Dependency Rules

- Depends on nothing else in this monorepo.
- May be depended on by any other package, since it sits below all of them.
