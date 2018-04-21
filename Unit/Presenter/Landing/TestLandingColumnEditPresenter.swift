import XCTest
@testable import catban

class TestLandingColumnEditPresenter:XCTestCase {
    private var presenter:LandingEditPresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingEditPresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNil(self.presenter.actionDelete, "Action should not be set")
        XCTAssertNil(self.presenter.actionCancel, "Action should not be set")
    }
}
