import XCTest
@testable import catban

class TestStatsItemCompletion:XCTestCase {
    private var model:StatsItemCompletion!
    
    override func setUp() {
        super.setUp()
        self.model = StatsItemCompletion()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
