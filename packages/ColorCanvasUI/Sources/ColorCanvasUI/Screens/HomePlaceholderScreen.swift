import ColorCanvasApplication
import ColorCanvasDesignSystem
import SwiftUI

struct HomePlaceholderScreen: View {
    @ObservedObject var router: AppRouter

    var body: some View {
        PlaceholderScreen(title: "Home", message: "The real Home screen lands in Sprint 004.") {
            PrimaryButton("Gallery") { router.push(.gallery(categoryID: nil)) }
            SecondaryButton("Projects") { router.push(.projects) }
            SecondaryButton("Settings") { router.push(.settings) }
        }
    }
}

#Preview("HomePlaceholderScreen - Light") {
    NavigationStack {
        HomePlaceholderScreen(router: AppRouter())
    }
    .preferredColorScheme(.light)
}

#Preview("HomePlaceholderScreen - Dark") {
    NavigationStack {
        HomePlaceholderScreen(router: AppRouter())
    }
    .preferredColorScheme(.dark)
}
