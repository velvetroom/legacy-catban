import XCTest
@testable import Canvas

class TestView:XCTestCase {
    private var view:View!
    
    override func setUp() {
        super.setUp()
        self.view = View()
    }
    
    func testLoadsContent() {
        XCTAssertNotNil(self.view.content, "Not loaded")
    }
    
    func testNotRetainingContent() {
        self.view.content = MockViewContent()
        XCTAssertNil(self.view.content, "Retains")
    }
    
    func testUpdateFrameContent() {
        let frame:CGRect = CGRect(x:0, y:1, width:4, height:5)
        self.view.frame = frame
        XCTAssertEqual(self.view.content.frame, CGRect(origin:CGPoint.zero, size:frame.size), "Not updated")
    }
    
    func testMapChangedUpdatesContent() {
        let size:CGSize = CGSize(width:8, height:9)
        self.view.mapChanged(size:size)
        XCTAssertEqual(self.view.content.frame, CGRect(origin:CGPoint.zero, size:size), "Not updated")
    }
}
