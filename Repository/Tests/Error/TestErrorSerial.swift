import XCTest
@testable import Repository

class TestErrorSerial:XCTestCase {
    func testBoardNotFound() {
        let string:String = ErrorSerial.corruptedData.localizedDescription
        XCTAssertFalse(string.isEmpty, "Failed to load error message")
    }
}
