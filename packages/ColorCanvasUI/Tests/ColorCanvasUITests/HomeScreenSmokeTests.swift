import XCTest
import Foundation
import ColorCanvasApplication
import ColorCanvasDomain
@testable import ColorCanvasUI

private struct FakeHomeUseCases: HomeUseCases {
    var result: Result<HomeViewData, Error>

    func loadHome() async throws -> HomeViewData {
        try result.get()
    }
}

@MainActor
final class HomeScreenSmokeTests: XCTestCase {
    private let project = ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Sunset Garden", lastEditedAt: Date())
    private let category = Category(id: CategoryID(rawValue: "animals"), name: "Animals")
    private let template = TemplateSummary(
        id: TemplateID(rawValue: "t1"),
        title: "Fox",
        categoryID: CategoryID(rawValue: "animals")
    )

    func testHomeViewBodyDoesNotCrashWhileLoading() {
        let viewModel = HomeViewModel(useCases: FakeHomeUseCases(result: .success(emptyData())), router: AppRouter())
        _ = HomeView(viewModel: viewModel).body
    }

    func testHomeViewBodyDoesNotCrashInEveryLoadedState() async {
        let readyData = HomeViewData(
            continueProject: project,
            featuredTemplates: [template],
            categories: [category],
            recentProjects: [project]
        )

        let outcomes: [Result<HomeViewData, Error>] = [
            .success(emptyData()),
            .success(readyData),
            .failure(AppError.unknown)
        ]

        for outcome in outcomes {
            let viewModel = HomeViewModel(useCases: FakeHomeUseCases(result: outcome), router: AppRouter())
            await viewModel.load()
            _ = HomeView(viewModel: viewModel).body
        }
    }

    private func emptyData() -> HomeViewData {
        HomeViewData(continueProject: nil, featuredTemplates: [], categories: [], recentProjects: [])
    }

    func testContinueProjectCardBodyDoesNotCrash() {
        _ = ContinueProjectCard(project: project, onTap: {}).body
    }

    func testFeaturedTemplateSectionBodyDoesNotCrash() {
        _ = FeaturedTemplateSection(templates: [template], onSelect: { _ in }).body
    }

    func testCategorySectionBodyDoesNotCrash() {
        _ = CategorySection(categories: [category], onSelect: { _ in }).body
    }

    func testRecentProjectsSectionBodyDoesNotCrash() {
        _ = RecentProjectsSection(projects: [project], onSelect: { _ in }).body
    }
}
