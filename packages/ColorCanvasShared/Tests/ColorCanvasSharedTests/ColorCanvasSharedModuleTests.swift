import XCTest
@testable import ColorCanvasShared

final class ColorCanvasSharedModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasSharedModule.isBootstrapped)
    }
}
