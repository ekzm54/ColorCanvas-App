import SwiftUI

public struct BootstrapRootView: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 12) {
            Text("ColorCanvas")
                .font(.largeTitle)
            Text("Sprint 000 — Bootstrap")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}
