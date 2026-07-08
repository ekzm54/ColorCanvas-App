public struct TemplateSummary: Hashable, Identifiable {
    public let id: TemplateID
    public let title: String
    public let categoryID: CategoryID

    public init(id: TemplateID, title: String, categoryID: CategoryID) {
        self.id = id
        self.title = title
        self.categoryID = categoryID
    }
}
