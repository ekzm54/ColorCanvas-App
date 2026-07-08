import XCTest
import Foundation
import ColorCanvasDomain
@testable import ColorCanvasApplication

private struct FakeProjectRepository: ProjectRepositoryProtocol {
    var mostRecent: ProjectSummary?
    var recent: [ProjectSummary]
    var error: Error?

    func fetchMostRecentProject() async throws -> ProjectSummary? {
        if let error { throw error }
        return mostRecent
    }

    func fetchRecentProjects(limit: Int) async throws -> [ProjectSummary] {
        if let error { throw error }
        return Array(recent.prefix(limit))
    }
}

private struct FakeTemplateRepository: TemplateRepositoryProtocol {
    var templates: [TemplateSummary]
    var categories: [Category]

    func fetchFeaturedTemplates() async throws -> [TemplateSummary] {
        templates
    }

    func fetchCategories() async throws -> [Category] {
        categories
    }
}

final class HomeUseCasesTests: XCTestCase {
    func testLoadHomeAggregatesAllFourSources() async throws {
        let project = ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Continue Me", lastEditedAt: Date())
        let template = TemplateSummary(
            id: TemplateID(rawValue: "t1"),
            title: "Fox",
            categoryID: CategoryID(rawValue: "animals")
        )
        let category = Category(id: CategoryID(rawValue: "animals"), name: "Animals")

        let sut = DefaultHomeUseCases(
            projectRepository: FakeProjectRepository(mostRecent: project, recent: [project], error: nil),
            templateRepository: FakeTemplateRepository(templates: [template], categories: [category])
        )

        let data = try await sut.loadHome()

        XCTAssertEqual(data.continueProject, project)
        XCTAssertEqual(data.featuredTemplates, [template])
        XCTAssertEqual(data.categories, [category])
    }

    func testLoadHomeExcludesContinueProjectFromRecentProjects() async throws {
        let continueProject = ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Continue Me", lastEditedAt: Date())
        let otherProject = ProjectSummary(id: ProjectID(rawValue: "p2"), title: "Other", lastEditedAt: Date())

        let sut = DefaultHomeUseCases(
            projectRepository: FakeProjectRepository(
                mostRecent: continueProject,
                recent: [continueProject, otherProject],
                error: nil
            ),
            templateRepository: FakeTemplateRepository(templates: [], categories: [])
        )

        let data = try await sut.loadHome()

        XCTAssertEqual(data.recentProjects, [otherProject], "the continue project must not also appear in recent")
    }

    func testLoadHomeKeepsAllRecentProjectsWhenNoContinueProject() async throws {
        let projectA = ProjectSummary(id: ProjectID(rawValue: "a"), title: "A", lastEditedAt: Date())
        let projectB = ProjectSummary(id: ProjectID(rawValue: "b"), title: "B", lastEditedAt: Date())

        let sut = DefaultHomeUseCases(
            projectRepository: FakeProjectRepository(mostRecent: nil, recent: [projectA, projectB], error: nil),
            templateRepository: FakeTemplateRepository(templates: [], categories: [])
        )

        let data = try await sut.loadHome()

        XCTAssertEqual(data.recentProjects, [projectA, projectB])
    }

    func testLoadHomePropagatesRepositoryError() async {
        let sut = DefaultHomeUseCases(
            projectRepository: FakeProjectRepository(mostRecent: nil, recent: [], error: AppError.unknown),
            templateRepository: FakeTemplateRepository(templates: [], categories: [])
        )

        do {
            _ = try await sut.loadHome()
            XCTFail("expected loadHome to throw")
        } catch {
            XCTAssertEqual(error as? AppError, .unknown)
        }
    }
}
