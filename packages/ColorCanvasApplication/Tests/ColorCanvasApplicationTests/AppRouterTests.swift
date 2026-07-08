import XCTest
import ColorCanvasDomain
@testable import ColorCanvasApplication

final class AppRouterTests: XCTestCase {
    func testPushAppendsRoute() {
        let router = AppRouter()
        router.push(.projects)
        XCTAssertEqual(router.path, [.projects])
    }

    func testPopRemovesLastRoute() {
        let router = AppRouter()
        router.push(.projects)
        router.push(.settings)
        router.pop()
        XCTAssertEqual(router.path, [.projects])
    }

    func testPopOnEmptyPathIsNoOp() {
        let router = AppRouter()
        router.pop()
        XCTAssertEqual(router.path, [])
    }

    func testPopToRootClearsPath() {
        let router = AppRouter()
        router.push(.projects)
        router.push(.settings)
        router.popToRoot()
        XCTAssertEqual(router.path, [])
    }

    func testMultiStepPushNavigationMatchesDoneCriteriaFlow() {
        let router = AppRouter()
        let projectID = ProjectID(rawValue: "p1")

        router.push(.gallery(categoryID: nil))
        router.push(.studio(projectID: projectID))
        router.push(.export(projectID: projectID))

        XCTAssertEqual(router.path, [
            .gallery(categoryID: nil),
            .studio(projectID: projectID),
            .export(projectID: projectID)
        ])
    }

    func testPresentAndDismissModalIsSeparateFromPushPath() {
        let router = AppRouter()
        router.push(.projects)
        XCTAssertNil(router.presentedModal)

        router.presentModal(.colorPicker)
        XCTAssertEqual(router.presentedModal, .colorPicker)
        XCTAssertEqual(router.path, [.projects], "presenting a modal must not affect the push path")

        router.dismissModal()
        XCTAssertNil(router.presentedModal)
        XCTAssertEqual(router.path, [.projects], "dismissing a modal must not affect the push path")
    }
}
