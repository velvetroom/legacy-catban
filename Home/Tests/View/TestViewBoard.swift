import XCTest
@testable import Home

class TestViewBoard:XCTestCase {
    private var view:ViewBoard!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBoard()
    }
    
    func testProperties() {
        XCTAssertTrue(self.view.columns.isEmpty, "Columns should be initially empty")
        XCTAssertTrue(self.view.items.isEmpty, "Items should be initially empty")
    }
}
