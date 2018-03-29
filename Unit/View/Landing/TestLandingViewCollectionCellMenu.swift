import XCTest
@testable import catban

class TestLandingViewCollectionCellMenu:XCTestCase {
    private var menu:LandingViewCollectionCellMenu!
    
    override func setUp() {
        super.setUp()
        self.menu = LandingViewCollectionCellMenu()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.menu, "Failed to load menu")
    }
}
