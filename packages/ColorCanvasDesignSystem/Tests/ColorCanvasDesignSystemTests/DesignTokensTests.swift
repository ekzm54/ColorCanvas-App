import XCTest
import CoreGraphics
@testable import ColorCanvasDesignSystem

final class DesignTokensTests: XCTestCase {
    func testSpaceScaleIsMonotonicallyIncreasingAndDistinct() {
        let scale: [CGFloat] = [
            DesignTokens.Space.xxs,
            DesignTokens.Space.xs,
            DesignTokens.Space.sm,
            DesignTokens.Space.md,
            DesignTokens.Space.lg,
            DesignTokens.Space.xl,
            DesignTokens.Space.xxl,
            DesignTokens.Space.xxxl
        ]
        XCTAssertEqual(scale, scale.sorted())
        XCTAssertEqual(Set(scale).count, scale.count)
    }

    func testRadiusScaleIsMonotonicallyIncreasing() {
        let scale: [CGFloat] = [
            DesignTokens.Radius.none,
            DesignTokens.Radius.sm,
            DesignTokens.Radius.md,
            DesignTokens.Radius.lg,
            DesignTokens.Radius.xl
        ]
        XCTAssertEqual(scale, scale.sorted())
    }

    func testElevationLevelsIncreaseInRadiusAndOpacity() {
        let levels = [
            DesignTokens.Elevation.level0,
            DesignTokens.Elevation.level1,
            DesignTokens.Elevation.level2,
            DesignTokens.Elevation.level3
        ]
        XCTAssertEqual(levels.map(\.radius), levels.map(\.radius).sorted())
        XCTAssertEqual(levels.map(\.opacity), levels.map(\.opacity).sorted())
    }

    func testOpacityTokensAreWithinUnitRange() {
        let tokens: [Double] = [
            DesignTokens.OpacityToken.hidden,
            DesignTokens.OpacityToken.subtle,
            DesignTokens.OpacityToken.disabled,
            DesignTokens.OpacityToken.pressed,
            DesignTokens.OpacityToken.full
        ]
        for value in tokens {
            XCTAssertGreaterThanOrEqual(value, 0)
            XCTAssertLessThanOrEqual(value, 1)
        }
    }

    func testComponentStateOpacityMapping() {
        XCTAssertEqual(
            DesignTokens.ComponentStateToken.opacity(isEnabled: true, isPressed: false),
            DesignTokens.OpacityToken.full
        )
        XCTAssertEqual(
            DesignTokens.ComponentStateToken.opacity(isEnabled: true, isPressed: true),
            DesignTokens.OpacityToken.pressed
        )
        XCTAssertEqual(
            DesignTokens.ComponentStateToken.opacity(isEnabled: false, isPressed: false),
            DesignTokens.OpacityToken.disabled
        )
        XCTAssertEqual(
            DesignTokens.ComponentStateToken.opacity(isEnabled: false, isPressed: true),
            DesignTokens.OpacityToken.disabled,
            "disabled must take priority over pressed"
        )
    }

    func testIconSizeScaleIsMonotonicallyIncreasing() {
        let scale: [CGFloat] = [
            DesignTokens.IconSize.small,
            DesignTokens.IconSize.medium,
            DesignTokens.IconSize.large,
            DesignTokens.IconSize.extraLarge
        ]
        XCTAssertEqual(scale, scale.sorted())
    }

    func testButtonSizeMeetsMinimumTapTarget() {
        XCTAssertGreaterThanOrEqual(DesignTokens.ButtonSize.height, 44)
        XCTAssertGreaterThanOrEqual(DesignTokens.ButtonSize.iconOnlyDimension, 44)
    }

    func testSizeTokensArePositive() {
        XCTAssertGreaterThan(DesignTokens.Size.cardThumbnailHeight, 0)
        XCTAssertGreaterThan(DesignTokens.Size.featuredTemplateWidth, 0)
    }
}
