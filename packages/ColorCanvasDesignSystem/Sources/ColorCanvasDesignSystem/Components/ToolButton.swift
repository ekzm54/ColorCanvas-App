import SwiftUI

public struct ToolButton: View {
    private let systemImageName: String
    private let accessibilityLabelText: String
    private let isSelected: Bool
    private let action: () -> Void

    public init(
        systemImageName: String,
        accessibilityLabel: String,
        isSelected: Bool = false,
        action: @escaping () -> Void
    ) {
        self.systemImageName = systemImageName
        self.accessibilityLabelText = accessibilityLabel
        self.isSelected = isSelected
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
        .buttonStyle(ToolButtonStyle(isSelected: isSelected))
        .accessibilityLabel(accessibilityLabelText)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}

private struct ToolButtonStyle: ButtonStyle {
    let isSelected: Bool

    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(isSelected ? DesignTokens.Color.primary : DesignTokens.Color.textSecondary)
            .background(
                RoundedRectangle(cornerRadius: DesignTokens.Radius.sm)
                    .fill(selectedBackgroundColor)
            )
            .opacity(
                DesignTokens.ComponentStateToken.opacity(isEnabled: isEnabled, isPressed: configuration.isPressed)
            )
            .animation(DesignTokens.AnimationToken.quick, value: configuration.isPressed)
    }

    private var selectedBackgroundColor: Color {
        isSelected ? DesignTokens.Color.primary.opacity(DesignTokens.OpacityToken.subtle) : DesignTokens.Color.clear
    }
}

#Preview("ToolButton - Light") {
    HStack(spacing: DesignTokens.Space.md) {
        ToolButton(systemImageName: "pencil", accessibilityLabel: "Pencil", isSelected: true) {}
        ToolButton(systemImageName: "eraser", accessibilityLabel: "Eraser") {}
    }
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.light)
}

#Preview("ToolButton - Dark") {
    HStack(spacing: DesignTokens.Space.md) {
        ToolButton(systemImageName: "pencil", accessibilityLabel: "Pencil", isSelected: true) {}
        ToolButton(systemImageName: "eraser", accessibilityLabel: "Eraser") {}
    }
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.dark)
}
