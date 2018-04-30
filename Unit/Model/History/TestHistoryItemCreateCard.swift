import XCTest
@testable import catban

class TestHistoryItemCreateCard:XCTestCase {
    private var date:Date!
    private var model:HistoryItemCreateCard!
    
    override func setUp() {
        super.setUp()
        self.date = Date()
        self.model = HistoryItemCreateCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.date, "Failed to load date")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.cardIdentifier, "Failed to load card")
    }
    
    func testDate() {
        let timestamp:Int = Int(self.date.timeIntervalSince1970)
        XCTAssertGreaterThanOrEqual(self.model.created, timestamp, "Invalid created")
    }
}
