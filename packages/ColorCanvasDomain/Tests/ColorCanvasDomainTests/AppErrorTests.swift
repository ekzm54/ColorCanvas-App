import XCTest
@testable import ColorCanvasDomain

final class AppErrorTests: XCTestCase {
    func testUnknownIsEquatable() {
        XCTAssertEqual(AppError.unknown, AppError.unknown)
    }

    func testUnexpectedCarriesDescription() {
        let error = AppError.unexpected(underlyingDescription: "disk full")
        XCTAssertEqual(error, AppError.unexpected(underlyingDescription: "disk full"))
        XCTAssertNotEqual(error, AppError.unknown)
    }
}
