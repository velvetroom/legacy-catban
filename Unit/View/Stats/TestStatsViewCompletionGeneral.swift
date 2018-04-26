import XCTest
@testable import catban

class TestStatsViewCompletionGeneral:XCTestCase {
    private var view:StatsViewCompletionGeneral!
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletionGeneral()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.labelCardsNumber, "Failed to load label")
        XCTAssertNotNil(self.view.labelCardsTitle, "Failed to load label")
    }
}
