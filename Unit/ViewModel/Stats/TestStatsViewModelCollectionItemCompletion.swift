import XCTest
@testable import catban

class TestStatsViewModelCollectionItemCompletion:XCTestCase {
    private var viewModel:StatsViewModelCollectionItemCompletion!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModelCollectionItemCompletion()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.circles, "Failed to load circles")
    }
}
