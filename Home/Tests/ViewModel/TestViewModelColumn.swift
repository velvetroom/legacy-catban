import XCTest
@testable import Home

class TestViewModelColumn:XCTestCase {
    private var viewModel:ViewModelColumn!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModelColumn()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
    
    func testProperties() {
        XCTAssertNotNil(self.viewModel.name, "Failed to load property")
        XCTAssertNotNil(self.viewModel.left, "Failed to load property")
    }
}
