import XCTest
import Foundation
import ColorCanvasDomain
@testable import ColorCanvasApplication

private struct FakeHomeUseCases: HomeUseCases {
    var result: Result<HomeViewData, Error>

    func loadHome() async throws -> HomeViewData {
        try result.get()
    }
}

@MainActor
final class HomeViewModelTests: XCTestCase {
    private let sampleProject = ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Sample", lastEditedAt: Date())
    private let sampleCategory = Category(id: CategoryID(rawValue: "animals"), name: "Animals")
    private let sampleTemplate = TemplateSummary(
        id: TemplateID(rawValue: "t1"),
        title: "Fox",
        categoryID: CategoryID(rawValue: "animals")
    )

    func testInitialStateIsLoading() {
        let sut = HomeViewModel(
            useCases: FakeHomeUseCases(result: .success(emptyData())),
            router: AppRouter()
        )
        XCTAssertEqual(sut.state, .loading)
    }

    func testLoadTransitionsToReadyWhenDataIsPresent() async {
        let data = HomeViewData(
            continueProject: sampleProject,
            featuredTemplates: [sampleTemplate],
            categories: [sampleCategory],
            recentProjects: [sampleProject]
        )
        let sut = HomeViewModel(useCases: FakeHomeUseCases(result: .success(data)), router: AppRouter())

        await sut.load()

        XCTAssertEqual(sut.state, .ready(data))
    }

    func testLoadTransitionsToEmptyWhenDataHasNothing() async {
        let sut = HomeViewModel(useCases: FakeHomeUseCases(result: .success(emptyData())), router: AppRouter())

        await sut.load()

        XCTAssertEqual(sut.state, .empty)
    }

    func testLoadTransitionsToErrorOnAppErrorFailure() async {
        let sut = HomeViewModel(useCases: FakeHomeUseCases(result: .failure(AppError.unknown)), router: AppRouter())

        await sut.load()

        XCTAssertEqual(sut.state, .error(.unknown))
    }

    func testContinueProjectTappedRoutesToStudio() {
        let router = AppRouter()
        let sut = HomeViewModel(useCases: FakeHomeUseCases(result: .success(emptyData())), router: router)

        sut.continueProjectTapped(sampleProject)

        XCTAssertEqual(router.path, [.studio(projectID: sampleProject.id)])
    }

    func testCategoryTappedRoutesToGallery() {
        let router = AppRouter()
        let sut = HomeViewModel(useCases: FakeHomeUseCases(result: .success(emptyData())), router: router)

        sut.categoryTapped(sampleCategory)

        XCTAssertEqual(router.path, [.gallery(categoryID: sampleCategory.id)])
    }

    func testTemplateTappedPresentsTemplateDetailModal() {
        let router = AppRouter()
        let sut = HomeViewModel(useCases: FakeHomeUseCases(result: .success(emptyData())), router: router)

        sut.templateTapped(sampleTemplate)

        XCTAssertEqual(router.presentedModal, .templateDetail(templateID: sampleTemplate.id))
        XCTAssertEqual(router.path, [], "presenting a modal must not push onto the navigation path")
    }

    func testSettingsTappedRoutesToSettings() {
        let router = AppRouter()
        let sut = HomeViewModel(useCases: FakeHomeUseCases(result: .success(emptyData())), router: router)

        sut.settingsTapped()

        XCTAssertEqual(router.path, [.settings])
    }

    func testSearchTappedRoutesToGalleryWithoutCategory() {
        let router = AppRouter()
        let sut = HomeViewModel(useCases: FakeHomeUseCases(result: .success(emptyData())), router: router)

        sut.searchTapped()

        XCTAssertEqual(router.path, [.gallery(categoryID: nil)])
    }

    private func emptyData() -> HomeViewData {
        HomeViewData(continueProject: nil, featuredTemplates: [], categories: [], recentProjects: [])
    }
}
