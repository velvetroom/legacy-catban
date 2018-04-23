import XCTest
@testable import catban

class TestOrganisePresenterCollectionDelegate:XCTestCase {
    private var presenter:OrganisePresenterCollectionDelegate!
    private var view:MockOrganiseViewCollection!
    private var index:IndexPath!
    private struct Constants {
        static let frame:CGRect = CGRect(x:0, y:0, width:100, height:100)
        static let indexPath:IndexPath = IndexPath(item:131, section:1312)
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenterCollectionDelegate()
        self.view = MockOrganiseViewCollection()
        self.index = IndexPath(item:0, section:0)
        self.view.frame = Constants.frame
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testSizeForItem() {
        let size:CGSize = self.presenter.collectionView(
            self.view, layout:self.view.collectionViewLayout, sizeForItemAt:self.index)
        XCTAssertEqual(size.width, Constants.frame.width, "Invalid with for cell")
        XCTAssertEqual(size.height, OrganisePresenterCollectionDelegate.Constants.cellHeight,
                       "Invalid height for cell")
    }
    
    func testDidSelectItem() {
        self.presenter.collectionView(self.view, didSelectItemAt:Constants.indexPath)
    }
}
