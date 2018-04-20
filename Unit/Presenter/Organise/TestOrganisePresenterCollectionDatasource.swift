import XCTest
@testable import catban

class TestOrganisePresenterCollectionDatasource:XCTestCase {
    private var presenter:OrganisePresenterCollectionDatasource!
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenterCollectionDatasource()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
