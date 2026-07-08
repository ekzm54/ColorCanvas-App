import ColorCanvasDomain

public protocol ErrorMessageMapping {
    func message(for error: AppError) -> String
}

public struct DefaultErrorMessageMapper: ErrorMessageMapping {
    public init() {}

    public func message(for error: AppError) -> String {
        switch error {
        case .unknown:
            return "Something went wrong. Please try again."
        case .unexpected(let underlyingDescription):
            return underlyingDescription
        }
    }
}
