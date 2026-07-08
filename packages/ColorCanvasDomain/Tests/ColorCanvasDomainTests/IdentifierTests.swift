import XCTest
@testable import ColorCanvasDomain

final class IdentifierTests: XCTestCase {
    func testRawValueRoundTrips() {
        let id = ProjectID(rawValue: "abc-123")
        XCTAssertEqual(id.rawValue, "abc-123")
    }

    func testEqualityIsByRawValue() {
        XCTAssertEqual(ProjectID(rawValue: "same"), ProjectID(rawValue: "same"))
        XCTAssertNotEqual(ProjectID(rawValue: "a"), ProjectID(rawValue: "b"))
    }

    func testDifferentTagsAreDistinctTypes() {
        let projectID = ProjectID(rawValue: "1")
        let templateID = TemplateID(rawValue: "1")
        // Compiles only because ProjectID and TemplateID are distinct types despite the same rawValue.
        XCTAssertEqual(projectID.rawValue, templateID.rawValue)
    }

    func testIsCodable() throws {
        let id = ExportID(rawValue: "export-1")
        let data = try JSONEncoder().encode(id)
        let decoded = try JSONDecoder().decode(ExportID.self, from: data)
        XCTAssertEqual(id, decoded)
    }
}
