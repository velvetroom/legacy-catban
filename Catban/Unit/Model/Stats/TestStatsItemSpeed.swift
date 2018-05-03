import XCTest
@testable import catban

class TestStatsItemSpeed:XCTestCase {
    private var model:StatsItemSpeed!
    
    override func setUp() {
        super.setUp()
        self.model = StatsItemSpeed()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
