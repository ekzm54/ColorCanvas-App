import SwiftUI

extension DesignTokens {
    public struct Elevation {
        public let radius: CGFloat
        public let x: CGFloat
        public let y: CGFloat
        public let opacity: Double

        public static let level0 = Elevation(radius: 0, x: 0, y: 0, opacity: DesignTokens.OpacityToken.hidden)
        public static let level1 = Elevation(radius: 4, x: 0, y: 1, opacity: 0.08)
        public static let level2 = Elevation(radius: 8, x: 0, y: 2, opacity: 0.12)
        public static let level3 = Elevation(radius: 16, x: 0, y: 4, opacity: 0.16)
    }
}

extension View {
    public func elevation(_ elevation: DesignTokens.Elevation) -> some View {
        shadow(
            color: DesignTokens.Color.shadow.opacity(elevation.opacity),
            radius: elevation.radius,
            x: elevation.x,
            y: elevation.y
        )
    }
}
