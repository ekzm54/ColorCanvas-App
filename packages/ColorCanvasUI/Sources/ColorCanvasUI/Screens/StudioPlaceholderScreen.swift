import ColorCanvasApplication
import ColorCanvasDesignSystem
import SwiftUI

struct StudioPlaceholderScreen: View {
    let projectID: ProjectID
    @ObservedObject var router: AppRouter

    var body: some View {
        PlaceholderScreen(title: "Studio", message: "The real Studio shell lands in Sprint 007.") {
            PrimaryButton("Export") { router.push(.export(projectID: projectID)) }
            SecondaryButton("Preview Color Picker (Modal)") { router.presentModal(.colorPicker) }
        }
    }
}

#Preview("StudioPlaceholderScreen - Light") {
    NavigationStack {
        StudioPlaceholderScreen(projectID: ProjectID(rawValue: "preview"), router: AppRouter())
    }
    .preferredColorScheme(.light)
}

#Preview("StudioPlaceholderScreen - Dark") {
    NavigationStack {
        StudioPlaceholderScreen(projectID: ProjectID(rawValue: "preview"), router: AppRouter())
    }
    .preferredColorScheme(.dark)
}
