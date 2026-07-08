import XCTest
@testable import ColorCanvasDocument

final class ColorCanvasDocumentModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasDocumentModule.isBootstrapped)
    }
}
