import SwiftUI

/// Structural skeleton only — the real Projects Screen feature lands in Sprint 006.
public struct ProjectCardSkeleton: View {
    private let title: String

    public init(title: String) {
        self.title = title
    }

    public var body: some View {
        BaseCard {
            VStack(alignment: .leading, spacing: DesignTokens.Space.sm) {
                RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                    .fill(DesignTokens.Color.surfaceVariant)
                    .frame(height: DesignTokens.Size.cardThumbnailHeight)
                Text(title)
                    .font(DesignTokens.Typography.headline)
                    .foregroundStyle(DesignTokens.Color.textPrimary)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(title)
    }
}

#Preview("ProjectCardSkeleton - Light") {
    ProjectCardSkeleton(title: "Untitled Project")
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.light)
}

#Preview("ProjectCardSkeleton - Dark") {
    ProjectCardSkeleton(title: "Untitled Project")
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.dark)
}
