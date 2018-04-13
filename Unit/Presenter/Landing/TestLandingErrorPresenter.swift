import XCTest
@testable import catban

class TestLandingErrorPresenter:XCTestCase {
    private var presenter:LandingErrorPresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = LandingErrorPresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
