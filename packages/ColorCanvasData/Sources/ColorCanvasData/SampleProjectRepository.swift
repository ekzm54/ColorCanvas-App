import ColorCanvasDomain
import Foundation

/// Sample/mock data standing in for real persistence until ColorCanvasDocument/Data
/// build a FileManager-backed repository. Wired at the app composition root only.
public final class SampleProjectRepository: ProjectRepositoryProtocol {
    private let projects: [ProjectSummary]

    public init(projects: [ProjectSummary] = SampleProjectRepository.defaultProjects) {
        self.projects = projects
    }

    public func fetchMostRecentProject() async throws -> ProjectSummary? {
        projects.first
    }

    public func fetchRecentProjects(limit: Int) async throws -> [ProjectSummary] {
        Array(projects.prefix(limit))
    }

    public static let defaultProjects: [ProjectSummary] = [
        ProjectSummary(
            id: ProjectID(rawValue: "sample-project-1"),
            title: "Sunset Garden",
            lastEditedAt: Date(timeIntervalSinceNow: -3_600)
        ),
        ProjectSummary(
            id: ProjectID(rawValue: "sample-project-2"),
            title: "Ocean Friends",
            lastEditedAt: Date(timeIntervalSinceNow: -86_400)
        ),
        ProjectSummary(
            id: ProjectID(rawValue: "sample-project-3"),
            title: "Mountain Path",
            lastEditedAt: Date(timeIntervalSinceNow: -172_800)
        )
    ]
}
