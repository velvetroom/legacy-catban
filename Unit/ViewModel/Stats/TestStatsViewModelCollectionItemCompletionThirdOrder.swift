import XCTest
@testable import catban

class TestStatsViewModelCollectionItemCompletionThirdOrder:XCTestCase {
    private var viewModel:StatsViewModelCollectionItemCompletionThirdOrder!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModelCollectionItemCompletionThirdOrder()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
