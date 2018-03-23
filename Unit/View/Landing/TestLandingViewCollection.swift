import XCTest
@testable import catban

class TestLandingViewCollection:XCTestCase {
    private var view:LandingViewCollection!
    
    override func setUp() {
        super.setUp()
        self.view = LandingViewCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
