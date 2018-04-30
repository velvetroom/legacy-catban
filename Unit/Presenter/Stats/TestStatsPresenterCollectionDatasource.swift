import XCTest
@testable import catban

class TestStatsPresenterCollectionDatasource:XCTestCase {
    private var presenter:StatsPresenterCollectionDatasource!
    private var view:MockStatsViewCollection!
    private var inView:MockStatsView!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let indexPath:IndexPath = IndexPath(item:1, section:0)
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.presenter = StatsPresenterCollectionDatasource()
        self.view = MockStatsViewCollection()
        self.inView = MockStatsView()
        self.view.cell.view = self.inView
        self.presenter.viewModel.items = [
            MockStatsView(),
            MockStatsView()]
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
    
    func testConfigureCell() {
        self.startExpectation()
        self.view.cell.onUpdateWithView = { [weak self] (view:UIView) in
            self?.expect?.fulfill()
        }
        
        let _:UICollectionViewCell = self.presenter.collectionView(
            self.view, cellForItemAt:Constants.indexPath)

        self.waitExpectations()
    }
    
    func testRemoveOldView() {
        self.startExpectation()
        self.inView.onRemoveFromSuperview = { [weak self] in
            self?.expect?.fulfill()
        }
        
        let _:UICollectionViewCell = self.presenter.collectionView(
            self.view, cellForItemAt:Constants.indexPath)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
