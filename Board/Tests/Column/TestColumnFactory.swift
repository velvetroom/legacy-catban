import XCTest
@testable import Board

class TestColumnFactory:XCTestCase {
    private struct Constants {
        static let cardsInBacklog:Int = 2
    }
    
    func testNewColumnIdentifier() {
        let column:ColumnProtocol = ColumnFactory.newColumn()
        XCTAssertFalse(column.identifier.isEmpty, "Failed to assign identifier")
    }
    
    func testNewColumnCreated() {
        let timestamp:Int = Date.timestamp
        let column:ColumnProtocol = ColumnFactory.newColumn()
        XCTAssertGreaterThanOrEqual(column.created, timestamp, "Failed to assign created")
    }
    
    func testBlankColumnNoIdentifier() {
        let column:ColumnProtocol = ColumnFactory.blankColumn()
        XCTAssertTrue(column.identifier.isEmpty, "Column should have no identifier")
    }
    
    func testBlankColumnNoCreated() {
        let column:ColumnProtocol = ColumnFactory.blankColumn()
        XCTAssertEqual(column.created, 0, "Column should have no created")
    }
    
    func testBlankColumnNoCards() {
        let column:ColumnProtocol = ColumnFactory.blankColumn()
        XCTAssertEqual(column.countCards, 0, "Column should have no cards")
    }
}
