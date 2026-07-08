import XCTest
import ColorCanvasDomain
@testable import ColorCanvasData

final class SampleTemplateRepositoryTests: XCTestCase {
    func testFetchFeaturedTemplatesReturnsConfiguredTemplates() async throws {
        let templates = [
            TemplateSummary(id: TemplateID(rawValue: "t1"), title: "Fox", categoryID: CategoryID(rawValue: "animals"))
        ]
        let sut = SampleTemplateRepository(templates: templates, categories: [])
        let result = try await sut.fetchFeaturedTemplates()
        XCTAssertEqual(result, templates)
    }

    func testFetchCategoriesReturnsConfiguredCategories() async throws {
        let categories = [Category(id: CategoryID(rawValue: "animals"), name: "Animals")]
        let sut = SampleTemplateRepository(templates: [], categories: categories)
        let result = try await sut.fetchCategories()
        XCTAssertEqual(result, categories)
    }

    func testDefaultsAreNonEmptyAndConsistent() {
        XCTAssertFalse(SampleTemplateRepository.defaultTemplates.isEmpty)
        XCTAssertFalse(SampleTemplateRepository.defaultCategories.isEmpty)

        let categoryIDs = Set(SampleTemplateRepository.defaultCategories.map(\.id))
        for template in SampleTemplateRepository.defaultTemplates {
            XCTAssertTrue(
                categoryIDs.contains(template.categoryID),
                "every default template must reference a known category"
            )
        }
    }
}
