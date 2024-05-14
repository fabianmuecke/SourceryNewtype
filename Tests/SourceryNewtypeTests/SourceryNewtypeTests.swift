import XCTest
@testable import SourceryNewtype

final class SourceryNewtypeTests: XCTestCase {
    var sut: StringNewtype!

    func testEquatable() {
        sut = "foo"
        XCTAssertEqual(sut, "foo")
        XCTAssertNotEqual(sut, "bar")
    }

    func testHashable() {
        sut = "foo"
        let dictionary = [sut: 1, "bar": 2]
        XCTAssertEqual(dictionary[sut], 1)
        XCTAssertEqual(dictionary["bar"], 2)
        XCTAssertNil(dictionary["baz"])
    }

    func testDecodable() throws {
        let data = "{\"foo\":\"bar\"}".data(using: .utf8)!
        let sut = try JSONDecoder().decode(TestContainer.self, from: data)
        XCTAssertEqual(sut.foo, "bar")
    }

    func testEncodable() throws {
        let sut = TestContainer(foo: "bar")
        let data = try JSONEncoder().encode(sut)
        let jsonString = String(data: data, encoding: .utf8)
        XCTAssertEqual("{\"foo\":\"bar\"}", jsonString)
    }

    func testStringLiteral() {
        sut = "foo"
        XCTAssertEqual(sut, "foo")
    }

    func testInterpolation() {
        sut = "foo\(1)"
        XCTAssertEqual(sut, "foo1")
    }

    func testIntegerLiteral() {
        let sut: IntNewtype = 1
        _ = sut
    }

    func testFloatLiteral() {
        struct DoubleNewtype: Newtype, ExpressibleByFloatLiteral {
            let value: Double

            init(_ value: Double) {
                self.value = value
            }
        }

        let sut: DoubleNewtype = 1.5
        _ = sut
    }
    
    func testDynamicMemberLookup() {
        sut = "foo"
        XCTAssertEqual(sut.count, "foo".count)
    }
}

struct TestContainer: Codable {
    let foo: StringNewtype
}

@dynamicMemberLookup
struct StringNewtype: Newtype, Codable, Hashable, ExpressibleByStringLiteral, ExpressibleByStringInterpolation {
    let value: String
}

public enum IntNewtype: Newtype {
    case intValue(Int)
}
