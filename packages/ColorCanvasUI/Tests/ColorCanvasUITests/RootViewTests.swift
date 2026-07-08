import XCTest
import ColorCanvasApplication
@testable import ColorCanvasUI

final class RootViewTests: XCTestCase {
    func testInstantiatesWithoutCrashing() {
        let router = AppRouter()
        let view = RootView(router: router)
        _ = view.body
    }
}
