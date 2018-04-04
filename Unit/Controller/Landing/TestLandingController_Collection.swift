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
        self.controller.model.viewModelLoader = MockLandingViewModelLoader()
        self.viewCollection = MockLandingViewCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.model.viewModelLoader, "Failed to load view model loader")
        XCTAssertNotNil(self.viewCollection, "Failed to load view collection")
    }
    
    func testCollectionReloadDataAfterViewDidLoad() {
        self.startExpectation()
        self.viewCollection.onReloadDataCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        self.controller.model.viewModelLoader = LandingViewModelLoader()
        self.controller.model.presenter.outlets.list.viewCollection = self.viewCollection
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
