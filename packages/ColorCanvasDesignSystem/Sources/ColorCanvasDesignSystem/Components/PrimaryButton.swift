import SwiftUI

public struct PrimaryButton: View {
    private let title: String
    private let action: () -> Void

    public init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(DesignTokens.Typography.button)
                .frame(maxWidth: .infinity, minHeight: DesignTokens.ButtonSize.height)
        }
        .buttonStyle(PrimaryButtonStyle())
        .accessibilityLabel(title)
    }
}

private struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(DesignTokens.Color.onPrimary)
            .padding(.horizontal, DesignTokens.ButtonSize.horizontalPadding)
            .background(
                RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                    .fill(DesignTokens.Color.primary)
            )
            .opacity(DesignTokens.ComponentStateToken.opacity(isEnabled: isEnabled, isPressed: configuration.isPressed))
            .animation(DesignTokens.AnimationToken.quick, value: configuration.isPressed)
    }
}

#Preview("PrimaryButton - Light") {
    PrimaryButton("Continue") {}
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.light)
}

#Preview("PrimaryButton - Dark") {
    PrimaryButton("Continue") {}
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.dark)
}
