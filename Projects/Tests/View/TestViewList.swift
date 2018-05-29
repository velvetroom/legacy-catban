import XCTest
@testable import Projects

class TestViewList:XCTestCase {
    private var view:ViewList!
    
    override func setUp() {
        super.setUp()
        self.view = ViewList()
    }
    
    func testNotRetainingLayout() {
        self.view.layoutSelectorY = NSLayoutConstraint()
        XCTAssertNotNil(self.view.layoutSelectorY, "Retains")
    }
}
