import SwiftUI

extension DesignTokens {
    public enum AnimationToken {
        public static let quick = Animation.easeInOut(duration: 0.15)
        public static let standard = Animation.easeInOut(duration: 0.25)
        public static let slow = Animation.easeInOut(duration: 0.4)
        public static let spring = Animation.spring(response: 0.35, dampingFraction: 0.8)
    }
}
