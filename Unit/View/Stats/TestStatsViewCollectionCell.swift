import XCTest
@testable import catban

class TestStatsViewCollectionCell:XCTestCase {
    private var cell:StatsViewCollectionCell!
    private var view:MockStatsView!
    
    override func setUp() {
        super.setUp()
        self.cell = StatsViewCollectionCell(frame:CGRect.zero)
        self.view = MockStatsView()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.cell, "Failed to load cell")
        XCTAssertNotNil(self.view, "Failed to load view")
    }
    
    func testAddNewView() {
        cell.updateWith(view:view)
        XCTAssertNotNil(cell.view, "Failed to add view")
        XCTAssertNotNil(cell.view?.superview, "Failed to assign super view")
    }
}
