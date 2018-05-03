import XCTest
@testable import catban

class TestLandingStateStandby:XCTestCase {
    private var model:LandingStateStandby!
    
    override func setUp() {
        super.setUp()
        self.model = LandingStateStandby()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
