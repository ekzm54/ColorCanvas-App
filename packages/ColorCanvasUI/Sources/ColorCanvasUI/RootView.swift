import ColorCanvasApplication
import SwiftUI

public struct RootView: View {
    @ObservedObject private var router: AppRouter

    public init(router: AppRouter) {
        self.router = router
    }

    public var body: some View {
        NavigationStack(path: $router.path) {
            BootstrapRootView()
                .navigationDestination(for: Route.self) { _ in
                    BootstrapRootView()
                }
        }
        .sheet(item: $router.presentedModal) { _ in
            BootstrapRootView()
        }
    }
}
