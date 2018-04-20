import XCTest
@testable import catban

class TestOrganiseViewCollectionCell:XCTestCase {
    private var view:OrganiseViewCollectionCell!
    
    override func setUp() {
        super.setUp()
        self.view = OrganiseViewCollectionCell()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.labelName, "Failed to load label name")
    }
}
