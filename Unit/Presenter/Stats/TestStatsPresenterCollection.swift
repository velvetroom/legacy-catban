import XCTest
@testable import catban

class TestStatsPresenterCollection:XCTestCase {
    private var presenter:StatsPresenterCollection!
    
    override func setUp() {
        super.setUp()
        self.presenter = StatsPresenterCollection()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
