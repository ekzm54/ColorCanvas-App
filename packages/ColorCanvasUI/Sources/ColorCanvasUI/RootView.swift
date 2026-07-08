import ColorCanvasApplication
import SwiftUI

public struct RootView: View {
    @ObservedObject private var router: AppRouter
    private let homeUseCases: HomeUseCases
    private let errorMessageMapper: ErrorMessageMapping

    public init(router: AppRouter, homeUseCases: HomeUseCases, errorMessageMapper: ErrorMessageMapping) {
        self.router = router
        self.homeUseCases = homeUseCases
        self.errorMessageMapper = errorMessageMapper
    }

    public var body: some View {
        NavigationStack(path: $router.path) {
            makeHomeView()
                .navigationDestination(for: Route.self) { route in
                    destination(for: route)
                }
        }
        .sheet(item: $router.presentedModal) { modalRoute in
            ModalPlaceholderScreen(modalRoute: modalRoute, router: router)
        }
    }

    private func makeHomeView() -> HomeView {
        HomeView(
            viewModel: HomeViewModel(useCases: homeUseCases, router: router, errorMessageMapper: errorMessageMapper)
        )
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .home:
            makeHomeView()
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
    RootView(
        router: AppRouter(),
        homeUseCases: PreviewHomeUseCases(),
        errorMessageMapper: DefaultErrorMessageMapper()
    )
    .preferredColorScheme(.light)
}

#Preview("RootView - Dark") {
    RootView(
        router: AppRouter(),
        homeUseCases: PreviewHomeUseCases(),
        errorMessageMapper: DefaultErrorMessageMapper()
    )
    .preferredColorScheme(.dark)
}

private struct PreviewHomeUseCases: HomeUseCases {
    func loadHome() async throws -> HomeViewData {
        HomeViewData(continueProject: nil, featuredTemplates: [], categories: [], recentProjects: [])
    }
}
