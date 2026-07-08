public enum AppError: Error, Equatable {
    case unknown
    case unexpected(underlyingDescription: String)
}
