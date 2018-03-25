import XCTest
@testable import catban

class TestLandingOutlets:XCTestCase {
    private var outlets:LandingOutlets!
    
    override func setUp() {
        super.setUp()
        self.outlets = LandingOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.outlets, "Failed to load outlets")
    }
}
