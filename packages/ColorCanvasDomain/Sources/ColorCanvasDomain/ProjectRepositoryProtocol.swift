public protocol ProjectRepositoryProtocol {
    func fetchMostRecentProject() async throws -> ProjectSummary?
    func fetchRecentProjects(limit: Int) async throws -> [ProjectSummary]
}
