// This extension will let us group any Sequence (such as an
// Array or a Set), based on a given key path.
extension Sequence {
    func grouped<T: Hashable>(by keyPath: KeyPath<Element, T>) -> [T: [Element]] {
        // Using key path subscripting syntax, we can dynamically
        // access a member of a type based on a key path.
        return .init(grouping: self, by: { $0[keyPath: keyPath] })
    }
}

func scan(_ string: String, using matchers: [Matcher]) {
    // The result is that our call sites become really clean, since
    // we can simply use a key path literal to group any sequence.
    let matchersByPattern = (
        start: matchers.grouped(by: \.pattern.start),
        end: matchers.grouped(by: \.pattern.end)
    )

    ...
}