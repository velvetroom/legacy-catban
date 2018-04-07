import XCTest
@testable import catban

class TestLandingViewCollectionCell:XCTestCase {
    private var cell:LandingViewCollectionCell!
    
    override func setUp() {
        super.setUp()
        self.cell = LandingViewCollectionCell(frame:CGRect.zero)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.cell, "Failed to load cell")
        XCTAssertNotNil(self.cell.labelTitle, "Failed to load title")
        XCTAssertNotNil(self.cell.buttonDelete, "Failed to load button")
    }
    
    func testHideDeleteOnUnselect() {
        self.cell.isSelected = false
        XCTAssertTrue(self.cell.buttonDelete.isHidden, "Failed to hide button")
    }
    
    func testShowDeleteOnSelect() {
        self.cell.isSelected = true
        XCTAssertFalse(self.cell.buttonDelete.isHidden, "Failed to hide button")
    }
}
