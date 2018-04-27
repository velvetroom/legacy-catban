import XCTest
@testable import catban

class TestHistory:XCTestCase {
    private var model:History!
    
    override func setUp() {
        super.setUp()
        self.model = History()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.items, "Failed to load items")
    }
}
