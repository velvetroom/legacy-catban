import XCTest
@testable import catban

class TestLandingPresenter_ApplyUpdates:XCTestCase {
    private var presenter:LandingPresenter!
    private var view:MockLandingViewCollection!
    private var update:MockCollectionUpdateProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenter()
        self.view = MockLandingViewCollection()
        self.update = MockCollectionUpdateProtocol()
        self.presenter.outlets.list.viewCollection = self.view
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.update, "Failed to load update")
    }
    
    func testApplyUpdatesOnPerformBatchUpdates() {
        self.startExpectation()
        self.view.onPerformBatchUpdates = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.apply(updates:[self.update])
        
        self.waitExpectations()
    }
    
    func testApplyUpdatesCallsStrategy() {
        self.startExpectation()
        self.update.onStrategyCollection = { [weak self] (view:UICollectionView) in
            XCTAssertEqual(view, self?.view, "Invalid view received")
            self?.expect?.fulfill()
        }
        
        self.presenter.apply(updates:[self.update])
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
