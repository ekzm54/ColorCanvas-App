public struct Identifier<Tag>: Hashable, Codable, RawRepresentable {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public enum ProjectTag {}
public typealias ProjectID = Identifier<ProjectTag>

public enum TemplateTag {}
public typealias TemplateID = Identifier<TemplateTag>

public enum CategoryTag {}
public typealias CategoryID = Identifier<CategoryTag>

public enum ExportTag {}
public typealias ExportID = Identifier<ExportTag>
