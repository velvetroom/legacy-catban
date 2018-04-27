import XCTest
@testable import catban

class TestCircleCompletionStackViewModel:XCTestCase {
    private var viewModel:CircleCompletionStackViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = CircleCompletionStackViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.radians, "Failed to load property")
        XCTAssertNotNil(self.viewModel.percent, "Failed to load property")
        XCTAssertNotNil(self.viewModel.cards, "Failed to load property")
    }
}
