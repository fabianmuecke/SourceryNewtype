// Generated using Sourcery 2.2.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all
// MARK: - StringNewtype imports
import SourceryNewtype
import XCTest

extension StringNewtype {
    internal init(_ value: Value) {
        self.value = value
    }
}
extension StringNewtype: @unchecked Sendable {}
extension StringNewtype: Comparable {}

// swiftlint:enable all
