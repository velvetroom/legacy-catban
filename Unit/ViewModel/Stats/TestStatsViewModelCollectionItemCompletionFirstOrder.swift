import XCTest
@testable import catban

class TestStatsViewModelCollectionItemCompletionFirstOrder:XCTestCase {
    private var viewModel:StatsViewModelCollectionItemCompletionFirstOrder!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModelCollectionItemCompletionFirstOrder()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
