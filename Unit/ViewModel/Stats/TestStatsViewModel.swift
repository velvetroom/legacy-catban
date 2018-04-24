import XCTest
@testable import catban

class TestStatsViewModel:XCTestCase {
    private var viewModel:StatsViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.collection, "Failed to load collection")
        XCTAssertNotNil(self.viewModel.pageControl, "Failed to load page control")
    }
}
