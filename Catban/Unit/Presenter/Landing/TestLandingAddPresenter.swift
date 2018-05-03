import XCTest
@testable import catban

class TestLandingAddPresenter:XCTestCase {
    private var presenter:LandingAddPresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingAddPresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNil(self.presenter.actionColumn, "Action should not be set")
        XCTAssertNil(self.presenter.actionCard, "Action should not be set")
        XCTAssertNil(self.presenter.actionProject, "Action should not be set")
        XCTAssertNil(self.presenter.actionCancel, "Action should not be set")
    }
}
