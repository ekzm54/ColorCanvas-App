import XCTest
import Foundation
import ColorCanvasDomain
@testable import ColorCanvasApplication

final class HomeViewDataTests: XCTestCase {
    func testIsEmptyWhenEveryFieldIsEmpty() {
        let data = HomeViewData(continueProject: nil, featuredTemplates: [], categories: [], recentProjects: [])
        XCTAssertTrue(data.isEmpty)
    }

    func testIsNotEmptyWhenContinueProjectIsPresent() {
        let project = ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Sample", lastEditedAt: Date())
        let data = HomeViewData(continueProject: project, featuredTemplates: [], categories: [], recentProjects: [])
        XCTAssertFalse(data.isEmpty)
    }

    func testIsNotEmptyWhenFeaturedTemplatesArePresent() {
        let template = TemplateSummary(
            id: TemplateID(rawValue: "t1"),
            title: "Fox",
            categoryID: CategoryID(rawValue: "animals")
        )
        let data = HomeViewData(continueProject: nil, featuredTemplates: [template], categories: [], recentProjects: [])
        XCTAssertFalse(data.isEmpty)
    }

    func testIsNotEmptyWhenOnlyCategoriesArePresent() {
        let category = Category(id: CategoryID(rawValue: "animals"), name: "Animals")
        let data = HomeViewData(continueProject: nil, featuredTemplates: [], categories: [category], recentProjects: [])
        XCTAssertFalse(data.isEmpty, "categories alone must still count as content, not an empty Home")
    }

    func testIsNotEmptyWhenOnlyRecentProjectsArePresent() {
        let project = ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Sample", lastEditedAt: Date())
        let data = HomeViewData(continueProject: nil, featuredTemplates: [], categories: [], recentProjects: [project])
        XCTAssertFalse(data.isEmpty)
    }
}
