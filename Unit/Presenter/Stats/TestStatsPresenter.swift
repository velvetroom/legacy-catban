import XCTest
@testable import catban

class TestStatsPresenter:XCTestCase {
    private var presenter:StatsPresenter!
    
    override func setUp() {
        super.setUp()
        self.presenter = StatsPresenter()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.presenter, "Failed to load presenter")
        XCTAssertNotNil(self.presenter.outlets, "Failed to load outlets")
        XCTAssertNotNil(self.presenter.collection, "Failed to load collection")
    }
}
