import ColorCanvasDomain

public protocol HomeUseCases {
    func loadHome() async throws -> HomeViewData
}

public struct DefaultHomeUseCases: HomeUseCases {
    private static let recentProjectsLimit = 10

    private let projectRepository: ProjectRepositoryProtocol
    private let templateRepository: TemplateRepositoryProtocol

    public init(projectRepository: ProjectRepositoryProtocol, templateRepository: TemplateRepositoryProtocol) {
        self.projectRepository = projectRepository
        self.templateRepository = templateRepository
    }

    public func loadHome() async throws -> HomeViewData {
        async let continueProject = projectRepository.fetchMostRecentProject()
        async let recentProjects = projectRepository.fetchRecentProjects(limit: Self.recentProjectsLimit)
        async let featuredTemplates = templateRepository.fetchFeaturedTemplates()
        async let categories = templateRepository.fetchCategories()

        return HomeViewData(
            continueProject: try await continueProject,
            featuredTemplates: try await featuredTemplates,
            categories: try await categories,
            recentProjects: try await recentProjects
        )
    }
}
