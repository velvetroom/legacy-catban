import XCTest
@testable import catban

class TestLandingDeletePresenter:XCTestCase {
    private var presenter:LandingDeletePresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingDeletePresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNil(self.presenter.actionDelete, "Action should not be set")
        XCTAssertNil(self.presenter.actionCancel, "Action should not be set")
    }
}
