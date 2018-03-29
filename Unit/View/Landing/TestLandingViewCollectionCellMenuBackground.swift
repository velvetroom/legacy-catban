import XCTest
@testable import catban

class TestLandingViewCollectionCellMenuBackground:XCTestCase {
    private var background:LandingViewCollectionCellMenuBackground!
    
    override func setUp() {
        super.setUp()
        self.background = LandingViewCollectionCellMenuBackground()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.background, "Failed to load background")
    }
}
