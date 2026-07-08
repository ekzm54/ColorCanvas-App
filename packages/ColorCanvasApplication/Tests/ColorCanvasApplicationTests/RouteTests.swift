import XCTest
import ColorCanvasDomain
@testable import ColorCanvasApplication

final class RouteTests: XCTestCase {
    func testEqualityConsidersAssociatedValues() {
        let projectID = ProjectID(rawValue: "p1")
        XCTAssertEqual(Route.studio(projectID: projectID), Route.studio(projectID: projectID))
        XCTAssertNotEqual(
            Route.studio(projectID: projectID),
            Route.studio(projectID: ProjectID(rawValue: "p2"))
        )
        XCTAssertNotEqual(Route.gallery(categoryID: nil), Route.projects)
    }

    func testIdentifiableIDMatchesSelf() {
        let route = Route.settings
        XCTAssertEqual(route.id, route)
    }
}

final class ModalRouteTests: XCTestCase {
    func testEqualityConsidersAssociatedValues() {
        let exportID = ExportID(rawValue: "e1")
        XCTAssertEqual(ModalRoute.shareSheet(exportID: exportID), ModalRoute.shareSheet(exportID: exportID))
        XCTAssertNotEqual(ModalRoute.colorPicker, ModalRoute.brushPanel)
    }

    func testIdentifiableIDMatchesSelf() {
        let modalRoute = ModalRoute.colorPicker
        XCTAssertEqual(modalRoute.id, modalRoute)
    }
}
