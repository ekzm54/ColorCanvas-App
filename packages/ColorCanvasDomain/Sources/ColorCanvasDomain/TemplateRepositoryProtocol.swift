public protocol TemplateRepositoryProtocol {
    func fetchFeaturedTemplates() async throws -> [TemplateSummary]
    func fetchCategories() async throws -> [Category]
}
