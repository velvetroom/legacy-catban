import XCTest
@testable import catban

class TestLandingPresenterCollectionDataSource_Moving:XCTestCase {
    private var presenter:LandingPresenterCollectionDataSource!
    private var viewModel:LandingViewModelCollection!
    private var collection:MockLandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionDataSource()
        self.viewModel = LandingViewModelCollection()
        self.collection = MockLandingViewCollection()
        self.configureViewModel()
        self.presenter.viewModel = self.viewModel
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testMoveItem() {
        let startingIndex:IndexPath = IndexPath(item:1, section:0)
        let endingIndex:IndexPath = IndexPath(item:0, section:0)
        self.presenter.collectionView(self.collection, moveItemAt:startingIndex, to:endingIndex)
    }
    
    private func configureViewModel() {
        
    }
}
