import XCTest
@testable import catban

class TestOrganisePresenterCollectionDelegate:XCTestCase {
    private var presenter:OrganisePresenterCollectionDelegate!
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenterCollectionDelegate()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
