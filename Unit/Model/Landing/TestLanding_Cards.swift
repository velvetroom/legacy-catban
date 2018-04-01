import XCTest
@testable import catban

class TestLanding_Cards:XCTestCase {
    private var model:Landing!
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
