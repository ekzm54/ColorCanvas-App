import XCTest
@testable import ColorCanvasShared

final class OSLoggerTests: XCTestCase {
    func testAllLevelsLogWithoutCrashing() {
        let logger: Logging = OSLogger(subsystem: "com.colorcanvas.tests", category: "OSLoggerTests")

        logger.log(.debug, "debug message")
        logger.log(.info, "info message")
        logger.log(.warning, "warning message")
        logger.log(.error, "error message")
    }
}
