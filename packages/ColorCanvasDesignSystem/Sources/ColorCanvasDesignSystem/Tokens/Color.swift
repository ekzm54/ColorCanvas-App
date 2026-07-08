import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

extension Color {
    init(light: Color, dark: Color) {
        #if canImport(UIKit)
        self.init(uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
        #else
        self.init(light)
        #endif
    }
}

extension DesignTokens {
    public enum Color {
        public static let clear = SwiftUI.Color.clear
        public static let shadow = SwiftUI.Color.black

        public static let background = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.97, green: 0.97, blue: 0.98),
            dark: SwiftUI.Color(red: 0.07, green: 0.07, blue: 0.09)
        )

        public static let surface = SwiftUI.Color(
            light: SwiftUI.Color(red: 1.00, green: 1.00, blue: 1.00),
            dark: SwiftUI.Color(red: 0.13, green: 0.13, blue: 0.15)
        )

        public static let surfaceVariant = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.90, green: 0.90, blue: 0.92),
            dark: SwiftUI.Color(red: 0.19, green: 0.19, blue: 0.21)
        )

        public static let primary = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.20, green: 0.47, blue: 0.96),
            dark: SwiftUI.Color(red: 0.35, green: 0.60, blue: 0.98)
        )

        public static let onPrimary = SwiftUI.Color(
            light: SwiftUI.Color(red: 1.00, green: 1.00, blue: 1.00),
            dark: SwiftUI.Color(red: 1.00, green: 1.00, blue: 1.00)
        )

        public static let border = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.78, green: 0.78, blue: 0.80),
            dark: SwiftUI.Color(red: 0.30, green: 0.30, blue: 0.33)
        )

        public static let textPrimary = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.09, green: 0.09, blue: 0.11),
            dark: SwiftUI.Color(red: 0.95, green: 0.95, blue: 0.97)
        )

        public static let textSecondary = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.45, green: 0.45, blue: 0.48),
            dark: SwiftUI.Color(red: 0.65, green: 0.65, blue: 0.68)
        )

        public static let textDisabled = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.65, green: 0.65, blue: 0.67),
            dark: SwiftUI.Color(red: 0.40, green: 0.40, blue: 0.43)
        )

        public static let success = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.20, green: 0.70, blue: 0.40),
            dark: SwiftUI.Color(red: 0.30, green: 0.75, blue: 0.45)
        )

        public static let warning = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.95, green: 0.65, blue: 0.10),
            dark: SwiftUI.Color(red: 0.98, green: 0.70, blue: 0.20)
        )

        public static let error = SwiftUI.Color(
            light: SwiftUI.Color(red: 0.86, green: 0.20, blue: 0.20),
            dark: SwiftUI.Color(red: 0.95, green: 0.35, blue: 0.35)
        )
    }
}
