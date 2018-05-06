import XCTest
@testable import Home

class TestViewScroll:XCTestCase {
    private var view:ViewScroll!
    
    override func setUp() {
        super.setUp()
        self.view = ViewScroll()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
