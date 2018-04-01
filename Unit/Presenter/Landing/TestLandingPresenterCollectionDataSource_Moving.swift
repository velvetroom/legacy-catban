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
        static let startingIndex:Int = 45
        static let endingIndex:Int = 33
        static let sectionIndex:Int = 98
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
        self.delegate.onReorderItem = { [weak self] (index:Int, destination:Int, section:Int) in
            XCTAssertEqual(index, Constants.startingIndex, "Incorrect starting index")
            XCTAssertEqual(destination, Constants.endingIndex, "Incorrect ending index")
            XCTAssertEqual(section, Constants.sectionIndex, "Incorrect section index")
            self?.expect?.fulfill()
        }
        self.collection.onReloadDataCalled = {
            XCTAssertTrue(false, "Collection should not be reloaded")
        }
        
        let startingIndex:IndexPath = IndexPath(item:Constants.startingIndex, section:Constants.sectionIndex)
        let endingIndex:IndexPath = IndexPath(item:Constants.endingIndex, section:Constants.sectionIndex)
        self.presenter.collectionView(self.collection, moveItemAt:startingIndex, to:endingIndex)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
