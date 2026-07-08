import XCTest
import ColorCanvasDomain
@testable import ColorCanvasApplication

final class ErrorMessageMapperTests: XCTestCase {
    func testUnknownMapsToGenericMessage() {
        let sut = DefaultErrorMessageMapper()
        XCTAssertEqual(sut.message(for: .unknown), "Something went wrong. Please try again.")
    }

    func testUnexpectedMapsToUnderlyingDescription() {
        let sut = DefaultErrorMessageMapper()
        XCTAssertEqual(sut.message(for: .unexpected(underlyingDescription: "disk full")), "disk full")
    }
}
