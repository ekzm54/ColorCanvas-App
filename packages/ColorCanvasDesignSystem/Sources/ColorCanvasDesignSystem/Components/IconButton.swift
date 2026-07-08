import SwiftUI

public struct IconButton: View {
    private let systemImageName: String
    private let accessibilityLabelText: String
    private let action: () -> Void

    public init(systemImageName: String, accessibilityLabel: String, action: @escaping () -> Void) {
        self.systemImageName = systemImageName
        self.accessibilityLabelText = accessibilityLabel
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: systemImageName)
                .font(.system(size: DesignTokens.IconSize.medium))
                .frame(
                    width: DesignTokens.ButtonSize.iconOnlyDimension,
                    height: DesignTokens.ButtonSize.iconOnlyDimension
                )
        }
        .buttonStyle(IconButtonStyle())
        .accessibilityLabel(accessibilityLabelText)
    }
}

private struct IconButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(DesignTokens.Color.textPrimary)
            .background(
                Circle()
                    .fill(DesignTokens.Color.surface)
            )
            .opacity(DesignTokens.ComponentStateToken.opacity(isEnabled: isEnabled, isPressed: configuration.isPressed))
            .animation(DesignTokens.AnimationToken.quick, value: configuration.isPressed)
    }
}

#Preview("IconButton - Light") {
    IconButton(systemImageName: "plus", accessibilityLabel: "Add") {}
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.light)
}

#Preview("IconButton - Dark") {
    IconButton(systemImageName: "plus", accessibilityLabel: "Add") {}
        .padding(DesignTokens.Space.lg)
        .preferredColorScheme(.dark)
}
