import XCTest
import Foundation
@testable import ColorCanvasDomain

final class ProjectSummaryTests: XCTestCase {
    func testEqualityIsByAllFields() {
        let date = Date(timeIntervalSince1970: 0)
        let a = ProjectSummary(id: ProjectID(rawValue: "1"), title: "Sunset", lastEditedAt: date)
        let b = ProjectSummary(id: ProjectID(rawValue: "1"), title: "Sunset", lastEditedAt: date)
        let c = ProjectSummary(id: ProjectID(rawValue: "2"), title: "Sunset", lastEditedAt: date)
        XCTAssertEqual(a, b)
        XCTAssertNotEqual(a, c)
    }
}

final class TemplateSummaryTests: XCTestCase {
    func testEqualityIsByAllFields() {
        let categoryID = CategoryID(rawValue: "animals")
        let a = TemplateSummary(id: TemplateID(rawValue: "1"), title: "Fox", categoryID: categoryID)
        let b = TemplateSummary(id: TemplateID(rawValue: "1"), title: "Fox", categoryID: categoryID)
        XCTAssertEqual(a, b)
    }
}

final class CategoryTests: XCTestCase {
    func testEqualityIsByAllFields() {
        let a = Category(id: CategoryID(rawValue: "animals"), name: "Animals")
        let b = Category(id: CategoryID(rawValue: "animals"), name: "Animals")
        let c = Category(id: CategoryID(rawValue: "nature"), name: "Nature")
        XCTAssertEqual(a, b)
        XCTAssertNotEqual(a, c)
    }
}
