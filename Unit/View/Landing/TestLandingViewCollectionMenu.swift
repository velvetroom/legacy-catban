import XCTest
@testable import catban

class TestLandingViewCollectionMenu:XCTestCase {
    private var menu:LandingViewCollectionMenu!
    
    override func setUp() {
        super.setUp()
        self.menu = LandingViewCollectionMenu()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.menu, "Failed to load menu")
    }
}
