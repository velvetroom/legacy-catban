import XCTest
@testable import catban

class TestLandingPresenterOutlets:XCTestCase {
    private var presenter:LandingPresenterOutlets!
    private var collection:MockLandingViewCollection!
    private var layoutCollectionMenuBottom:NSLayoutConstraint!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let updateMenuBottom:CGFloat = 99
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterOutlets()
        self.collection = MockLandingViewCollection()
        self.layoutCollectionMenuBottom = NSLayoutConstraint()
        self.presenter.list.viewCollection = collection
        self.presenter.list.layoutCollectionMenuBottom = self.layoutCollectionMenuBottom
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.list, "Failed to load list")
        XCTAssertNotNil(self.collection, "Failed to load collection")
        XCTAssertNotNil(self.layoutCollectionMenuBottom, "Failed to load layout bottom")
    }
    
    func testReloadData() {
        self.startExpectation()
        var viewModel:LandingViewModelOutlets = LandingViewModelOutlets()
        viewModel.reloadCollection = true
        self.collection.onReloadDataCalled = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.update(viewModel:viewModel)
        
        self.waitExpectation()
    }
    
    func testShouldNotReloadData() {
        self.startExpectation()
        var viewModel:LandingViewModelOutlets = LandingViewModelOutlets()
        viewModel.reloadCollection = false
        self.collection.onReloadDataCalled = {
            XCTAssertTrue(false, "Should not have called reload data")
        }
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.2) { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.update(viewModel:viewModel)
        
        self.waitExpectation()
    }
    
    func testUpdateMenuBottom() {
        var viewModel:LandingViewModelOutlets = LandingViewModelOutlets()
        viewModel.collectionMenuBottom = Constants.updateMenuBottom
        
        self.presenter.update(viewModel:viewModel)
        
        XCTAssertEqual(self.layoutCollectionMenuBottom.constant, Constants.updateMenuBottom,
                       "Failed to update layout")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
