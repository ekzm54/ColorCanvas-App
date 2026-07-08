import XCTest
@testable import ColorCanvasUI

final class ColorCanvasUIModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasUIModule.isBootstrapped)
    }
}
