import XCTest
@testable import catban

class TestStatsViewCompletionFirstOrder:XCTestCase {
    private var view:StatsViewCompletionFirstOrder!
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletionFirstOrder()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
