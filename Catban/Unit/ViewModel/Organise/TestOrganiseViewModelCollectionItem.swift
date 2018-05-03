import XCTest
@testable import catban

class TestOrganiseViewModelCollectionItem:XCTestCase {
    private var viewModel:OrganiseViewModelCollectionItem!
    
    override func setUp() {
        super.setUp()
        self.viewModel = OrganiseViewModelCollectionItem()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
        XCTAssertNotNil(self.viewModel.name, "Failed to load name")
    }
}
