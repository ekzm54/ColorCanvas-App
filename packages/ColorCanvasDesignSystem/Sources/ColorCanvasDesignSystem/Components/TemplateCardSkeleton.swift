import SwiftUI

/// Structural skeleton only — the real Gallery / Template feature lands in Sprint 005.
public struct TemplateCardSkeleton: View {
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

#Preview("TemplateCardSkeleton - Light") {
    TemplateCardSkeleton(title: "Untitled Template")
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.light)
}

#Preview("TemplateCardSkeleton - Dark") {
    TemplateCardSkeleton(title: "Untitled Template")
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.dark)
}
