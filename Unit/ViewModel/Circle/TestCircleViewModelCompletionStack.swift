import XCTest
@testable import catban

class TestCircleViewModelCompletionStack:XCTestCase {
    private var viewModel:CircleViewModelCompletionStack!
    
    override func setUp() {
        super.setUp()
        self.viewModel = CircleViewModelCompletionStack()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.radians, "Failed to load property")
        XCTAssertNotNil(self.viewModel.percent, "Failed to load property")
        XCTAssertNotNil(self.viewModel.cards, "Failed to load property")
    }
}
