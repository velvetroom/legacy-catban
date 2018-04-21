import XCTest
@testable import catban

class TestOrganiseController:XCTestCase {
    private var controller:OrganiseController<MockOrganiseProtocol>!
    private var model:MockOrganiseProtocol!
    private var expect:XCTestExpectation?
    private var outlets:OrganisePresenterOutlets {
        get {
            return self.controller.model.presenter.outlets
        }
    }
    
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = OrganiseController<MockOrganiseProtocol>()
        self.model = MockOrganiseProtocol()
        self.controller.model = self.model
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertNotNil(self.outlets.collection, "Failed to load collection")
        XCTAssertNotNil(self.outlets.collection?.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.outlets.collection?.dataSource, "Failed to assign datasource")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testReloadViewModelOnViewDidLoad() {
        self.startExpectation()
        self.model.onReloadViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Unable to load view")
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
