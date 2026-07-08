import XCTest
import ColorCanvasApplication
@testable import ColorCanvasUI

final class ScreensSmokeTests: XCTestCase {
    func testPlaceholderScreenBodyDoesNotCrash() {
        _ = PlaceholderScreen(title: "Title", message: "Message") { EmptyView() }.body
    }

    func testModalPlaceholderScreenBodyDoesNotCrashForEveryModalRoute() {
        let router = AppRouter()
        let modalRoutes: [ModalRoute] = [
            .templateDetail(templateID: TemplateID(rawValue: "t1")),
            .colorPicker,
            .brushPanel,
            .renameProject(projectID: ProjectID(rawValue: "p1")),
            .deleteConfirmation(projectID: ProjectID(rawValue: "p1")),
            .shareSheet(exportID: ExportID(rawValue: "e1"))
        ]
        for modalRoute in modalRoutes {
            _ = ModalPlaceholderScreen(modalRoute: modalRoute, router: router).body
        }
    }

    func testHomePlaceholderScreenBodyDoesNotCrash() {
        _ = HomePlaceholderScreen(router: AppRouter()).body
    }

    func testGalleryPlaceholderScreenBodyDoesNotCrash() {
        _ = GalleryPlaceholderScreen(categoryID: nil, router: AppRouter()).body
    }

    func testProjectsPlaceholderScreenBodyDoesNotCrash() {
        _ = ProjectsPlaceholderScreen(router: AppRouter()).body
    }

    func testSettingsPlaceholderScreenBodyDoesNotCrash() {
        _ = SettingsPlaceholderScreen().body
    }

    func testStudioPlaceholderScreenBodyDoesNotCrash() {
        _ = StudioPlaceholderScreen(projectID: ProjectID(rawValue: "p1"), router: AppRouter()).body
    }

    func testExportPlaceholderScreenBodyDoesNotCrash() {
        _ = ExportPlaceholderScreen(projectID: ProjectID(rawValue: "p1")).body
    }
}
