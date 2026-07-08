import ColorCanvasDomain

public struct HomeViewData: Equatable {
    public let continueProject: ProjectSummary?
    public let featuredTemplates: [TemplateSummary]
    public let categories: [Category]
    public let recentProjects: [ProjectSummary]

    public init(
        continueProject: ProjectSummary?,
        featuredTemplates: [TemplateSummary],
        categories: [Category],
        recentProjects: [ProjectSummary]
    ) {
        self.continueProject = continueProject
        self.featuredTemplates = featuredTemplates
        self.categories = categories
        self.recentProjects = recentProjects
    }

    public var isEmpty: Bool {
        continueProject == nil && featuredTemplates.isEmpty && categories.isEmpty && recentProjects.isEmpty
    }
}
