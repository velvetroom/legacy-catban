import XCTest
@testable import catban

class TestLandingViewModelCollectionSection:XCTestCase {
    private var section:LandingViewModelCollectionSection!
    
    override func setUp() {
        super.setUp()
        self.section = LandingViewModelCollectionSection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.section, "Failed to load section")
        XCTAssertNotNil(self.section.items, "Failed to load items")
    }
}
