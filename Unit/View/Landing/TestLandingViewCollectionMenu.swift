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
        XCTAssertNotNil(self.menu.buttonMoveRight, "Failed to load button move right")
        XCTAssertNotNil(self.menu.buttonMoveLeft, "Failed to load button move left")
        XCTAssertNotNil(self.menu.buttonClose, "Failed to load button close")
    }
}
