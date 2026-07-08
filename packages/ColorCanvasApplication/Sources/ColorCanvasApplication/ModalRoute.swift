import ColorCanvasDomain

public enum ModalRoute: Hashable, Identifiable {
    case templateDetail(templateID: TemplateID)
    case colorPicker
    case brushPanel
    case renameProject(projectID: ProjectID)
    case deleteConfirmation(projectID: ProjectID)
    case shareSheet(exportID: ExportID)

    public var id: Self { self }
}
