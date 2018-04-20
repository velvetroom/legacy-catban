import XCTest
@testable import catban

class TestOrganisePresenterCollection:XCTestCase {
    private var presenter:OrganisePresenterCollection!
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenterCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.delegate, "Failed to load delegate")
    }
}
