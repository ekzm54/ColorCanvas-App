public protocol PreferencesRepository {
    func bool(forKey key: String, default defaultValue: Bool) -> Bool
    func setBool(_ value: Bool, forKey key: String)
}
