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
        self.viewCollection = MockLandingViewCollection()
        self.controller.model.presenter.outlets.list.viewCollection = self.viewCollection
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.viewCollection, "Failed to load view collection")
    }
    
    func testCollectionReloadData() {
        self.startExpectation()
        var viewModel:LandingViewModel = LandingViewModel()
        viewModel.outlets.reloadCollection = true
        self.viewCollection.onReloadDataCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.model.presenter.update(viewModel:viewModel)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
