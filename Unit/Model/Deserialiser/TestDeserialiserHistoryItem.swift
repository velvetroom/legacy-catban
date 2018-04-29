import XCTest
@testable import catban

class TestDeserialiserHistoryItem:XCTestCase {
    private var model:MockDeserialiserHistoryItemProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = MockDeserialiserHistoryItemProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
