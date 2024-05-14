// Foundation.swift
//
// Helps Sourcery know which protocols to conform to by default.

public protocol Equatable {}
public protocol Hashable: Equatable {}
public protocol Comparable {}
public protocol Sendable {}
public protocol Encodable {}
public protocol Decodable {}
public protocol ExpressibleByStringLiteral {}
public protocol ExpressibleByIntegerLiteral {}
public protocol ExpressibleByFloatLiteral {}
public protocol ExpressibleByBooleanLiteral {}
public protocol ExpressibleByNilLiteral {}
public protocol ExpressibleByStringInterpolation {}

public struct UUID: Hashable, Equatable, Sendable {}
public struct String: Hashable, Equatable, Comparable, Encodable, Decodable,
    ExpressibleByStringLiteral, ExpressibleByStringInterpolation, Sendable {}
public struct URL: Equatable, Sendable, Encodable, Decodable, Sendable {}
public struct Date: Comparable, Hashable, Equatable, Encodable, Decodable, Sendable {}
public struct Double: Encodable, Decodable, Hashable, Equatable, Comparable, ExpressibleByFloatLiteral, Sendable {}
public struct Int: Encodable, Decodable, Hashable, Equatable, Comparable, ExpressibleByIntegerLiteral, Sendable,
    Strideable {}
public struct Int32: Encodable, Decodable, Hashable, Equatable, Comparable, ExpressibleByIntegerLiteral, Sendable,
    Strideable {}
public struct Int64: Encodable, Decodable, Hashable, Equatable, Comparable, ExpressibleByIntegerLiteral, Sendable,
    Strideable {}
public struct UInt: Encodable, Decodable, Hashable, Equatable, Comparable, ExpressibleByIntegerLiteral, Sendable,
    Strideable {}
public struct UInt32: Encodable, Decodable, Hashable, Equatable, Comparable, ExpressibleByIntegerLiteral, Sendable,
    Strideable {}
public struct UInt64: Encodable, Decodable, Hashable, Equatable, Comparable, ExpressibleByIntegerLiteral, Sendable,
    Strideable {}
