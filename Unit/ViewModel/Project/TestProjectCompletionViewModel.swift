import XCTest
@testable import catban

class TestProjectCompletionViewModel:XCTestCase {
    private var viewModel:ProjectCompletionViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ProjectCompletionViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.totalCards, "Failed to load property")
        XCTAssertNotNil(self.viewModel.backlog, "Failed to load property")
        XCTAssertNotNil(self.viewModel.progress, "Failed to load property")
        XCTAssertNotNil(self.viewModel.done, "Failed to load property")
    }
}
