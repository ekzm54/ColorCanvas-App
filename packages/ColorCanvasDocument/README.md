# ColorCanvasDocument

## Responsibility

The document engine: project/document package format, serialization, versioning, and recovery logic. Implements the document-related protocols declared in `ColorCanvasDomain`. Protecting user artwork (Book 0's top priority) starts here.

## What Belongs Here

- Document package format definitions and (de)serialization.
- Auto Save, versioning, and recovery/corruption-handling logic.
- Document-level validation.

## What Must Not Belong Here

- Any `import SwiftUI` or `import UIKit`.
- Raw file-system I/O primitives (belongs in `ColorCanvasData`'s FileSystem adapter) — this package defines the document *format and lifecycle*, not the storage adapter.
- Rendering or Safe Color logic.
- Any change that disables or weakens Auto Save or recovery to solve another problem (`AI_RULES.md`).

## Dependency Rules

- Depends on `ColorCanvasDomain` for the protocols it implements.
- Never depends on `ColorCanvasUI` or `ColorCanvasApplication`.
- Consumed only via the protocols in `ColorCanvasDomain`; the app composition root injects the concrete implementation — `ColorCanvasApplication` never imports this package directly.
