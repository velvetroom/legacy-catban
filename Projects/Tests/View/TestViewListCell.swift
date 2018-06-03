import XCTest
@testable import Projects

class TestViewListCell:XCTestCase {
    private var view:ViewListCell!
    
    override func setUp() {
        super.setUp()
        self.view = ViewListCell(frame:CGRect.zero)
    }
    
    func testNotRetainingLabel() {
        self.view.labelName = UILabel()
        XCTAssertNil(self.view.labelName, "Retains")
    }
}
