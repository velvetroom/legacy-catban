import XCTest
@testable import catban

class TestStatsViewSpeed:XCTestCase {
    private var view:StatsViewSpeed!
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewSpeed()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
