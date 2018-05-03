import XCTest
@testable import catban

class TestLandingPresenterCollectionDataSource_Delegate:XCTestCase {
    private var presenter:LandingPresenterCollectionDataSource!
    private var delegate:MockLandingPresenterCollectionDataSourceProtocol!
    private var collectionView:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let origin:IndexPath = IndexPath(item:445, section:66454)
        static let destination:IndexPath = IndexPath(item:7231, section:8345)
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionDataSource()
        self.delegate = MockLandingPresenterCollectionDataSourceProtocol()
        self.collectionView = MockLandingViewCollection()
        self.presenter.delegate = self.delegate
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
    }
    
    func testMoveItem() {
        self.startExpectation()
        self.delegate.onMoveItem = { [weak self] (origin:IndexPath, destination:IndexPath) in
            XCTAssertEqual(origin, Constants.origin, "Invalid original")
            XCTAssertEqual(destination, Constants.destination, "Invalid destination")
            self?.expect?.fulfill()
        }
        
        self.presenter.collectionView(self.collectionView, moveItemAt:Constants.origin, to:Constants.destination)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
