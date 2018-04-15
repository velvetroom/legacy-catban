import XCTest
@testable import catban

class TestLocal:XCTestCase {
    private var model:Local!
    
    override func setUp() {
        super.setUp()
        self.model = Local()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
