import Combine

public final class AppRouter: ObservableObject {
    @Published public var path: [Route] = []
    @Published public var presentedModal: Route?

    public init() {}

    public func push(_ route: Route) {
        path.append(route)
    }

    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    public func popToRoot() {
        path.removeAll()
    }

    public func presentModal(_ route: Route) {
        presentedModal = route
    }

    public func dismissModal() {
        presentedModal = nil
    }
}
