import XCTest
@testable import catban

class TestLandingController_DeleteProject:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var navigation:MockNavigationController!
    private var error:ErrorProject!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.navigation = MockNavigationController()
        self.error = ErrorProject.oneProjectMinimum
        self.controller.model.throwingError = self.error
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.error, "Failed to load error")
    }
    
    func testCallsModelDeleteProject() {
        self.startExpectation()
        self.controller.model.onDeleteProject = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.confirmedDeleteProject()
        
        self.waitExpectations()
    }
    
    func testShowsAlertOnThrow() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let controller:ErrorController = controller as! ErrorController
            XCTAssertNotNil(controller, "Invalid controller presenter")
            self?.expect?.fulfill()
        }
        
        self.controller.confirmedDeleteProject()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
