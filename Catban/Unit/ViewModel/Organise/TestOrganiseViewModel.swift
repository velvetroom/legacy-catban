import XCTest
@testable import catban

class TestOrganiseViewModel:XCTestCase {
    private var viewModel:OrganiseViewModel!
    
    override func setUp() {
        super.setUp()
        self.viewModel = OrganiseViewModel()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.collection, "Failed to load collection")
    }
}
