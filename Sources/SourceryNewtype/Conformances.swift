//
//  File.swift
//
//
//  Created by Fabian Mücke on 13.05.24.
//

import Foundation

extension Newtype where Value: RawRepresentable {
    public typealias RawValue = Value.RawValue
}

extension Newtype where Value: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.value == rhs.value
    }
}

extension Newtype where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

extension Newtype where Value: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.value < rhs.value
    }
}

extension Newtype where Value: Decodable {
    public init(from decoder: Decoder) throws {
        self = try Self(Value(from: decoder))
    }
}

extension Newtype where Value: Encodable {
    public func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}

extension Newtype where Value: Identifiable {
    public typealias ID = Value.ID

    public var id: ID { value.id }
}

extension Newtype where Value: ExpressibleByBooleanLiteral {
    public typealias BooleanLiteralType = Value.BooleanLiteralType

    public init(booleanLiteral value: Value.BooleanLiteralType) {
        self.init(Value(booleanLiteral: value))
    }
}

extension Newtype where Value: ExpressibleByFloatLiteral {
    public typealias FloatLiteralType = Value.FloatLiteralType

    public init(floatLiteral: FloatLiteralType) {
        self.init(Value(floatLiteral: floatLiteral))
    }
}

extension Newtype where Value: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Value.IntegerLiteralType

    public init(integerLiteral: IntegerLiteralType) {
        self.init(Value(integerLiteral: integerLiteral))
    }
}

extension Newtype where Value: ExpressibleByStringLiteral {
    public typealias StringLiteralType = Value.StringLiteralType

    public init(stringLiteral: StringLiteralType) {
        self.init(Value(stringLiteral: stringLiteral))
    }
}

extension Newtype where Value: ExpressibleByStringInterpolation {
    public typealias StringInterpolation = Value.StringInterpolation

    public init(stringInterpolation: Self.StringInterpolation) {
        self.init(Value(stringInterpolation: stringInterpolation))
    }
}

extension Newtype where Value: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self = .init(Value(nilLiteral: ()))
    }
}
