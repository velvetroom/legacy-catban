import XCTest
@testable import catban

class TestStatsPresenterOutlets:XCTestCase {
    private var presenter:StatsPresenterOutlets!
    
    override func setUp() {
        super.setUp()
        self.presenter = StatsPresenterOutlets()
    }
    
    func testLoad() {
        XCTAssertNil(self.presenter.collection, "Collection should not be set by default")
    }
}
