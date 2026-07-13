# AI Rules for ColorCanvas-App

This repository contains the Android implementation for ColorCanvas.

## Required Reference Repository

Before implementing, read the relevant files in:

- `ekzm54/ColorCanvas-Docs`

## Required Order

```text
Book -> ADR -> RFC -> Sprint -> Task -> Code
```

## Android Baseline

- Kotlin
- Jetpack Compose
- Material 3
- Coroutines and Flow
- Android ViewModel
- Hilt or constructor-based dependency injection
- Room or document-based local persistence where appropriate
- Canvas / graphics APIs behind engine interfaces

## Implementation Rules

1. Implement only the active Sprint.
2. Do not exceed the active RFC scope.
3. Keep composables free of business logic.
4. UI must not directly access files, databases, repositories, or engines.
5. Core engines must not depend on Compose UI.
6. Use Design Tokens and Material 3 semantic roles for UI values.
7. Add tests for new behavior.
8. Protect user artwork above all else.
9. Prefer offline-first behavior.
10. Run build, test, lint, and format checks before completion.
