/// Сортировка массива с помощью операторов в виде функций

enum SortOrder {
    case ascending
    case descending
}

internal extension SortOrder {
    func makeComparator<T: Comparable>() -> (T, T) -> Bool {
        switch self {
        case .ascending:
            // Since Swift operators are implemented as
            // functions, we can both pass them as closures...
            return (<)
        case .descending:
            return (>)
        }
    }
}

internal extension Array {
    mutating func sort<T: Comparable>(by keyPath: KeyPath<Element, T>,
                                      order: SortOrder = .ascending)
    {
        sort { a, b in
            // ...and call them as closures!
            order.makeComparator()(a[keyPath: keyPath],
                                   b[keyPath: keyPath])
        }
    }
}