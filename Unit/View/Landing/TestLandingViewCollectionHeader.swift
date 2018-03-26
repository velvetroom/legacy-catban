import XCTest
@testable import catban

class TestLandingViewCollectionHeader:XCTestCase {
    private var header:LandingViewCollectionHeader!
    
    override func setUp() {
        super.setUp()
        self.header = LandingViewCollectionHeader()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.header, "Failed to load header")
    }
}
