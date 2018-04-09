import XCTest
@testable import catban

class TestLandingColumnEditPresenter:XCTestCase {
    private var presenter:LandingColumnEditPresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingColumnEditPresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNil(self.presenter.actionDelete, "Action should not be set")
        XCTAssertNil(self.presenter.actionCancel, "Action should not be set")
    }
}
