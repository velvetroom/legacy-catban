import XCTest
@testable import catban

class TestLandingController_SelectorsAdd:XCTestCase {
    private var controller:LandingController!
    private var navigation:MockNavigationController!
    private var model:MockLandingProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.navigation = MockNavigationController()
        self.model = MockLandingProtocol()
        self.controller.model = self.model
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testSelectorAdd() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:LandingControllerAdd = controller as? LandingControllerAdd
            else {
                 return
            }
            let model:MockLandingProtocol? = controller.model as? MockLandingProtocol
            XCTAssertNotNil(model, "Failed to assign model to controller")
            self?.expect?.fulfill()
        }
        
        self.controller.selectorAdd(sender:UIButton())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
