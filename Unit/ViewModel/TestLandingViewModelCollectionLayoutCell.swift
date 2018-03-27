import XCTest
@testable import catban

class TestLandingViewModelCollectionLayoutCell:XCTestCase {
    private var cell:LandingViewModelCollectionLayoutCell!
    
    override func setUp() {
        super.setUp()
        self.cell = LandingViewModelCollectionLayoutCell()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.cell, "Failed to load cell")
    }
}
