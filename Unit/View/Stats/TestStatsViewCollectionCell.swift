import XCTest
@testable import catban

class TestStatsViewCollectionCell:XCTestCase {
    private var cell:StatsViewCollectionCell!
    
    override func setUp() {
        super.setUp()
        self.cell = StatsViewCollectionCell(frame:CGRect.zero)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.cell, "Failed to load cell")
    }
}
