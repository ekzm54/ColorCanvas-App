import ColorCanvasApplication
import ColorCanvasData
import ColorCanvasShared
import ColorCanvasUI
import SwiftUI

@main
struct ColorCanvasApp: App {
    private let dependencyContainer = DependencyContainer(
        logger: OSLogger(),
        preferences: UserDefaultsPreferencesRepository()
    )

    var body: some Scene {
        WindowGroup {
            RootView(router: dependencyContainer.environment.router)
                .environmentObject(dependencyContainer.environment)
        }
    }
}
