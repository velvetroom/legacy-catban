import XCTest
@testable import Home

class TestDrag:XCTestCase {
    private var model:Map!
    private var viewScroll:ViewScroll!
    private var viewBoard:ViewBoard!
    
    override func setUp() {
        super.setUp()
        self.model = Map()
        self.viewScroll = ViewScroll()
        self.viewBoard = ViewBoard()
        self.model.viewScroll = self.viewScroll
        self.model.viewBoard = self.viewBoard
    }
    
    func testNotRetainingScroll() {
        self.model.viewScroll = ViewScroll()
        XCTAssertNil(self.model.viewScroll, "Retaining")
    }
    
    func testNotRetainingBoard() {
        self.model.viewBoard = ViewBoard()
        XCTAssertNil(self.model.viewBoard, "Retaining")
    }
    
    func testReadWidth() {
        let width:CGFloat = 100
        self.viewScroll.contentSize.width = width
        XCTAssertEqual(self.model.width, width, "Failed to read")
    }
    
    func testReadHeight() {
        let height:CGFloat = 100
        self.viewScroll.contentSize.height = height
        XCTAssertEqual(self.model.height, height, "Failed to read")
    }
    
    func testSetWidth() {
        let width:CGFloat = 88
        self.model.width = width
        XCTAssertEqual(self.viewBoard.frame.width, width, "Not set")
        XCTAssertEqual(self.viewScroll.contentSize.width, width, "Not set")
    }
    
    func testSetHeight() {
        let height:CGFloat = 77
        self.model.height = height
        XCTAssertEqual(self.viewBoard.frame.height, height, "Not set")
        XCTAssertEqual(self.viewScroll.contentSize.height, height, "Not set")
    }
}
