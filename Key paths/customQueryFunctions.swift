/// Creating custom query functions using key paths

/// Negated boolean key paths

prefix func !<T>(keyPath: KeyPath<T, Bool>) -> (T) -> Bool {
    return { !$0[keyPath: keyPath] }
}

/// пример: let unreadArticles = articles.filter(!\.isRead)

/// Key path-based comparisons

func ==<T, V: Equatable>(lhs: KeyPath<T, V>, rhs: V) -> (T) -> Bool {
    return { $0[keyPath: lhs] == rhs }
}

/// пример: let fullLengthArticles = articles.filter(\.category == .fullLength)