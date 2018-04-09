import XCTest
@testable import catban

class TestLandingPresenter:XCTestCase {
    private var presenter:LandingPresenter!
    private var outlets:MockLandingPresenterOutlets!
    private var collection:MockLandingPresenterCollection!
    private var collectionView:MockLandingViewCollection!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let columnIndex:Int = 453
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenter()
        self.outlets = MockLandingPresenterOutlets()
        self.collection = MockLandingPresenterCollection()
        self.collectionView = MockLandingViewCollection()
        self.presenter.outlets = self.outlets
        self.presenter.collection = self.collection
        self.outlets.list.viewCollection = self.collectionView
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.collection, "Failed to load collection")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load presenter")
        XCTAssertNotNil(self.collectionView, "Failed to load collection view")
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
    
    func testUpdateItemAtIndex() {
        self.startExpectation()
        let indexPath:IndexPath = IndexPath(item:0, section:0)
        self.collectionView.onReloadItemAtIndex = { [weak self] (indexes:[IndexPath]) in
            XCTAssertEqual(indexes.first, indexPath, "Invalid index path received")
            self?.expect?.fulfill()
        }
        
        self.presenter.updateCardAt(index:indexPath)
        self.waitExpectations()
    }
    
    func testInsertItemAtIndex() {
        self.startExpectation()
        let indexPath:IndexPath = IndexPath(item:34234, section:123)
        self.collectionView.onInsertItemAtIndex = { [weak self] (indexes:[IndexPath]) in
            XCTAssertEqual(indexes.first, indexPath, "Invalid index path received")
            self?.expect?.fulfill()
        }
        
        self.presenter.insertCardAt(index:indexPath)
        self.waitExpectations()
    }
    
    func testDeleteItemAtIndex() {
        self.startExpectation()
        let indexPath:IndexPath = IndexPath(item:34234, section:123)
        self.collectionView.onDeleteItemAtIndex = { [weak self] (indexes:[IndexPath]) in
            XCTAssertEqual(indexes.first, indexPath, "Invalid index path received")
            self?.expect?.fulfill()
        }
        
        self.presenter.deleteCardAt(index:indexPath)
        self.waitExpectations()
    }
    
    func testUpdateColumnAtIndex() {
        self.startExpectation()
        self.collectionView.onReloadSectionsAt = { [weak self] (sections:IndexSet) in
            XCTAssertEqual(sections.first, Constants.columnIndex, "Invalid index received")
            self?.expect?.fulfill()
        }
        
        self.presenter.updateColumnAt(index:Constants.columnIndex)
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
