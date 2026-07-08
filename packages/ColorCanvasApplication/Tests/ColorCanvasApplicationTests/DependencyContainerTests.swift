import XCTest
import ColorCanvasDomain
import ColorCanvasShared
@testable import ColorCanvasApplication

private struct FakeLogger: Logging {
    func log(_ level: LogLevel, _ message: String) {}
}

private final class FakePreferencesRepository: PreferencesRepository {
    func bool(forKey key: String, default defaultValue: Bool) -> Bool { defaultValue }
    func setBool(_ value: Bool, forKey key: String) {}
}

final class DependencyContainerTests: XCTestCase {
    func testEnvironmentWiresProvidedDependencies() {
        let logger = FakeLogger()
        let preferences = FakePreferencesRepository()

        let sut = DependencyContainer(logger: logger, preferences: preferences)

        XCTAssertTrue(sut.environment.logger is FakeLogger)
        XCTAssertTrue(sut.environment.preferences is FakePreferencesRepository)
        XCTAssertTrue(sut.environment.errorMessageMapper is DefaultErrorMessageMapper)
        XCTAssertEqual(sut.environment.router.path, [])
    }

    func testDefaultsAreSafe() {
        let sut = DependencyContainer(logger: FakeLogger(), preferences: FakePreferencesRepository())
        XCTAssertFalse(sut.environment.preferences.bool(forKey: "anything", default: false))
        XCTAssertTrue(sut.environment.preferences.bool(forKey: "anything", default: true))
    }
}
