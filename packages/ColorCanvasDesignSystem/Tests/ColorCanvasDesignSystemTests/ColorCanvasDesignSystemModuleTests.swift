import XCTest
@testable import ColorCanvasDesignSystem

final class ColorCanvasDesignSystemModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasDesignSystemModule.isBootstrapped)
    }
}
