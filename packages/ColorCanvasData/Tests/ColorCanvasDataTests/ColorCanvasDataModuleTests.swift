import XCTest
@testable import ColorCanvasData

final class ColorCanvasDataModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasDataModule.isBootstrapped)
    }
}
