import XCTest
@testable import ColorCanvasResources

final class ColorCanvasResourcesModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasResourcesModule.isBootstrapped)
    }
}
