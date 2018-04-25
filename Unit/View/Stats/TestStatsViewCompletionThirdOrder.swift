import XCTest
@testable import catban

class TestStatsViewCompletionThirdOrder:XCTestCase {
    private var view:TestStatsViewCompletionThirdOrder!
    
    override func setUp() {
        super.setUp()
        self.view = TestStatsViewCompletionThirdOrder()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
