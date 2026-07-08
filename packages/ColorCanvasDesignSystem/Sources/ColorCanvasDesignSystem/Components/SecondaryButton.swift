import SwiftUI

public struct SecondaryButton: View {
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
        .buttonStyle(SecondaryButtonStyle())
        .accessibilityLabel(title)
    }
}

private struct SecondaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(DesignTokens.Color.primary)
            .padding(.horizontal, DesignTokens.ButtonSize.horizontalPadding)
            .background(
                RoundedRectangle(cornerRadius: DesignTokens.Radius.md)
                    .stroke(DesignTokens.Color.primary, lineWidth: DesignTokens.BorderWidth.regular)
            )
            .opacity(DesignTokens.ComponentStateToken.opacity(isEnabled: isEnabled, isPressed: configuration.isPressed))
            .animation(DesignTokens.AnimationToken.quick, value: configuration.isPressed)
    }
}

#Preview("SecondaryButton - Light") {
    SecondaryButton("Cancel") {}
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.light)
}

#Preview("SecondaryButton - Dark") {
    SecondaryButton("Cancel") {}
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.dark)
}
