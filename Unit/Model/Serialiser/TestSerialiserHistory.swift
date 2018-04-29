import XCTest
@testable import catban

class TestSerialiserHistory:XCTestCase {
    private var model:SerialiserHistory!
    
    override func setUp() {
        super.setUp()
        self.model = SerialiserHistory()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
