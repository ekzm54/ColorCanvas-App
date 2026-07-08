# AI Rules for ColorCanvas-App

This repository contains the implementation for ColorCanvas.

## Required Reference Repository

Before implementing, read the relevant files in:

- `ekzm54/ColorCanvas-Docs`

## Required Order

```text
Book -> ADR -> RFC -> Sprint -> Task -> Code
```

## Implementation Rules

1. Implement only the active Sprint.
2. Do not exceed the active RFC scope.
3. Keep SwiftUI Views free of business logic.
4. UI must not directly access FileManager or engines.
5. Engines must not import SwiftUI.
6. Use Design Tokens for UI values.
7. Add tests for new behavior.
8. Protect user artwork above all else.
