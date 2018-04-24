import XCTest
@testable import catban

class TestLandingController_Selectors:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<MockLandingProtocol>()
        self.navigation = MockNavigationController()
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testSelectorCloseEditingCard() {
        self.startExpectation()
        self.controller.model.onClearCardSelection = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorCloseEditingCard(sender:UIButton())
        
        self.waitExpectations()
    }
    
    func testSelectorOrganise() {
        self.startExpectation()
        self.navigation.onSetControllers = { [weak self] (controllers:[UIViewController]) in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorOrganise(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    func testSelectorStats() {
        self.startExpectation()
        self.navigation.onSetControllers = { [weak self] (controllers:[UIViewController]) in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorStats(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
