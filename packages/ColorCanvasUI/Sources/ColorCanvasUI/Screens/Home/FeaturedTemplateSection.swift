import ColorCanvasDesignSystem
import ColorCanvasDomain
import SwiftUI

struct FeaturedTemplateSection: View {
    let templates: [TemplateSummary]
    let onSelect: (TemplateSummary) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Space.md) {
            Text("Featured Templates")
                .font(DesignTokens.Typography.headline)
                .foregroundStyle(DesignTokens.Color.textPrimary)
                .accessibilityAddTraits(.isHeader)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DesignTokens.Space.md) {
                    ForEach(templates) { template in
                        Button(action: { onSelect(template) }) {
                            TemplateCardSkeleton(title: template.title)
                                .frame(width: DesignTokens.Size.featuredTemplateWidth)
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel(template.title)
                    }
                }
            }
        }
    }
}

#Preview("FeaturedTemplateSection - Light") {
    FeaturedTemplateSection(
        templates: [
            TemplateSummary(id: TemplateID(rawValue: "t1"), title: "Fox", categoryID: CategoryID(rawValue: "animals")),
            TemplateSummary(id: TemplateID(rawValue: "t2"), title: "Garden", categoryID: CategoryID(rawValue: "nature"))
        ],
        onSelect: { _ in }
    )
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.light)
}

#Preview("FeaturedTemplateSection - Dark") {
    FeaturedTemplateSection(
        templates: [
            TemplateSummary(id: TemplateID(rawValue: "t1"), title: "Fox", categoryID: CategoryID(rawValue: "animals")),
            TemplateSummary(id: TemplateID(rawValue: "t2"), title: "Garden", categoryID: CategoryID(rawValue: "nature"))
        ],
        onSelect: { _ in }
    )
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.dark)
}
