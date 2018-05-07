import XCTest
@testable import Board

class TestColumnFactory:XCTestCase {
    func testNewColumnIdentifier() {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        XCTAssertFalse(column.identifier.isEmpty, "Failed to assign identifier")
    }
    
    func testNewColumnCreated() {
        let timestamp:Int = Date.timestamp
        let column:ColumnProtocol = ColumnFactory.newColumn()
        XCTAssertGreaterThanOrEqual(column.created, timestamp, "Failed to assign created")
    }
}
