import XCTest
@testable import catban

class TestController:XCTestCase {
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
}