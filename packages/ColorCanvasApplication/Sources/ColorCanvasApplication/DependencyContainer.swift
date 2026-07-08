import ColorCanvasDomain
import ColorCanvasShared

public final class DependencyContainer {
    public let environment: AppEnvironment

    public init(
        logger: Logging,
        preferences: PreferencesRepository,
        errorMessageMapper: ErrorMessageMapping = DefaultErrorMessageMapper(),
        router: AppRouter = AppRouter()
    ) {
        self.environment = AppEnvironment(
            logger: logger,
            preferences: preferences,
            errorMessageMapper: errorMessageMapper,
            router: router
        )
    }
}
