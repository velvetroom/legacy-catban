import XCTest
@testable import catban

class TestStatsViewCompletionSecondOrder:XCTestCase {
    private var view:StatsViewCompletionSecondOrder!
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletionSecondOrder()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
