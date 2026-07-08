public enum LogLevel: String {
    case debug
    case info
    case warning
    case error
}

public protocol Logging {
    func log(_ level: LogLevel, _ message: String)
}
