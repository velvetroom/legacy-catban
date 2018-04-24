import XCTest
@testable import catban

class TestStatsPresenterCollectionDelegate:XCTestCase {
    private var presenter:StatsPresenterCollectionDelegate!
    
    override func setUp() {
        super.setUp()
        self.presenter = StatsPresenterCollectionDelegate()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
    }
}
