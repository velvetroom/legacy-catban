import XCTest
@testable import catban

class TestOrganiseViewModelCollection:XCTestCase {
    private var viewModel:OrganiseViewModelCollection!
    
    override func setUp() {
        super.setUp()
        self.viewModel = OrganiseViewModelCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
