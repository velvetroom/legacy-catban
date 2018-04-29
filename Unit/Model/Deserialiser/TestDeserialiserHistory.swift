import XCTest
@testable import catban

class TestDeserialiserHistory:XCTestCase {
    private var model:DeserialiserHistory!
    
    override func setUp() {
        super.setUp()
        self.model = DeserialiserHistory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
