import XCTest
@testable import catban

class TestStatsViewCompletion:XCTestCase {
    private var view:StatsViewCompletion<MockStatsViewModelCollectionItemCompletionProtocol>!
    
    override func setUp() {
        super.setUp()
        self.view = StatsViewCompletion()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNotNil(self.view.totalRadians, "Failed to load total radians")
        XCTAssertNotNil(self.view.radius, "Failed to load radius")
        XCTAssertNotNil(self.view.viewGeneral, "Failed to load general")
    }
}
