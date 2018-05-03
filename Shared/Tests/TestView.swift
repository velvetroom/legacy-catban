import XCTest
@testable import Shared

class TestView:XCTestCase {
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.view = View()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.view, "Failed to load view")
        XCTAssertNil(self.view.delegate, "Delegate should not be set initially")
    }
}
