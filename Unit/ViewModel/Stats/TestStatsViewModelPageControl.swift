import XCTest
@testable import catban

class TestStatsViewModelPageControl:XCTestCase {
    private var viewModel:StatsViewModelPageControl!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModelPageControl()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.currentPage, "Failed to load current page")
        XCTAssertNotNil(self.viewModel.numberOFPages, "Failed to load number of pages")
    }
}
