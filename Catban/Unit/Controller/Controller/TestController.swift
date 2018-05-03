import XCTest
@testable import catban

class TestController:XCTestCase {
    private var controller:Controller<MockModelProtocol>!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller<MockModelProtocol>()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
}
