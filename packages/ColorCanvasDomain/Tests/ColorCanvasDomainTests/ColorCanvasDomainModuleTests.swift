import XCTest
@testable import ColorCanvasDomain

final class ColorCanvasDomainModuleTests: XCTestCase {
    func testModuleIsBootstrapped() {
        XCTAssertTrue(ColorCanvasDomainModule.isBootstrapped)
    }
}
