import XCTest
@testable import Shared

class TestController:XCTestCase {
    private var controller:ControllerProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = MockControllerProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.presenter, "Failed to load presenter")
    }
}
