import XCTest
@testable import catban

class TestDeserialiserHistoryItemCreateCard:XCTestCase {
    private var model:DeserialiserHistoryItemCreateCard!
    private struct Constants {
        static let success:[String:Any] = [
            "cardIdentifier": "xfdss131"]
    }
    
    override func setUp() {
        super.setUp()
        self.model = DeserialiserHistoryItemCreateCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    
}
