import XCTest
@testable import Home

class TestViewModel:XCTestCase {
    private var viewModel:ViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
    
    func testProperties() {
        XCTAssertNotNil(self.viewModel.view, "Failed to load")
        XCTAssertNotNil(self.viewModel.scroll, "Failed to load")
        XCTAssertNotNil(self.viewModel.board, "Failed to load")
        XCTAssertNotNil(self.viewModel.columns, "Failed to load")
        XCTAssertNotNil(self.viewModel.cards, "Failed to load")
    }
}
