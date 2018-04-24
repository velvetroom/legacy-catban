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
}
