import XCTest
@testable import ColorCanvasExport

final class ColorCanvasExportModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasExportModule.isBootstrapped)
    }
}
