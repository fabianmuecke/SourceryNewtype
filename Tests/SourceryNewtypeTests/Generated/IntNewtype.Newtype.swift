// Generated using Sourcery 2.2.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all
// MARK: - IntNewtype imports
import SourceryNewtype
import XCTest

public extension IntNewtype { 
    var value: Int {
        switch self {
        case let .intValue(value): value
        }
    }
    init(_ value: Int) {
        self = .intValue(value)
    }
}
extension IntNewtype: @unchecked Sendable {}
extension IntNewtype: Equatable {}
extension IntNewtype: Hashable {}
extension IntNewtype: Comparable {}
extension IntNewtype: Decodable {}
extension IntNewtype: Encodable {}
extension IntNewtype: ExpressibleByIntegerLiteral {}

// swiftlint:enable all
