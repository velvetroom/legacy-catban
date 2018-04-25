import XCTest
@testable import catban

class TestStatsViewModelCollectionItemCompletionSecondOrder:XCTestCase {
    private var viewModel:StatsViewModelCollectionItemCompletionSecondOrder!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModelCollectionItemCompletionSecondOrder()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
