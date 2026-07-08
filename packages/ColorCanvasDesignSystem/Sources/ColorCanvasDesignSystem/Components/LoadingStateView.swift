import SwiftUI

public struct LoadingStateView: View {
    private let message: String?

    public init(message: String? = nil) {
        self.message = message
    }

    public var body: some View {
        VStack(spacing: DesignTokens.Space.md) {
            ProgressView()
                .controlSize(.large)
            if let message {
                Text(message)
                    .font(DesignTokens.Typography.body)
                    .foregroundStyle(DesignTokens.Color.textSecondary)
            }
        }
        .padding(DesignTokens.Space.xl)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(message ?? "Loading")
    }
}

#Preview("LoadingStateView - Light") {
    LoadingStateView(message: "Loading…")
        .preferredColorScheme(.light)
}

#Preview("LoadingStateView - Dark") {
    LoadingStateView(message: "Loading…")
        .preferredColorScheme(.dark)
}
