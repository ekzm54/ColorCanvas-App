import ColorCanvasApplication
import SwiftUI

struct ExportPlaceholderScreen: View {
    let projectID: ProjectID

    var body: some View {
        PlaceholderScreen(title: "Export", message: "The real Export & Finish experience lands in Sprint 010.") {}
    }
}

#Preview("ExportPlaceholderScreen - Light") {
    NavigationStack {
        ExportPlaceholderScreen(projectID: ProjectID(rawValue: "preview"))
    }
    .preferredColorScheme(.light)
}

#Preview("ExportPlaceholderScreen - Dark") {
    NavigationStack {
        ExportPlaceholderScreen(projectID: ProjectID(rawValue: "preview"))
    }
    .preferredColorScheme(.dark)
}
