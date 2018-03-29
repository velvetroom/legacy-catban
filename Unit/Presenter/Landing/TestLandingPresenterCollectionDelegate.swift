import XCTest
@testable import catban

class TestLandingPresenterCollectionDelegate:XCTestCase {
    private var presenter:LandingPresenterCollectionDelegate!
    private var collection:MockLandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionDelegate()
        self.collection = MockLandingViewCollection()
        self.collection.returnNumberOfItemsInSection = 10
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
    
    func testItemShouldNotMoveFromSection() {
        let original:IndexPath = IndexPath(item:0, section:0)
        let proposed:IndexPath = IndexPath(item:5, section:5)
        let expected:IndexPath = IndexPath(item:5, section:0)
        let index:IndexPath = self.presenter.collectionView(self.collection,
                                                            targetIndexPathForMoveFromItemAt:original,
                                                            toProposedIndexPath:proposed)
        XCTAssertEqual(index, expected, "Item should not be allowed to move from section")
    }
    
    func testItemShouldReorderIfPossible() {
        let original:IndexPath = IndexPath(item:3, section:4)
        let proposed:IndexPath = IndexPath(item:0, section:4)
        let expected:IndexPath = IndexPath(item:0, section:4)
        let index:IndexPath = self.presenter.collectionView(self.collection,
                                                            targetIndexPathForMoveFromItemAt:original,
                                                            toProposedIndexPath:proposed)
        XCTAssertEqual(index, expected, "Item should be allowed to reorder")
    }
    
    func testItemShouldNotTryToMoveOutsideSectionBounds() {
        self.collection.returnNumberOfItemsInSection = 2
        let original:IndexPath = IndexPath(item:0, section:0)
        let proposed:IndexPath = IndexPath(item:4, section:0)
        let expected:IndexPath = IndexPath(item:1, section:0)
        let index:IndexPath = self.presenter.collectionView(self.collection,
                                                            targetIndexPathForMoveFromItemAt:original,
                                                            toProposedIndexPath:proposed)
        XCTAssertEqual(index, expected, "Item should not be allowed to move beyond section bounds")
    }
}
