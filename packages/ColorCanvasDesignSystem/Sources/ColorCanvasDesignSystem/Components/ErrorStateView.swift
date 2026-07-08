import SwiftUI

public struct ErrorStateView: View {
    private let title: String
    private let message: String
    private let retryAction: (() -> Void)?

    public init(title: String, message: String, retryAction: (() -> Void)? = nil) {
        self.title = title
        self.message = message
        self.retryAction = retryAction
    }

    public var body: some View {
        VStack(spacing: DesignTokens.Space.md) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: DesignTokens.IconSize.extraLarge))
                .foregroundStyle(DesignTokens.Color.error)
            Text(title)
                .font(DesignTokens.Typography.headline)
                .foregroundStyle(DesignTokens.Color.textPrimary)
            Text(message)
                .font(DesignTokens.Typography.body)
                .foregroundStyle(DesignTokens.Color.textSecondary)
                .multilineTextAlignment(.center)
            if let retryAction {
                SecondaryButton("Retry", action: retryAction)
            }
        }
        .padding(DesignTokens.Space.xl)
        .accessibilityElement(children: .combine)
    }
}

#Preview("ErrorStateView - Light") {
    ErrorStateView(title: "Something Went Wrong", message: "We couldn't load your project.", retryAction: {})
        .preferredColorScheme(.light)
}

#Preview("ErrorStateView - Dark") {
    ErrorStateView(title: "Something Went Wrong", message: "We couldn't load your project.", retryAction: {})
        .preferredColorScheme(.dark)
}
