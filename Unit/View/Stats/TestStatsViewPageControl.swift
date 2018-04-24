import XCTest
@testable import catban

class TestStatsViewPageControl:XCTestCase {
    private var view:StatsViewPageControl!
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewPageControl()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
