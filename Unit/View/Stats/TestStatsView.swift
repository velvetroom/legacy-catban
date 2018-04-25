import XCTest
@testable import catban

class TestStatsView:XCTestCase {
    private var view:StatsView!
    
    override func setUp() {
        super.setUp()
        self.view = StatsView()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
