import ColorCanvasDesignSystem
import ColorCanvasDomain
import Foundation
import SwiftUI

struct ContinueProjectCard: View {
    let project: ProjectSummary
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: DesignTokens.Space.sm) {
                Text("Continue")
                    .font(DesignTokens.Typography.caption)
                    .foregroundStyle(DesignTokens.Color.textSecondary)
                ProjectCardSkeleton(title: project.title)
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Continue \(project.title)")
    }
}

#Preview("ContinueProjectCard - Light") {
    ContinueProjectCard(
        project: ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Sunset Garden", lastEditedAt: Date()),
        onTap: {}
    )
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.light)
}

#Preview("ContinueProjectCard - Dark") {
    ContinueProjectCard(
        project: ProjectSummary(id: ProjectID(rawValue: "p1"), title: "Sunset Garden", lastEditedAt: Date()),
        onTap: {}
    )
    .padding(DesignTokens.Space.lg)
    .preferredColorScheme(.dark)
}
