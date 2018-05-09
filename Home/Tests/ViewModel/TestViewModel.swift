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
        XCTAssertNotNil(self.viewModel.scrollContentSize, "Failed to load")
        XCTAssertNotNil(self.viewModel.boardFrame, "Failed to load")
        XCTAssertNotNil(self.viewModel.viewTitle, "Failed to load")
    }
}
