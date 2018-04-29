import XCTest
@testable import catban

class TestDeserialiserHistoryItemCreatedCard:XCTestCase {
    private var model:DeserialiserHistoryItemCreatedCard!
    
    override func setUp() {
        super.setUp()
        self.model = DeserialiserHistoryItemCreatedCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
