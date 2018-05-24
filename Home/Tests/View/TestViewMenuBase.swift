import XCTest
@testable import Home

class TestViewMenuBase:XCTestCase {
    private var view:ViewMenuBase!
    
    override func setUp() {
        super.setUp()
        self.view = ViewMenuBase()
    }
    
    func testNotRetainingBackground() {
        self.view.viewBackground = ViewMenuBackground()
        XCTAssertNil(self.view.viewBackground, "Retains")
    }
    
    func testNotRetainingClose() {
        self.view.viewClose = ViewMenuClose()
        XCTAssertNil(self.view.viewClose, "Retains")
    }
    
    func testNotRetainingOptions() {
        self.view.viewOptions = ViewMenuOptions()
        XCTAssertNil(self.view.viewOptions, "Retains")
    }
}
