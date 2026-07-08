import XCTest
@testable import ColorCanvasApplication

final class ColorCanvasApplicationModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasApplicationModule.isBootstrapped)
    }
}
