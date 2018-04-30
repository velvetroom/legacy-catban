import XCTest
@testable import catban

class TestHistoryItemMoveCard:XCTestCase {
    private var date:Date!
    private var model:HistoryItemMoveCard!
    
    override func setUp() {
        super.setUp()
        self.date = Date()
        self.model = HistoryItemMoveCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.date, "Failed to load date")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.cardIdentifier, "Failed to load card identifier")
        XCTAssertNotNil(self.model.columnIdentifier, "Failed to load column identifier")
    }
    
    func testDate() {
        let timestamp:Int = Int(self.date.timeIntervalSince1970)
        XCTAssertGreaterThanOrEqual(self.model.created, timestamp, "Invalid created")
    }
}
