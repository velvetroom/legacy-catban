import XCTest
@testable import Load

class TestView:XCTestCase {
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.view = View()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
    }
}
