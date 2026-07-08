import XCTest
@testable import ColorCanvasApplication

final class AppRouterTests: XCTestCase {
    func testPushAppendsRoute() {
        let router = AppRouter()
        router.push(.root)
        XCTAssertEqual(router.path, [.root])
    }

    func testPopRemovesLastRoute() {
        let router = AppRouter()
        router.push(.root)
        router.push(.root)
        router.pop()
        XCTAssertEqual(router.path, [.root])
    }

    func testPopOnEmptyPathIsNoOp() {
        let router = AppRouter()
        router.pop()
        XCTAssertEqual(router.path, [])
    }

    func testPopToRootClearsPath() {
        let router = AppRouter()
        router.push(.root)
        router.push(.root)
        router.popToRoot()
        XCTAssertEqual(router.path, [])
    }

    func testPresentAndDismissModal() {
        let router = AppRouter()
        XCTAssertNil(router.presentedModal)

        router.presentModal(.root)
        XCTAssertEqual(router.presentedModal, .root)

        router.dismissModal()
        XCTAssertNil(router.presentedModal)
    }
}
