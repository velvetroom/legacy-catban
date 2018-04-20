import XCTest
@testable import catban

class TestLandingController_SelectorsAdd:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var navigation:MockNavigationController!
    private var collection:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<MockLandingProtocol>()
        self.navigation = MockNavigationController()
        self.collection = MockLandingViewCollection()
        self.controller.model.presenter.outlets.list.viewCollection = self.collection
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.collection, "Failed to load collection")
    }
    
    func testSelectorAddShowsController() {
        self.startExpectation()
        self.navigation.onPresent = { [weak self] (controller:UIViewController) in
            guard
                let controller:LandingAddController = controller as? LandingAddController
            else { return }
            XCTAssertNotNil(controller.model.delegate, "Failed to assign delegate to model")
            self?.expect?.fulfill()
        }
        
        self.controller.selectorAdd(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    func testSelectorAddDeselectsCurrentCard() {
        self.startExpectation()
        self.controller.model.onClearCardSelection = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorAdd(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
