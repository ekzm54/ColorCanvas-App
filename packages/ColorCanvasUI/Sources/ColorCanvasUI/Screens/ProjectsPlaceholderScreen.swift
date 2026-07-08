import ColorCanvasApplication
import ColorCanvasDesignSystem
import SwiftUI

struct ProjectsPlaceholderScreen: View {
    @ObservedObject var router: AppRouter

    var body: some View {
        PlaceholderScreen(title: "Projects", message: "The real Projects screen lands in Sprint 006.") {
            PrimaryButton("Open Studio") { router.push(.studio(projectID: ProjectID(rawValue: "placeholder-project"))) }
        }
    }
}

#Preview("ProjectsPlaceholderScreen - Light") {
    NavigationStack {
        ProjectsPlaceholderScreen(router: AppRouter())
    }
    .preferredColorScheme(.light)
}

#Preview("ProjectsPlaceholderScreen - Dark") {
    NavigationStack {
        ProjectsPlaceholderScreen(router: AppRouter())
    }
    .preferredColorScheme(.dark)
}
