import XCTest
@testable import catban

class TestDeserialiserHistoryItemCreateCard:XCTestCase {
    private var model:DeserialiserHistoryItemCreateCard!
    
    override func setUp() {
        super.setUp()
        self.model = DeserialiserHistoryItemCreateCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
