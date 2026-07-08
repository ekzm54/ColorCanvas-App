import SwiftUI

/// Aggregate visual QA surface for every Sprint 002 component — the "Preview Matrix" deliverable.
struct PreviewMatrix: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignTokens.Space.xl) {
                Group {
                    PrimaryButton("Continue") {}
                    SecondaryButton("Cancel") {}
                    HStack(spacing: DesignTokens.Space.md) {
                        IconButton(systemImageName: "plus", accessibilityLabel: "Add") {}
                        ToolButton(systemImageName: "pencil", accessibilityLabel: "Pencil", isSelected: true) {}
                        ToolButton(systemImageName: "eraser", accessibilityLabel: "Eraser") {}
                    }
                }

                Group {
                    ProjectCardSkeleton(title: "Untitled Project")
                    TemplateCardSkeleton(title: "Untitled Template")
                }

                Group {
                    EmptyStateView(title: "No Projects Yet", message: "Start coloring to see your projects here.")
                    ErrorStateView(
                        title: "Something Went Wrong",
                        message: "We couldn't load your project.",
                        retryAction: {}
                    )
                    LoadingStateView(message: "Loading…")
                }
            }
            .padding(DesignTokens.Space.lg)
        }
        .background(DesignTokens.Color.background)
    }
}

#Preview("Preview Matrix - Light") {
    PreviewMatrix()
        .preferredColorScheme(.light)
}

#Preview("Preview Matrix - Dark") {
    PreviewMatrix()
        .preferredColorScheme(.dark)
}

#Preview("Preview Matrix - Large Dynamic Type") {
    PreviewMatrix()
        .preferredColorScheme(.light)
        .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
}
