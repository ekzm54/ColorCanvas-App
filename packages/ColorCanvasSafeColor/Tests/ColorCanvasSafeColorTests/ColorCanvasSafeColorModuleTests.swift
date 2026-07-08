import XCTest
@testable import ColorCanvasSafeColor

final class ColorCanvasSafeColorModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasSafeColorModule.isBootstrapped)
    }
}
