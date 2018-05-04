import XCTest
@testable import Shared

class TestString_Bundle:XCTestCase {
    func testLoadString() {
        let string:String? = String.localized(key:String(), in:type(of:self))
        XCTAssertNotNil(string, "Failed to return any string")
    }
}
