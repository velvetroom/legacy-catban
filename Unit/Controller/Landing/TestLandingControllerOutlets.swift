import XCTest
@testable import catban

class TestLandingControllerOutlets:XCTestCase {
    private var outlets:LandingControllerOutlets!
    
    override func setUp() {
        super.setUp()
        self.outlets = LandingControllerOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.outlets, "Failed to load outlets")
    }
}
