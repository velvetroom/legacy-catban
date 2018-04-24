import XCTest
@testable import catban

class TestStatsController:XCTestCase {
    private var controller:StatsController<MockStatsProtocol>!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private var outlets:StatsPresenterOutlets {
        get {
            return self.controller.model.presenter.outlets
        }
    }
    
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = StatsController<MockStatsProtocol>()
        self.navigation = MockNavigationController()
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertNotNil(self.outlets.collection, "Failed to load collection")
        XCTAssertNotNil(self.outlets.collection?.dataSource, "Failed to assign data source")
        XCTAssertNotNil(self.outlets.collection?.delegate, "Failed to assign delegate")
        XCTAssertFalse(self.controller.title!.isEmpty, "Failed to assign controller title")
    }
    
    func testSelectorStats() {
        self.startExpectation()
        self.navigation.onSetControllers = { [weak self] (controllers:[UIViewController]) in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorDone(sender:UIBarButtonItem())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
