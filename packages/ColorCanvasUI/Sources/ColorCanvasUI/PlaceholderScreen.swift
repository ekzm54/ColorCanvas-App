import ColorCanvasDesignSystem
import SwiftUI

struct PlaceholderScreen<Actions: View>: View {
    private let title: String
    private let message: String
    private let actions: Actions

    init(title: String, message: String, @ViewBuilder actions: () -> Actions) {
        self.title = title
        self.message = message
        self.actions = actions()
    }

    var body: some View {
        ScrollView {
            VStack(spacing: DesignTokens.Space.lg) {
                Text(title)
                    .font(DesignTokens.Typography.largeTitle)
                    .foregroundStyle(DesignTokens.Color.textPrimary)
                Text(message)
                    .font(DesignTokens.Typography.body)
                    .foregroundStyle(DesignTokens.Color.textSecondary)
                    .multilineTextAlignment(.center)
                VStack(spacing: DesignTokens.Space.md) {
                    actions
                }
                .padding(.top, DesignTokens.Space.md)
            }
            .padding(DesignTokens.Space.xl)
            .frame(maxWidth: .infinity)
        }
        .background(DesignTokens.Color.background)
        .navigationTitle(title)
    }
}

#Preview("PlaceholderScreen - Light") {
    NavigationStack {
        PlaceholderScreen(title: "Gallery", message: "The real Gallery screen lands in Sprint 005.") {
            PrimaryButton("Open Studio") {}
        }
    }
    .preferredColorScheme(.light)
}

#Preview("PlaceholderScreen - Dark") {
    NavigationStack {
        PlaceholderScreen(title: "Gallery", message: "The real Gallery screen lands in Sprint 005.") {
            PrimaryButton("Open Studio") {}
        }
    }
    .preferredColorScheme(.dark)
}
