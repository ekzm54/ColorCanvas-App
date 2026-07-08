import Foundation

public struct ProjectSummary: Hashable, Identifiable {
    public let id: ProjectID
    public let title: String
    public let lastEditedAt: Date

    public init(id: ProjectID, title: String, lastEditedAt: Date) {
        self.id = id
        self.title = title
        self.lastEditedAt = lastEditedAt
    }
}
