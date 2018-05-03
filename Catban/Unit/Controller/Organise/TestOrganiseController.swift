import XCTest
@testable import catban

class TestOrganiseController:XCTestCase {
    private var controller:OrganiseController<MockOrganiseProtocol>!
    private var navigation:MockNavigationController!
    private var expect:XCTestExpectation?
    private var outlets:OrganisePresenterOutlets {
        get {
            return self.controller.model.presenter.outlets
        }
    }
    
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let indexPath:IndexPath = IndexPath(item:313, section:2452)
    }
    
    override func setUp() {
        super.setUp()
        self.controller = OrganiseController<MockOrganiseProtocol>()
        self.navigation = MockNavigationController()
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertNotNil(self.outlets.collection, "Failed to load collection")
        XCTAssertNotNil(self.outlets.collection?.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.outlets.collection?.dataSource, "Failed to assign datasource")
        XCTAssertNotNil(self.controller.model.presenter.collection.delegate.delegate, "Failed to assign delegate")
        XCTAssertFalse(self.controller.title!.isEmpty, "Failed to assign controller title")
    }
    
    func testReloadViewModelOnViewDidLoad() {
        self.startExpectation()
        self.controller.model.onReloadViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Unable to load view")
        
        self.waitExpectations()
    }
    
    func testDelegateSelectCellAt() {
        self.startExpectation()
        self.controller.model.onSelectProjectAtIndex = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.indexPath.item, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.controller.delegateSelectCellAt(index:Constants.indexPath)
        
        self.waitExpectations()
    }
    
    func testDelegateSelectCellAtTransitionsToLanding() {
        self.startExpectation()
        self.navigation.onSetControllers = { [weak self] (controllers:[UIViewController]) in
            let controller:LandingController<Landing> = controllers.first as! LandingController<Landing>
            XCTAssertNotNil(controller, "Invalid controller for transition")
            XCTAssertEqual(controllers.count, 1, "Invalid transition")
            self?.expect?.fulfill()
        }
        
        self.controller.delegateSelectCellAt(index:Constants.indexPath)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
