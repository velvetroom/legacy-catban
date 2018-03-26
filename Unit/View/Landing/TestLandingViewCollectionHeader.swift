import XCTest
@testable import catban

class TestLandingViewCollectionHeader:XCTestCase {
    private var header:LandingViewCollectionHeader!
    
    override func setUp() {
        super.setUp()
        self.header = LandingViewCollectionHeader(frame:CGRect.zero)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.header, "Failed to load header")
        XCTAssertNotNil(self.header.labelTitle, "Failed to load header title")
    }
}
