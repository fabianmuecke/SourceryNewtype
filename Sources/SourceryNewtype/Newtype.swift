// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A protocol to declare a type as a Newtype wrapper.
///
/// Declare this on a type to profit from the default implementations or configure the provided
/// [Sourcery](https://github.com/krzysztofzablocki/Sourcery) for generated protocol conformances.
///
/// When not using Sourcery, just add the protocols you want to conform to. The default implementations will work, if the ``Value`` conforms
/// to the protocol.
///
/// - Note: For available default implementations see [Conformances.swift](./Conformances.swift).
public protocol Newtype {
    /// The wrapped type.
    associatedtype Value

    /// The wrapped value.
    var value: Value { get }

    /// Wraps `value` in a new ``Newtype``.
    init(_ value: Value)
}

extension Newtype {
    public subscript<T>(dynamicMember keyPath: KeyPath<Value, T>) -> T {
        value[keyPath: keyPath]
    }
}

extension Newtype {
    public var description: String {
        String(describing: value)
    }
}

extension Newtype {
    /// Wraps the given `value` in a ``Newtype``.
    /// 
    /// Returns `nil`, if `value` is `nil`.
    public init?(optional value: Value?) {
        guard let value else {
            return nil
        }
        self = .init(value)
    }
}
