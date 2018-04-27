import XCTest
@testable import catban

class TestStatsPresenterFactory:XCTestCase {
    private var factory:StatsPresenterFactory!
    private var items:[StatsItemProtocol]!
    private var board:Board!
    private var expectedItems:[UIView.Type]!
    
    override func setUp() {
        super.setUp()
        self.factory = StatsPresenterFactory()
        self.board = Board()
        self.items = Stats.factoryItems()
        self.expectedItems = [
            StatsViewCompletion.self,
            StatsViewSpeed.self]
    }
    
    func testLoad() {
        XCTAssertNotNil(self.factory, "Failed to load factory")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.items, "Failed to load items")
        XCTAssertFalse(self.items.isEmpty, "Empty items")
    }
    
    func testNumberOfPages() {
        let viewModel:StatsViewModel = self.factory.factoryWith(board:self.board, for:self.items)
        XCTAssertEqual(viewModel.pageControl.numberOFPages, self.items.count,
                       "There should be a page per item")
    }
    
    func testNumberOfCells() {
        let viewModel:StatsViewModel = self.factory.factoryWith(board:self.board, for:self.items)
        XCTAssertEqual(viewModel.collection.items.count, self.items.count,
                       "There should be a cell per item")
    }
    
    func testCollectionItems() {
        let viewModel:StatsViewModel = self.factory.factoryWith(board:self.board, for:self.items)
        XCTAssertFalse(viewModel.collection.items.isEmpty, "Failed to get items")
        XCTAssertEqual(viewModel.collection.items.count, self.expectedItems.count,
                       "Failed to get expected items")
        self.validateItems(items:viewModel.collection.items)
    }
    
    private func validateItems(items:[UIView]) {
        for item:UIView in items {
            let itemType:UIView.Type = type(of:item)
            let count:Int = self.expectedItems.count
            for index:Int in 0 ..< count {
                if itemType == self.expectedItems[index] {
                    self.expectedItems.remove(at:index)
                    break
                }
            }
        }
        XCTAssertTrue(self.expectedItems.isEmpty, "There are some expected items not found")
    }
}
