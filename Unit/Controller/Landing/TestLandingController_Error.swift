import XCTest
@testable import catban

class TestLandingController_Error:XCTestCase {
    private var controller:LandingController<Landing>!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<Landing>()
        self.navigation = MockNavigationController()
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
    }
    
    func testShowsErrorController() {
        self.startExpectation()
        self.controller.model = Landing()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let controllerError:ErrorController? = controller as? ErrorController
            XCTAssertNotNil(controllerError, "Invalid controller presented")
            self?.expect?.fulfill()
        }
        
        self.controller.alertError(error:ErrorProject.oneColumnMinimum)
        
        self.waitExpectations()
    }
    
    func testUpdateErrorMessage() {
        self.startExpectation()
        self.controller.model = Landing()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            let controller:ErrorController = controller as! ErrorController
            XCTAssertEqual(controller.model.message,
                           ErrorProject.oneColumnMinimum.localizedDescription,
                           "Message not updated")
            self?.expect?.fulfill()
        }
        
        self.controller.alertError(error:ErrorProject.oneColumnMinimum)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
