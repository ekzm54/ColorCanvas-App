import SwiftUI

public struct EmptyStateView: View {
    private let title: String
    private let message: String
    private let systemImageName: String

    public init(title: String, message: String, systemImageName: String = "tray") {
        self.title = title
        self.message = message
        self.systemImageName = systemImageName
    }

    public var body: some View {
        VStack(spacing: DesignTokens.Space.md) {
            Image(systemName: systemImageName)
                .font(.system(size: DesignTokens.IconSize.extraLarge))
                .foregroundStyle(DesignTokens.Color.textSecondary)
            Text(title)
                .font(DesignTokens.Typography.headline)
                .foregroundStyle(DesignTokens.Color.textPrimary)
            Text(message)
                .font(DesignTokens.Typography.body)
                .foregroundStyle(DesignTokens.Color.textSecondary)
                .multilineTextAlignment(.center)
        }
        .padding(DesignTokens.Space.xl)
        .accessibilityElement(children: .combine)
    }
}

#Preview("EmptyStateView - Light") {
    EmptyStateView(title: "No Projects Yet", message: "Start coloring to see your projects here.")
        .preferredColorScheme(.light)
}

#Preview("EmptyStateView - Dark") {
    EmptyStateView(title: "No Projects Yet", message: "Start coloring to see your projects here.")
        .preferredColorScheme(.dark)
}
