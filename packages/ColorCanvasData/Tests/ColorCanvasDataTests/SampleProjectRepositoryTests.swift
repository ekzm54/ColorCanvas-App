import XCTest
import Foundation
import ColorCanvasDomain
@testable import ColorCanvasData

final class SampleProjectRepositoryTests: XCTestCase {
    func testFetchMostRecentProjectReturnsFirst() async throws {
        let projects = [
            ProjectSummary(id: ProjectID(rawValue: "1"), title: "One", lastEditedAt: Date()),
            ProjectSummary(id: ProjectID(rawValue: "2"), title: "Two", lastEditedAt: Date())
        ]
        let sut = SampleProjectRepository(projects: projects)
        let mostRecent = try await sut.fetchMostRecentProject()
        XCTAssertEqual(mostRecent, projects[0])
    }

    func testFetchMostRecentProjectReturnsNilWhenEmpty() async throws {
        let sut = SampleProjectRepository(projects: [])
        let mostRecent = try await sut.fetchMostRecentProject()
        XCTAssertNil(mostRecent)
    }

    func testFetchRecentProjectsRespectsLimit() async throws {
        let projects = (1...5).map {
            ProjectSummary(id: ProjectID(rawValue: "\($0)"), title: "Project \($0)", lastEditedAt: Date())
        }
        let sut = SampleProjectRepository(projects: projects)
        let recent = try await sut.fetchRecentProjects(limit: 2)
        XCTAssertEqual(recent, Array(projects.prefix(2)))
    }

    func testDefaultProjectsIsNonEmpty() {
        XCTAssertFalse(SampleProjectRepository.defaultProjects.isEmpty)
    }
}
