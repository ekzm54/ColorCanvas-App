import ColorCanvasDomain
import Foundation

public protocol DeepLinking {
    func route(for url: URL) -> Route?
}

public struct DeepLinkRouter: DeepLinking {
    public init() {}

    public func route(for url: URL) -> Route? {
        guard let host = url.host else { return nil }

        switch host {
        case "home":
            return .home
        case "gallery":
            return .gallery(categoryID: queryValue(named: "category", in: url).map(CategoryID.init(rawValue:)))
        case "projects":
            return .projects
        case "settings":
            return .settings
        case "studio":
            return firstPathComponent(of: url).map { .studio(projectID: ProjectID(rawValue: $0)) }
        case "export":
            return firstPathComponent(of: url).map { .export(projectID: ProjectID(rawValue: $0)) }
        default:
            return nil
        }
    }

    private func firstPathComponent(of url: URL) -> String? {
        url.pathComponents.first(where: { $0 != "/" })
    }

    private func queryValue(named name: String, in url: URL) -> String? {
        URLComponents(url: url, resolvingAgainstBaseURL: false)?
            .queryItems?
            .first(where: { $0.name == name })?
            .value
    }
}
