import XCTest
@testable import catban

class TestStatsPresenterCollectionDelegate:XCTestCase {
    private var presenter:StatsPresenterCollectionDelegate!
    private var view:MockStatsViewCollection!
    private struct Constants {
        static let frame:CGRect = CGRect(x:0, y:0, width:100, height:100)
        static let indexPath:IndexPath = IndexPath(item:0, section:0)
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = StatsPresenterCollectionDelegate()
        self.view = MockStatsViewCollection()
        self.view.frame = Constants.frame
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testAvoidSelect() {
        XCTAssertFalse(self.presenter.collectionView(
            self.view, shouldSelectItemAt:Constants.indexPath), "Presenter should avoid select")
    }
    
    func testAvoidHighlight() {
        XCTAssertFalse(self.presenter.collectionView(
            self.view, shouldHighlightItemAt:Constants.indexPath), "Presenter should avoid highlight")
    }
    
    func testSizeWidthForItem() {
        let size:CGSize = self.presenter.collectionView(
            self.view, layout:self.view.collectionViewLayout, sizeForItemAt:Constants.indexPath)
        XCTAssertEqual(size.width, Constants.frame.width, "Invalid width for item")
    }
    
    func testSizeHeightForItem() {
        let size:CGSize = self.presenter.collectionView(
            self.view, layout:self.view.collectionViewLayout, sizeForItemAt:Constants.indexPath)
        XCTAssertEqual(size.height, Constants.frame.height, "Invalid height for item")
    }
}
