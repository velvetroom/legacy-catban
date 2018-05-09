import XCTest
@testable import Home

class TestViewModelBoard:XCTestCase {
    private var viewModel:ViewModelBoard!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModelBoard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
    
    func testProperties() {
        XCTAssertNotNil(self.viewModel.frame, "Failed to load property")
    }
}
