import ColorCanvasDomain

/// Sample/mock data standing in for a real template catalog until Sprint 005 (Gallery)
/// builds the real repository. Wired at the app composition root only.
public final class SampleTemplateRepository: TemplateRepositoryProtocol {
    private let templates: [TemplateSummary]
    private let categories: [Category]

    public init(
        templates: [TemplateSummary] = SampleTemplateRepository.defaultTemplates,
        categories: [Category] = SampleTemplateRepository.defaultCategories
    ) {
        self.templates = templates
        self.categories = categories
    }

    public func fetchFeaturedTemplates() async throws -> [TemplateSummary] {
        templates
    }

    public func fetchCategories() async throws -> [Category] {
        categories
    }

    public static let defaultCategories: [Category] = [
        Category(id: CategoryID(rawValue: "animals"), name: "Animals"),
        Category(id: CategoryID(rawValue: "nature"), name: "Nature"),
        Category(id: CategoryID(rawValue: "mandalas"), name: "Mandalas")
    ]

    public static let defaultTemplates: [TemplateSummary] = [
        TemplateSummary(
            id: TemplateID(rawValue: "template-1"),
            title: "Fox in the Forest",
            categoryID: CategoryID(rawValue: "animals")
        ),
        TemplateSummary(
            id: TemplateID(rawValue: "template-2"),
            title: "Blooming Garden",
            categoryID: CategoryID(rawValue: "nature")
        ),
        TemplateSummary(
            id: TemplateID(rawValue: "template-3"),
            title: "Geometric Mandala",
            categoryID: CategoryID(rawValue: "mandalas")
        )
    ]
}
