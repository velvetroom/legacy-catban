import XCTest
@testable import Projects

class TestViewRenamer:XCTestCase {
    private var view:ViewRenamer!
    
    override func setUp() {
        super.setUp()
        self.view = ViewRenamer()
    }
    
    func testInitiallyHidden() {
        XCTAssertFalse(self.view.isUserInteractionEnabled, "Should be disabled")
        XCTAssertEqual(self.view.alpha, ViewConstants.Renamer.alphaOff, "Invalid alpha")
    }
}
