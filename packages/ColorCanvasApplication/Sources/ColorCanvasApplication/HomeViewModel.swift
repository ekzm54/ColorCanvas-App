import ColorCanvasDomain
import Combine
import Foundation

@MainActor
public final class HomeViewModel: ObservableObject {
    @Published public private(set) var state: HomeState = .loading

    private let useCases: HomeUseCases
    private let router: AppRouter
    private let errorMessageMapper: ErrorMessageMapping

    public init(
        useCases: HomeUseCases,
        router: AppRouter,
        errorMessageMapper: ErrorMessageMapping = DefaultErrorMessageMapper()
    ) {
        self.useCases = useCases
        self.router = router
        self.errorMessageMapper = errorMessageMapper
    }

    public func load() async {
        state = .loading
        do {
            let data = try await useCases.loadHome()
            state = data.isEmpty ? .empty : .ready(data)
        } catch let error as AppError {
            state = .error(error)
        } catch {
            state = .error(.unexpected(underlyingDescription: error.localizedDescription))
        }
    }

    public func retryTapped() {
        Task { await load() }
    }

    public func errorMessage(for error: AppError) -> String {
        errorMessageMapper.message(for: error)
    }

    public func continueProjectTapped(_ project: ProjectSummary) {
        router.push(.studio(projectID: project.id))
    }

    public func recentProjectTapped(_ project: ProjectSummary) {
        router.push(.studio(projectID: project.id))
    }

    public func categoryTapped(_ category: Category) {
        router.push(.gallery(categoryID: category.id))
    }

    public func templateTapped(_ template: TemplateSummary) {
        router.presentModal(.templateDetail(templateID: template.id))
    }

    public func settingsTapped() {
        router.push(.settings)
    }

    public func searchTapped() {
        router.push(.gallery(categoryID: nil))
    }
}
