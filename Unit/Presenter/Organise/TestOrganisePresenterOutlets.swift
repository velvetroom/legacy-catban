import XCTest
@testable import catban

class TestOrganisePresenterOutlets:XCTestCase {
    private var outlets:OrganisePresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.outlets = OrganisePresenterOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.outlets, "Failed to load outlets")
        XCTAssertNil(self.outlets.collection, "Collection should not be assigned")
    }
}
