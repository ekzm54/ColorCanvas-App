import XCTest
import SwiftUI
@testable import ColorCanvasDesignSystem

final class ComponentSmokeTests: XCTestCase {
    func testPrimaryButtonBodyDoesNotCrash() {
        _ = PrimaryButton("Continue") {}.body
    }

    func testSecondaryButtonBodyDoesNotCrash() {
        _ = SecondaryButton("Cancel") {}.body
    }

    func testIconButtonBodyDoesNotCrash() {
        _ = IconButton(systemImageName: "plus", accessibilityLabel: "Add") {}.body
    }

    func testToolButtonBodyDoesNotCrash() {
        _ = ToolButton(systemImageName: "pencil", accessibilityLabel: "Pencil", isSelected: true) {}.body
    }

    func testBaseCardBodyDoesNotCrash() {
        _ = BaseCard { Text("Content") }.body
    }

    func testProjectCardSkeletonBodyDoesNotCrash() {
        _ = ProjectCardSkeleton(title: "My Project").body
    }

    func testTemplateCardSkeletonBodyDoesNotCrash() {
        _ = TemplateCardSkeleton(title: "My Template").body
    }

    func testEmptyStateViewBodyDoesNotCrash() {
        _ = EmptyStateView(title: "Nothing here", message: "Create your first project").body
    }

    func testErrorStateViewBodyDoesNotCrash() {
        _ = ErrorStateView(title: "Something went wrong", message: "Please try again", retryAction: {}).body
    }

    func testLoadingStateViewBodyDoesNotCrash() {
        _ = LoadingStateView(message: "Loading…").body
    }
}
