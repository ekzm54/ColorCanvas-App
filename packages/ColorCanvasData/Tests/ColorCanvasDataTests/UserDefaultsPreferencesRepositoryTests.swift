import XCTest
@testable import ColorCanvasData

final class UserDefaultsPreferencesRepositoryTests: XCTestCase {
    private func makeSUT() throws -> UserDefaultsPreferencesRepository {
        let suiteName = "ColorCanvasDataTests.\(UUID().uuidString)"
        let defaults = try XCTUnwrap(UserDefaults(suiteName: suiteName))
        return UserDefaultsPreferencesRepository(defaults: defaults)
    }

    func testReturnsDefaultWhenKeyIsAbsent() throws {
        let sut = try makeSUT()
        XCTAssertTrue(sut.bool(forKey: "missing", default: true))
        XCTAssertFalse(sut.bool(forKey: "missing", default: false))
    }

    func testRoundTripsStoredValue() throws {
        let sut = try makeSUT()
        sut.setBool(true, forKey: "flag")
        XCTAssertTrue(sut.bool(forKey: "flag", default: false))

        sut.setBool(false, forKey: "flag")
        XCTAssertFalse(sut.bool(forKey: "flag", default: true))
    }
}
