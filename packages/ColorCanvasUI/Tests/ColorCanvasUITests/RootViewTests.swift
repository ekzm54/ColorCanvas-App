import XCTest
import ColorCanvasApplication
@testable import ColorCanvasUI

private struct FakeHomeUseCases: HomeUseCases {
    func loadHome() async throws -> HomeViewData {
        HomeViewData(continueProject: nil, featuredTemplates: [], categories: [], recentProjects: [])
    }
}

final class RootViewTests: XCTestCase {
    func testInstantiatesWithoutCrashing() {
        let router = AppRouter()
        let view = RootView(
            router: router,
            homeUseCases: FakeHomeUseCases(),
            errorMessageMapper: DefaultErrorMessageMapper()
        )
        _ = view.body
    }
}
