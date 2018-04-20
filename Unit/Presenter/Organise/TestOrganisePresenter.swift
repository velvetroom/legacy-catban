import XCTest
@testable import catban

class TestOrganisePresenter:XCTestCase {
    private var presenter:OrganisePresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = OrganisePresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load outlets")
    }
}
