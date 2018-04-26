import XCTest
@testable import catban

class TestStatsViewModelCollectionItemCompletionCircle:XCTestCase {
    private var viewModel:StatsViewModelCollectionItemCompletionCircle!
    
    override func setUp() {
        super.setUp()
        self.viewModel = StatsViewModelCollectionItemCompletionCircle()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.fillColour, "Failed to load colour")
        XCTAssertNotNil(self.viewModel.startAngle, "Failed to load angle")
        XCTAssertNotNil(self.viewModel.endAngle, "Failed to load angle")
        XCTAssertNotNil(self.viewModel.startAngle, "Failed to load angle")
    }
}
