import XCTest
@testable import catban

class TestStatsPresenterCollectionDatasource:XCTestCase {
    private var presenter:StatsPresenterCollectionDatasource!
    private var view:MockStatsViewCollection!
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:342, section:49857)
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = StatsPresenterCollectionDatasource()
        self.view = MockStatsViewCollection()
        self.presenter.viewModel.items = [
            MockStatsViewModelCollectionItemProtocol(),
            MockStatsViewModelCollectionItemProtocol()]
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testCellForIndexIsTheRightType() {
        let cell:UICollectionViewCell = self.presenter.collectionView(
            self.view, cellForItemAt:Constants.indexPath)
        let cellStats:StatsViewCollectionCell? = cell as? StatsViewCollectionCell
        XCTAssertNotNil(cellStats, "Invalid cell type returned")
    }
    
    func testNumberOfItems() {
        let count:Int = self.presenter.collectionView(self.view, numberOfItemsInSection:0)
        XCTAssertEqual(count, self.presenter.viewModel.items.count,
                       "Invalid number of items returned")
    }
}
