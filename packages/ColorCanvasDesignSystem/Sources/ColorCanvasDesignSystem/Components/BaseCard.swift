import SwiftUI

public struct BaseCard<Content: View>: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding(DesignTokens.Space.lg)
            .background(
                RoundedRectangle(cornerRadius: DesignTokens.Radius.lg)
                    .fill(DesignTokens.Color.surface)
            )
            .elevation(.level1)
    }
}

#Preview("BaseCard - Light") {
    BaseCard {
        Text("Card content")
            .font(DesignTokens.Typography.body)
            .foregroundStyle(DesignTokens.Color.textPrimary)
    }
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.light)
}

#Preview("BaseCard - Dark") {
    BaseCard {
        Text("Card content")
            .font(DesignTokens.Typography.body)
            .foregroundStyle(DesignTokens.Color.textPrimary)
    }
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.dark)
}
