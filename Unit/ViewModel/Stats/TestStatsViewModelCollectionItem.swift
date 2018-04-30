import XCTest
@testable import catban

class TestStatsViewModelCollectionItem:XCTestCase {
    private var viewModel:MockStatsViewModelCollectionItemProtocol!
    
    override func setUp() {
        super.setUp()
        self.viewModel = MockStatsViewModelCollectionItemProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
