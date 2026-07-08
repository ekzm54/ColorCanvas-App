import ColorCanvasApplication
import SwiftUI

struct SettingsPlaceholderScreen: View {
    var body: some View {
        PlaceholderScreen(title: "Settings", message: "The real Settings screen lands in Sprint 011.") {}
    }
}

#Preview("SettingsPlaceholderScreen - Light") {
    NavigationStack {
        SettingsPlaceholderScreen()
    }
    .preferredColorScheme(.light)
}

#Preview("SettingsPlaceholderScreen - Dark") {
    NavigationStack {
        SettingsPlaceholderScreen()
    }
    .preferredColorScheme(.dark)
}
