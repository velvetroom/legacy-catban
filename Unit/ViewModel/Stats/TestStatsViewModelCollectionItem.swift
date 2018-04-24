import XCTest
@testable import catban

class TestStatsViewModelCollectionItem:XCTestCase {
    private var viewModel:StatsViewModelCollectionItem!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModelCollectionItem()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
