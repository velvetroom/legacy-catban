import XCTest
@testable import catban

class TestLandingPresenter:XCTestCase {
    private var presenter:LandingPresenter!
    private var outlets:MockLandingPresenterOutlets!
    private var collection:MockLandingPresenterCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenter()
        self.outlets = MockLandingPresenterOutlets()
        self.collection = MockLandingPresenterCollection()
        self.presenter.outlets = self.outlets
        self.presenter.collection = self.collection
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.collection, "Failed to load collection")
        XCTAssertNotNil(self.presenter.collectionMenuAnimation, "Failed to load collection menu animation")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load presenter")
    }
    
    func testUpdateViewModelOnOutlets() {
        self.startExpectation()
        self.outlets.onUpdateViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.update(viewModel:LandingViewModel())
        
        self.waitExpectations()
    }
    
    func testUpdateViewModelOnCollection() {
        self.startExpectation()
        self.collection.onUpdateViewModel = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.update(viewModel:LandingViewModel())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
