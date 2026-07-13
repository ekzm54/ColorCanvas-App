# Claude Code Guide for ColorCanvas-App

Claude Code is the primary implementation agent for the Android version of ColorCanvas.

## Platform

- Kotlin
- Jetpack Compose
- Material 3
- Coroutines and Flow
- Android ViewModel
- Android Gradle Plugin
- Gradle Kotlin DSL

## Before Starting

Read these from `ekzm54/ColorCanvas-Docs`:

1. `AI_RULES.md`
2. Relevant Book files
3. Relevant ADR files
4. Relevant RFC file
5. Active Sprint file
6. Android migration documents

## Working Rule

Do not implement anything outside the current Sprint and RFC.

Do not add iOS, Swift, SwiftUI, Xcode, Apple Pencil, UIKit, CoreGraphics, or Metal-specific implementation unless a migration document explicitly calls for compatibility notes.

## Architecture Rule

- Composables render state and emit events.
- ViewModels coordinate UseCases.
- UseCases depend on repository or engine interfaces.
- Data implementations remain behind interfaces.
- Rendering and Safe Color engines must not depend on Compose UI.

## Completion Report

Always report:

1. Goal
2. Files changed
3. Architecture compliance
4. Tests added
5. Build/Test/Lint/Format result
6. Remaining risks
