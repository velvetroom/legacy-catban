import XCTest
@testable import catban

class TestApplicationNavigationController:XCTestCase {
    private var controller:ApplicationNavigationController!
    
    override func setUp() {
        super.setUp()
        self.controller = ApplicationNavigationController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testLandingHasOneController() {
        XCTAssertEqual(self.controller.viewControllers.count, 1, "Invalid number of controllers")
    }
    
    func testFirstControllerIsLoad() {
        let controller:LoadController<Load>? = self.controller.viewControllers.first as?
            LoadController<Load>
        XCTAssertNotNil(controller, "Invalid controller type")
    }
}
