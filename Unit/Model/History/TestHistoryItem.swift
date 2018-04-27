import XCTest
@testable import catban

class TestHistoryItem:XCTestCase {
    private var date:Date!
    private var model:MockHistoryItemProtocol!
    
    override func setUp() {
        super.setUp()
        self.date = Date()
        self.model = MockHistoryItemProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.date, "Failed to load date")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.created, "Failed to load created")
    }
    
    func testTimestamp() {
        let timestamp:Int = Int(self.date.timeIntervalSince1970)
        XCTAssertGreaterThanOrEqual(self.model.created, timestamp, "Invalid created")
    }
    
    func testFactoryTimestamp() {
        let timestamp:Int = Int(self.date.timeIntervalSince1970)
        let factoryStamp:Int = MockHistoryItemProtocol.currentTimestamp()
        XCTAssertGreaterThanOrEqual(factoryStamp, timestamp, "Failed to factory created")
    }
}
