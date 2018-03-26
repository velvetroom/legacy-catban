import XCTest
@testable import catban

class TestLandingViewCollectionLayout:XCTestCase {
    private var layout:LandingViewCollectionLayout!
    
    override func setUp() {
        super.setUp()
        self.layout = LandingViewCollectionLayout()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.layout, "Failed to load layout")
    }
}
