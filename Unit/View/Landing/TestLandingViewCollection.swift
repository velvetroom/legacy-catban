import XCTest
@testable import catban

class TestLandingViewCollection:XCTestCase {
    private var view:LandingViewCollection!
    private var dataSource:MockLandingPresenterCollectionDataSource!
    private var delegate:MockCollectionViewDelegate?
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.view = LandingViewCollection()
        self.dataSource = MockLandingPresenterCollectionDataSource()
        self.delegate = MockCollectionViewDelegate()
        self.view.dataSource = self.dataSource
        self.view.delegate = self.delegate
        self.configureViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.dataSource, "Failed to load data source")
        XCTAssertNotNil(self.view.delegate, "Failed to load delegate")
    }
    
    func testCallDeselectItemWhenBeginInteraction() {
        self.startExpectation()
        self.delegate?.onDidDeselectItem = {
            self.expect?.fulfill()
        }
        
        let _:Bool = self.view.beginInteractiveMovementForItem(at:IndexPath(item:0, section:0))
        
        self.waitExpectations()
    }
    
    func testClearSelectionOnBeginInteraction() {
        let index:IndexPath = IndexPath(item:0, section:0)
        self.view.selectItem(at:index, animated:false, scrollPosition:UICollectionViewScrollPosition())
        let initialSelectedItems:[IndexPath]? = self.view.indexPathsForSelectedItems
        XCTAssertNotNil(initialSelectedItems, "Failed to select initial item")
        XCTAssertFalse(initialSelectedItems!.isEmpty, "Failed to select item")
        
        let _:Bool = self.view.beginInteractiveMovementForItem(at:IndexPath(item:0, section:0))
        
        guard
            let selectedItems:[IndexPath] = self.view.indexPathsForSelectedItems
        else {
            return
        }
        
        XCTAssertTrue(selectedItems.isEmpty, "Failed to clear selection")
    }
    
    func testClearSelection() {
        let index:IndexPath = IndexPath(item:0, section:0)
        self.view.selectItem(at:index, animated:false, scrollPosition:UICollectionViewScrollPosition())
        self.view.clearSelection()
        XCTAssertTrue(self.view.indexPathsForSelectedItems!.isEmpty, "Failed to clear selection")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectations")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
    
    private func configureViewModel() {
        let item:LandingViewModelCollectionItem = LandingViewModelCollectionItem()
        var section:LandingViewModelCollectionSection = LandingViewModelCollectionSection()
        section.items.append(item)
        var viewModel:LandingViewModelCollection = LandingViewModelCollection()
        viewModel.sections.append(section)
        self.dataSource.viewModel = viewModel
    }
}
