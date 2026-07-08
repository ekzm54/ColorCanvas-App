import ColorCanvasDomain

public enum Route: Hashable, Identifiable {
    case home
    case gallery(categoryID: CategoryID?)
    case projects
    case settings
    case studio(projectID: ProjectID)
    case export(projectID: ProjectID)

    public var id: Self { self }
}
