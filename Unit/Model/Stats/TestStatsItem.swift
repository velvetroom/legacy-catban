import XCTest
@testable import catban

class TestStatsItem:XCTestCase {
    private var model:MockStatsItemProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = MockStatsItemProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
