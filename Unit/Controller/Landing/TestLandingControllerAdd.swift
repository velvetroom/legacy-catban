import XCTest
@testable import catban

class TestLandingControllerAdd:XCTestCase {
    private var controller:LandingControllerAdd!
    
    override func setUp() {
        super.setUp()
        self.controller = LandingControllerAdd()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
}
