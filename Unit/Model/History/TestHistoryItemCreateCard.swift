import XCTest
@testable import catban

class TestHistoryItemCreateCard:XCTestCase {
    private var model:HistoryItemCreateCard!
    
    override func setUp() {
        super.setUp()
        self.model = HistoryItemCreateCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.card, "Failed to load card")
    }
}
