import XCTest
@testable import catban

class TestLandingPresenterCollectionDelegate:XCTestCase {
    private var presenter:LandingPresenterCollectionDelegate!
    private var collection:MockLandingViewCollection!
    private var delegate:MockLandingPresenterCollectionDelegateProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingPresenterCollectionDelegate()
        self.collection = MockLandingViewCollection()
        self.delegate = MockLandingPresenterCollectionDelegateProtocol()
        self.presenter.delegate = self.delegate
        self.collection.returnNumberOfItemsInSection = 10
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.delegate, "Failed to load delegate")
        XCTAssertNotNil(self.collection, "Failed to load collection")
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
    
    func testDelegateCalledOnSelectedCell() {
        let index:IndexPath = IndexPath(item:0, section:0)
        self.startExpectation()
        self.delegate.onSelectCell = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.collectionView(self.collection, didSelectItemAt:index)
        
        self.waitExpectations()
    }
    
    func testDelegateCalledOnDeselectCell() {
        let index:IndexPath = IndexPath(item:0, section:0)
        self.startExpectation()
        self.delegate.onDeselectCell = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.presenter.collectionView(self.collection, didDeselectItemAt:index)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
