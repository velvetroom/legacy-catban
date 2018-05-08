import XCTest
@testable import Home

class TestViewBoard:XCTestCase {
    private var view:ViewBoard!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBoard()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
