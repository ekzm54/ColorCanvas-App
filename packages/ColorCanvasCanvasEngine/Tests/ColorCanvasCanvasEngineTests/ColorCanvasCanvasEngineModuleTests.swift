import XCTest
@testable import ColorCanvasCanvasEngine

final class ColorCanvasCanvasEngineModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasCanvasEngineModule.isBootstrapped)
    }
}
