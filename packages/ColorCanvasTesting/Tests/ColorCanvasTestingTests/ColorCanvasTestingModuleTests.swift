import XCTest
@testable import ColorCanvasTesting

final class ColorCanvasTestingModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasTestingModule.isBootstrapped)
    }
}
