import XCTest
@testable import Home

class TestViewModelScroll:XCTestCase {
    private var viewModel:ViewModelScroll!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModelScroll()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
    
    func testProperties() {
        XCTAssertNotNil(self.viewModel.contentSize, "Failed to load property")
    }
}
