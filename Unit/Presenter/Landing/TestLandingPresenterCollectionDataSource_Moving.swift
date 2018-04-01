import XCTest
@testable import catban

class TestLandingPresenterCollectionDataSource_Moving:XCTestCase {
    private var presenter:LandingPresenterCollectionDataSource!
    private var viewModel:LandingViewModelCollection!
    private var delegate:MockLandingPresenterCollectionDataSourceProtocol!
    private var collection:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let origin:IndexPath = IndexPath(item:445, section:66454)
        static let destination:IndexPath = IndexPath(item:7231, section:8345)
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionDataSource()
        self.viewModel = LandingViewModelCollection()
        self.collection = MockLandingViewCollection()
        self.delegate = MockLandingPresenterCollectionDataSourceProtocol()
        self.presenter.viewModel = self.viewModel
        self.presenter.delegate = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.collection, "Failed to load collection")
    }
    
    func testMoveItem() {
        self.startExpectation()
        self.delegate.onMoveItem = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Incorrect origin")
            XCTAssertEqual(destination, Constants.destination, "Incorrect destination")
            self?.expect?.fulfill()
        }
        self.collection.onReloadDataCalled = {
            XCTAssertTrue(false, "Collection should not be reloaded")
        }
        
        self.presenter.collectionView(self.collection, moveItemAt:Constants.origin, to:Constants.destination)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
