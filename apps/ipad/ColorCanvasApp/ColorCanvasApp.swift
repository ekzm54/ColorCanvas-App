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

    private let homeUseCases: HomeUseCases = DefaultHomeUseCases(
        projectRepository: SampleProjectRepository(),
        templateRepository: SampleTemplateRepository()
    )

    var body: some Scene {
        WindowGroup {
            RootView(
                router: dependencyContainer.environment.router,
                homeUseCases: homeUseCases,
                errorMessageMapper: dependencyContainer.environment.errorMessageMapper
            )
            .environmentObject(dependencyContainer.environment)
        }
    }
}
