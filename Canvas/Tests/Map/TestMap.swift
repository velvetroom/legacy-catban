import XCTest
@testable import Home

class TestMap:XCTestCase {
    private var model:Map!
    private var viewScroll:ViewScroll!
    private var viewBoard:ViewBoard!
    
    override func setUp() {
        super.setUp()
        self.model = Map()
        self.viewScroll = ViewScroll()
        self.viewBoard = ViewBoard()
        self.model.viewScroll = self.viewScroll
    }
    
    func testNotRetainingScroll() {
        self.model.viewScroll = ViewScroll()
        XCTAssertNil(self.model.viewScroll, "Retaining")
    }
}
