import XCTest
import ColorCanvasDomain
@testable import ColorCanvasApplication

final class ScreenStateTests: XCTestCase {
    func testIdleAndLoadingAreEquatable() {
        XCTAssertEqual(ScreenState<Int>.idle, ScreenState<Int>.idle)
        XCTAssertEqual(ScreenState<Int>.loading, ScreenState<Int>.loading)
        XCTAssertNotEqual(ScreenState<Int>.idle, ScreenState<Int>.loading)
    }

    func testLoadedCarriesValue() {
        XCTAssertEqual(ScreenState.loaded(42), ScreenState.loaded(42))
        XCTAssertNotEqual(ScreenState.loaded(42), ScreenState.loaded(7))
    }

    func testFailedCarriesAppError() {
        let state = ScreenState<Int>.failed(.unknown)
        XCTAssertEqual(state, ScreenState<Int>.failed(.unknown))
    }
}
