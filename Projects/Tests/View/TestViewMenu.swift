import XCTest
@testable import Projects

class TestViewMenu:XCTestCase {
    private var view:ViewMenu!
    
    override func setUp() {
        super.setUp()
        self.view = ViewMenu()
    }
    
    func testNotRetainingDelete() {
        self.view.buttonDelete = ViewMenuItem()
        XCTAssertNil(self.view.buttonDelete, "Retains")
    }
    
    func testNotRetainingRename() {
        self.view.buttonRename = ViewMenuItem()
        XCTAssertNil(self.view.buttonRename, "Retains")
    }
    
    func testNotRetainingOpen() {
        self.view.buttonOpen = ViewMenuItem()
        XCTAssertNil(self.view.buttonOpen, "Retains")
    }
}
