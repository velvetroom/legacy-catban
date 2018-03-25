import XCTest
@testable import catban

class TestLandingController_Collection:XCTestCase {
    private var controller:LandingController!
    private var viewCollection:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.controller.projectLoader = MockProjectLoader()
        self.controller.viewModelLoader = MockLandingViewModelLoader()
        self.viewCollection = MockLandingViewCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.viewCollection, "Failed to load view collection")
    }
    
    func testCollectionReloadDataAfterViewDidLoad() {
        self.startExpectation()
        self.viewCollection.onReloadDataCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view)
        self.controller.outlets.viewCollection = self.viewCollection
        
        self.waitExpectations()
    }
    
    func testCollectionReloadDataAfterUpdateViewModel() {
        self.startExpectation()
        XCTAssertNotNil(self.controller.view)
        self.controller.outlets.viewCollection = self.viewCollection
        self.viewCollection.onReloadDataCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.updateViewModel()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
