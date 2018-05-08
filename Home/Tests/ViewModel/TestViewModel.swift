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
        XCTAssertNotNil(self.viewModel.contentSize, "Failed to load content size")
    }
}
