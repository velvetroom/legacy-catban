import XCTest
@testable import Home

class TestController:XCTestCase {
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        self.controller = Controller()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.presenter.controller, "Failed to assign controller to presenter")
    }
}
