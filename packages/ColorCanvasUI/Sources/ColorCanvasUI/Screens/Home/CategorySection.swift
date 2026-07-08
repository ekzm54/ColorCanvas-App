import ColorCanvasDesignSystem
import ColorCanvasDomain
import SwiftUI

struct CategorySection: View {
    let categories: [Category]
    let onSelect: (Category) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Space.md) {
            Text("Categories")
                .font(DesignTokens.Typography.headline)
                .foregroundStyle(DesignTokens.Color.textPrimary)
                .accessibilityAddTraits(.isHeader)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DesignTokens.Space.sm) {
                    ForEach(categories) { category in
                        CategoryChip(title: category.name) { onSelect(category) }
                    }
                }
            }
        }
    }
}

private struct CategoryChip: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(DesignTokens.Typography.callout)
                .foregroundStyle(DesignTokens.Color.primary)
                .padding(.horizontal, DesignTokens.Space.md)
                .padding(.vertical, DesignTokens.Space.sm)
                .background(
                    Capsule()
                        .stroke(DesignTokens.Color.primary, lineWidth: DesignTokens.BorderWidth.regular)
                )
        }
        .buttonStyle(.plain)
        .accessibilityLabel(title)
    }
}

#Preview("CategorySection - Light") {
    CategorySection(
        categories: [
            Category(id: CategoryID(rawValue: "animals"), name: "Animals"),
            Category(id: CategoryID(rawValue: "nature"), name: "Nature")
        ],
        onSelect: { _ in }
    )
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.light)
}

#Preview("CategorySection - Dark") {
    CategorySection(
        categories: [
            Category(id: CategoryID(rawValue: "animals"), name: "Animals"),
            Category(id: CategoryID(rawValue: "nature"), name: "Nature")
        ],
        onSelect: { _ in }
    )
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.dark)
}
