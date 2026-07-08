import os

public struct OSLogger: Logging {
    private let logger: os.Logger

    public init(subsystem: String = "com.colorcanvas.app", category: String = "general") {
        self.logger = os.Logger(subsystem: subsystem, category: category)
    }

    public func log(_ level: LogLevel, _ message: String) {
        switch level {
        case .debug:
            logger.debug("\(message, privacy: .public)")
        case .info:
            logger.info("\(message, privacy: .public)")
        case .warning:
            logger.warning("\(message, privacy: .public)")
        case .error:
            logger.error("\(message, privacy: .public)")
        }
    }
}
