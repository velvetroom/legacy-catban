import XCTest
@testable import Home

class TestViewModelView:XCTestCase {
    private var viewModel:ViewModelView!
    
    override func setUp() {
        super.setUp()
        self.viewModel = ViewModelView()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
    
    func testProperties() {
        XCTAssertNotNil(self.viewModel.title, "Failed to load property")
    }
}
