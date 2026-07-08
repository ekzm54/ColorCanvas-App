import ColorCanvasApplication
import ColorCanvasDesignSystem
import SwiftUI

struct ModalPlaceholderScreen: View {
    let modalRoute: ModalRoute
    @ObservedObject var router: AppRouter

    var body: some View {
        NavigationStack {
            PlaceholderScreen(title: title, message: "This modal is a Sprint 003 navigation placeholder.") {}
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Close") { router.dismissModal() }
                    }
                }
        }
    }

    private var title: String {
        switch modalRoute {
        case .templateDetail:
            return "Template Detail"
        case .colorPicker:
            return "Color Picker"
        case .brushPanel:
            return "Brush Panel"
        case .renameProject:
            return "Rename Project"
        case .deleteConfirmation:
            return "Delete Confirmation"
        case .shareSheet:
            return "Share Sheet"
        }
    }
}

#Preview("ModalPlaceholderScreen - Light") {
    ModalPlaceholderScreen(modalRoute: .colorPicker, router: AppRouter())
        .preferredColorScheme(.light)
}

#Preview("ModalPlaceholderScreen - Dark") {
    ModalPlaceholderScreen(modalRoute: .colorPicker, router: AppRouter())
        .preferredColorScheme(.dark)
}
