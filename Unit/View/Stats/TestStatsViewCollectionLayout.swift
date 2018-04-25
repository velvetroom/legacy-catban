import XCTest
@testable import catban

class TestStatsViewCollectionLayout:XCTestCase {
    private var layout:StatsViewCollectionLayout!
    
    override func setUp() {
        super.setUp()
        self.layout = StatsViewCollectionLayout()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.layout, "Failed to load layout")
    }
}
