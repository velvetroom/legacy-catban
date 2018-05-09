import XCTest
@testable import Home

class TestViewModelCard:XCTestCase {
    private var viewModel:ViewModelCard!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModelCard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
    
    func testProperties() {
        XCTAssertNotNil(self.viewModel.content, "Failed to load property")
        XCTAssertNotNil(self.viewModel.height, "Failed to load property")
        XCTAssertNotNil(self.viewModel.width, "Failed to load property")
        XCTAssertNotNil(self.viewModel.top, "Failed to load property")
        XCTAssertNotNil(self.viewModel.left, "Failed to load property")
    }
}
