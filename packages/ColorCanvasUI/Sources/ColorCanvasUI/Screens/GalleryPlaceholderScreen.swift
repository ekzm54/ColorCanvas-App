import ColorCanvasApplication
import ColorCanvasDesignSystem
import ColorCanvasDomain
import SwiftUI

struct GalleryPlaceholderScreen: View {
    let categoryID: CategoryID?
    @ObservedObject var router: AppRouter

    var body: some View {
        PlaceholderScreen(title: "Gallery", message: "The real Gallery screen lands in Sprint 005.") {
            PrimaryButton("Open Studio") { router.push(.studio(projectID: ProjectID(rawValue: "placeholder-project"))) }
        }
    }
}

#Preview("GalleryPlaceholderScreen - Light") {
    NavigationStack {
        GalleryPlaceholderScreen(categoryID: nil, router: AppRouter())
    }
    .preferredColorScheme(.light)
}

#Preview("GalleryPlaceholderScreen - Dark") {
    NavigationStack {
        GalleryPlaceholderScreen(categoryID: nil, router: AppRouter())
    }
    .preferredColorScheme(.dark)
}
