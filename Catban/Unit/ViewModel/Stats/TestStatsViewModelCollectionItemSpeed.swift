import XCTest
@testable import catban

class TestStatsViewModelCollectionItemSpeed:XCTestCase {
    private var viewModel:StatsViewModelCollectionItemSpeed!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModelCollectionItemSpeed()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
