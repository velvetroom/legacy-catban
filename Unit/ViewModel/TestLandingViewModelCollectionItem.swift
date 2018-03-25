import XCTest
@testable import catban

class TestLandingViewModelCollectionItem:XCTestCase {
    private var item:LandingViewModelCollectionItem!
    
    override func setUp() {
        super.setUp()
        self.item = LandingViewModelCollectionItem()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.item, "Failed to load item")
    }
}
