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
    
    func testTitle() {
        XCTAssertNotNil(self.view.view, "Failed to load view in view")
        XCTAssertNotNil(self.view.title, "Failed to assign title")
        XCTAssertFalse(self.view.title!.isEmpty, "Title should not be empty")
    }
}
