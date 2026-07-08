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
        async let continueProjectResult = projectRepository.fetchMostRecentProject()
        async let recentProjectsResult = projectRepository.fetchRecentProjects(limit: Self.recentProjectsLimit)
        async let featuredTemplates = templateRepository.fetchFeaturedTemplates()
        async let categories = templateRepository.fetchCategories()

        let continueProject = try await continueProjectResult
        let recentProjects = try await recentProjectsResult

        return HomeViewData(
            continueProject: continueProject,
            featuredTemplates: try await featuredTemplates,
            categories: try await categories,
            recentProjects: recentProjects.filter { $0.id != continueProject?.id }
        )
    }
}
