import ColorCanvasDesignSystem
import ColorCanvasDomain
import Foundation
import SwiftUI

struct RecentProjectsSection: View {
    let projects: [ProjectSummary]
    let onSelect: (ProjectSummary) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Space.md) {
            Text("Recent Projects")
                .font(DesignTokens.Typography.headline)
                .foregroundStyle(DesignTokens.Color.textPrimary)
            ForEach(projects) { project in
                Button(action: { onSelect(project) }) {
                    ProjectCardSkeleton(title: project.title)
                }
                .buttonStyle(.plain)
                .accessibilityLabel(project.title)
            }
        }
    }
}

#Preview("RecentProjectsSection - Light") {
    RecentProjectsSection(
        projects: [
            ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Sunset Garden", lastEditedAt: Date()),
            ProjectSummary(id: ProjectID(rawValue: "p2"), title: "Ocean Friends", lastEditedAt: Date())
        ],
        onSelect: { _ in }
    )
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.light)
}

#Preview("RecentProjectsSection - Dark") {
    RecentProjectsSection(
        projects: [
            ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Sunset Garden", lastEditedAt: Date()),
            ProjectSummary(id: ProjectID(rawValue: "p2"), title: "Ocean Friends", lastEditedAt: Date())
        ],
        onSelect: { _ in }
    )
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.dark)
}
