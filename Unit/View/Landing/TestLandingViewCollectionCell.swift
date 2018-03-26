import XCTest
@testable import catban

class TestLandingViewCollectionCell:XCTestCase {
    private var cell:LandingViewCollectionCell!
    
    override func setUp() {
        super.setUp()
        self.cell = LandingViewCollectionCell(frame:CGRect.zero)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.cell, "Failed to load cell")
    }
}
