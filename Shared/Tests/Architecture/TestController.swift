import XCTest
@testable import Shared

class TestController:XCTestCase {
    private var controller:MockControllerProtocol!
    
    override func setUp() {
        super.setUp()
        self.controller = MockControllerProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.controller.presenter, "Failed to load presenter")
        XCTAssertNil(self.controller.transiton, "Transition should not be set")
    }
}
