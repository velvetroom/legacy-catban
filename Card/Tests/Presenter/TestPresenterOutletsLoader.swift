import XCTest
@testable import Card

class TestPresenterOutletsLoader:XCTestCase {
    private var loader:PresenterOutletsLoader!
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.loader = PresenterOutletsLoader()
        self.view = View()
    }
    
    func testLoadText() {
        self.loader.loadFor(view:self.view)
        XCTAssertNotNil(self.loader.outlets.viewText, "Not loaded")
    }
    
    func testLoadTextLayoutBottom() {
        self.loader.loadFor(view:self.view)
        XCTAssertNotNil(self.loader.outlets.viewText?.layoutBottom, "Not loaded")
    }
}
