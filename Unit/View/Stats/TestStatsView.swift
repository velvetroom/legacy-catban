import XCTest
@testable import catban

class TestStatsView:XCTestCase {
    private var view:StatsView<MockStatsViewModelCollectionItemProtocol>!
    
    override func setUp() {
        super.setUp()
        self.view = StatsView<MockStatsViewModelCollectionItemProtocol>()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.viewModel, "Failed to load view model")
    }
}
