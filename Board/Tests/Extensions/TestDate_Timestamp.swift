import XCTest
@testable import Board

class TestDate_Timestamp:XCTestCase {
    func testTimetstamp() {
        let timestamp:Int = Int(Date().timeIntervalSince1970)
        XCTAssertGreaterThanOrEqual(Date.timestamp, timestamp, "Failed to create timestamp")
    }
}
