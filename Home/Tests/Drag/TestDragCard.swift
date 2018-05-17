import XCTest
@testable import Home

class TestDragCard:XCTestCase {
    private var model:MapCard!
    private var view:ViewCard!
    private var layoutLeft:NSLayoutConstraint!
    private var layoutTop:NSLayoutConstraint!
    
    override func setUp() {
        super.setUp()
        self.model = MapCard()
        self.view = ViewCard()
        self.layoutLeft = NSLayoutConstraint()
        self.layoutTop = NSLayoutConstraint()
        self.view.layoutLeft = self.layoutLeft
        self.view.layoutTop = self.layoutTop
        self.model.view = self.view
    }
    
    func testNotRetainingView() {
        self.view = nil
        XCTAssertNil(self.model.view, "Retaining view")
    }
    
    func testGetMidX() {
        let frame:CGRect = CGRect(x:12, y:23, width:45, height:56)
        self.view.frame = frame
        XCTAssertEqual(self.model.midX, frame.midX, "Getter failed")
    }
    
    func testGetMidY() {
        let frame:CGRect = CGRect(x:12, y:23, width:45, height:56)
        self.view.frame = frame
        XCTAssertEqual(self.model.midY, frame.midY, "Getter failed")
    }
    
    func testGetMinX() {
        let left:CGFloat = 34
        self.layoutLeft.constant = left
        XCTAssertEqual(self.model.minX, left, "Getter failed")
    }
    
    func testGetMinY() {
        let top:CGFloat = 43
        self.layoutTop.constant = top
        XCTAssertEqual(self.model.minY, top, "Getter failed")
    }
    
    func testGetMaxX() {
        let frame:CGRect = CGRect(x:34, y:23, width:31, height:33)
        self.view.frame = frame
        XCTAssertEqual(self.model.maxX, frame.maxX, "Getter failed")
    }
    
    func testGetMaxY() {
        let frame:CGRect = CGRect(x:34, y:23, width:31, height:33)
        self.view.frame = frame
        XCTAssertEqual(self.model.maxY, frame.maxY, "Getter failed")
    }
}
