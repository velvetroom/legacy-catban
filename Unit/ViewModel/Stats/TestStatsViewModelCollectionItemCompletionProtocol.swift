import XCTest
@testable import catban

class TestStatsViewModelCollectionItemCompletionProtocol:XCTestCase {
    private var viewModel:MockStatsViewModelCollectionItemCompletionProtocol!
    
    override func setUp() {
        super.setUp()
        self.viewModel = MockStatsViewModelCollectionItemCompletionProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
