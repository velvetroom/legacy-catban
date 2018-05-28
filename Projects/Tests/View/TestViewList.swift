import XCTest
@testable import Projects

class TestViewList:XCTestCase {
    private var view:ViewList!
    
    override func setUp() {
        super.setUp()
        self.view = ViewList()
    }
    
    func testAssignsDelegate() {
        XCTAssertNotNil(self.view.delegate, "Not set")
        XCTAssertNotNil(self.view.dataSource, "Not set")
    }
}
