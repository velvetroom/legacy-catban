import XCTest
@testable import catban

class TestApplicationNavigationController_Transitions:XCTestCase {
    private var controller:ApplicationNavigationController!
    
    override func setUp() {
        super.setUp()
        self.controller = ApplicationNavigationController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
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
    
    func testOrganiseHasOneController() {
        self.controller.transitionToOrganiseWith(board:Board())
        XCTAssertEqual(self.controller.viewControllers.count, 1, "Invalid number of controllers after transiton")
    }
    
    func testOrganiseControllerType() {
        self.controller.transitionToOrganiseWith(board:Board())
        let controller:OrganiseController<Organise>? = self.controller.viewControllers.first as?
            OrganiseController<Organise>
        XCTAssertNotNil(controller, "Invalid controller type")
    }
    
    func testStatsHasOneController() {
        self.controller.transitionToStatsWith(board:Board())
        XCTAssertEqual(self.controller.viewControllers.count, 1, "Invalid number of controllers after transiton")
    }
    
    func testStatsControllerType() {
        self.controller.transitionToStatsWith(board:Board())
        let controller:StatsController<Stats>? = self.controller.viewControllers.first as?
            StatsController<Stats>
        XCTAssertNotNil(controller, "Invalid controller type")
    }
}
