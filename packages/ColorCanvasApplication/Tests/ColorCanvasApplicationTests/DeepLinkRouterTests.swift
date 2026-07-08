import XCTest
import ColorCanvasDomain
@testable import ColorCanvasApplication

final class DeepLinkRouterTests: XCTestCase {
    private let sut = DeepLinkRouter()

    private func url(_ string: String) throws -> URL {
        try XCTUnwrap(URL(string: string))
    }

    func testHomeLink() throws {
        XCTAssertEqual(sut.route(for: try url("colorcanvas://home")), .home)
    }

    func testGalleryLinkWithoutCategory() throws {
        XCTAssertEqual(sut.route(for: try url("colorcanvas://gallery")), .gallery(categoryID: nil))
    }

    func testGalleryLinkWithCategory() throws {
        let route = sut.route(for: try url("colorcanvas://gallery?category=animals"))
        XCTAssertEqual(route, .gallery(categoryID: CategoryID(rawValue: "animals")))
    }

    func testProjectsLink() throws {
        XCTAssertEqual(sut.route(for: try url("colorcanvas://projects")), .projects)
    }

    func testSettingsLink() throws {
        XCTAssertEqual(sut.route(for: try url("colorcanvas://settings")), .settings)
    }

    func testStudioLinkWithProjectID() throws {
        let route = sut.route(for: try url("colorcanvas://studio/p1"))
        XCTAssertEqual(route, .studio(projectID: ProjectID(rawValue: "p1")))
    }

    func testStudioLinkWithoutProjectIDReturnsNil() throws {
        XCTAssertNil(sut.route(for: try url("colorcanvas://studio")))
    }

    func testExportLinkWithProjectID() throws {
        let route = sut.route(for: try url("colorcanvas://export/p1"))
        XCTAssertEqual(route, .export(projectID: ProjectID(rawValue: "p1")))
    }

    func testUnknownHostReturnsNil() throws {
        XCTAssertNil(sut.route(for: try url("colorcanvas://unknown")))
    }
}
