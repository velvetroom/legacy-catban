import XCTest
@testable import catban

class TestLandingViewModelOutlets:XCTestCase {
    private var outlets:LandingViewModelOutlets!
    
    override func setUp() {
        super.setUp()
        self.outlets = LandingViewModelOutlets()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.outlets, "Failed to load outlets")
        XCTAssertNotNil(self.outlets.title, "Failed to load title")
        XCTAssertNotNil(self.outlets.logoHidden, "Failed to load logo hidden")
    }
}
