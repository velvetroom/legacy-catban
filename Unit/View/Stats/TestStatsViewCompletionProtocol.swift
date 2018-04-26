import XCTest
@testable import catban

class TestStatsViewCompletionProtocol:XCTestCase {
    private var view:MockStatsViewCompletionProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = MockStatsViewCompletionProtocol()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
