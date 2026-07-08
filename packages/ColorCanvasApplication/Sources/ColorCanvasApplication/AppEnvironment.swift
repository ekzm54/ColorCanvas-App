import ColorCanvasDomain
import ColorCanvasShared
import Combine

public final class AppEnvironment: ObservableObject {
    public let logger: Logging
    public let preferences: PreferencesRepository
    public let errorMessageMapper: ErrorMessageMapping
    public let router: AppRouter

    public init(
        logger: Logging,
        preferences: PreferencesRepository,
        errorMessageMapper: ErrorMessageMapping,
        router: AppRouter
    ) {
        self.logger = logger
        self.preferences = preferences
        self.errorMessageMapper = errorMessageMapper
        self.router = router
    }
}
