import XCTest
@testable import Card

class TestPresenterOutletsLoader:XCTestCase {
    private var loader:PresenterOutletsLoader!
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.loader = PresenterOutletsLoader()
        self.view = View()
        self.loader.view = view
    }
    
    func testLoadView() {
        XCTAssertNotNil(self.loader.loadOulets().view, "Not loaded")
    }
    
    func testLoadText() {
        XCTAssertNotNil(self.loader.loadOulets().viewText, "Not loaded")
    }
    
    func testLoadTextLayoutBottom() {
        XCTAssertNotNil(self.loader.loadOulets().viewText?.layoutBottom, "Not loaded")
    }
}
