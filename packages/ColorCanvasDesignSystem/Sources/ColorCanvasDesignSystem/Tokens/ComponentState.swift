extension DesignTokens {
    public enum ComponentState {
        case normal
        case pressed
        case disabled
        case selected
    }

    public enum ComponentStateToken {
        public static func opacity(isEnabled: Bool, isPressed: Bool) -> Double {
            if !isEnabled { return OpacityToken.disabled }
            if isPressed { return OpacityToken.pressed }
            return OpacityToken.full
        }
    }
}
