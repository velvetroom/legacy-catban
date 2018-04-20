import XCTest
@testable import catban

class TestApplicationNavigationController_Transitions:XCTestCase {
    private var controller:ApplicationNavigationController!
    
    override func setUp() {
        super.setUp()
        self.controller = ApplicationNavigationController()
    }
    
    func testLandingHasOneController() {
        self.controller.transitionToLandingWith(board:Board())
        XCTAssertEqual(self.controller.viewControllers.count, 1, "Invalid number of controllers after transiton")
    }
    
    func testLandingControllerType() {
        self.controller.transitionToLandingWith(board:Board())
        let controller:LandingController<Landing>? = self.controller.viewControllers.first as?
            LandingController<Landing>
        XCTAssertNotNil(controller, "Invalid controller type")
    }
}
