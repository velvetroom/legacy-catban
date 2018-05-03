import XCTest
@testable import catban

class TestStatsViewModelCollection:XCTestCase {
    private var viewModel:StatsViewModelCollection!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModelCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.items, "Failed to load items")
    }
}
