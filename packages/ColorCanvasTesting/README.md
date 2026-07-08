# ColorCanvasTesting

## Responsibility

Shared testing utilities used across other packages' test targets: mocks/fakes for `ColorCanvasDomain` protocols, test fixtures, and XCTest helpers. Centralizing these avoids duplicating mocks per package.

## What Belongs Here

- Mock/fake implementations of repository and engine protocols from `ColorCanvasDomain`.
- Shared test fixtures and builders.
- XCTest assertion helpers used by multiple packages.

## What Must Not Belong Here

- Production code reachable from `apps/ipad`'s release build — this package exists only to be imported by `.testTarget`s.
- Business logic — mocks should be minimal and behavior-neutral unless a test explicitly configures them.

## Dependency Rules

- Depends on `ColorCanvasDomain` (to implement its protocols) and `XCTest`.
- May be depended on by any other package's test target; must never be depended on by a non-test target.
- No package currently declares this as a test dependency — Sprint 000 only establishes the package. Later Sprints add `.testTarget(dependencies: ["ColorCanvasTesting"])` where mocks are actually needed.
