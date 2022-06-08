@dynamicMemberLookup
class Reference<Value> {
    fileprivate(set) var value: Value

    init(value: Value) {
        self.value = value
    }

    subscript<T>(dynamicMember keyPath: KeyPath<Value, T>) -> T {
        value[keyPath: keyPath]
    }
}

class MutableReference<Value>: Reference<Value> {
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Value, T>) -> T {
        get { value[keyPath: keyPath] }
        set { value[keyPath: keyPath] = newValue }
    }
}