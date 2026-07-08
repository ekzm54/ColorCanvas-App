import ColorCanvasApplication
import SwiftUI

public struct RootView: View {
    @ObservedObject private var router: AppRouter

    public init(router: AppRouter) {
        self.router = router
    }

    public var body: some View {
        NavigationStack(path: $router.path) {
            HomePlaceholderScreen(router: router)
                .navigationDestination(for: Route.self) { route in
                    destination(for: route)
                }
        }
        .sheet(item: $router.presentedModal) { modalRoute in
            ModalPlaceholderScreen(modalRoute: modalRoute, router: router)
        }
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .home:
            HomePlaceholderScreen(router: router)
        case .gallery(let categoryID):
            GalleryPlaceholderScreen(categoryID: categoryID, router: router)
        case .projects:
            ProjectsPlaceholderScreen(router: router)
        case .settings:
            SettingsPlaceholderScreen()
        case .studio(let projectID):
            StudioPlaceholderScreen(projectID: projectID, router: router)
        case .export(let projectID):
            ExportPlaceholderScreen(projectID: projectID)
        }
    }
}

#Preview("RootView - Light") {
    RootView(router: AppRouter())
        .preferredColorScheme(.light)
}

#Preview("RootView - Dark") {
    RootView(router: AppRouter())
        .preferredColorScheme(.dark)
}
