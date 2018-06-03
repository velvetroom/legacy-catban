import XCTest
@testable import Canvas

class TestViewContent:XCTestCase {
    private var view:ViewContent!
    private var drag:MockDragProtocol!
    
    override func setUp() {
        super.setUp()
        self.view = ViewContent()
        self.drag = MockDragProtocol()
        self.view.drag = self.drag
    }
    
    func testNotRetainingDrag() {
        self.view.drag = MockDragProtocol()
        XCTAssertNil(self.view.drag, "Retains")
    }
    
    func testClearsRemovesSubviews() {
        self.view.addSubview(UIView())
        XCTAssertFalse(self.view.subviews.isEmpty, "Not added")
        
        self.view.clear()
        XCTAssertTrue(self.view.subviews.isEmpty, "Not released")
    }
    
    func testTouchesBeganIgnores() {
        var called:Bool = false
        let touch:UITouch = UITouch()
        self.drag.onDragBegin = {
            called = true
        }
        
        self.view.touchesBegan([touch], with:nil)
        XCTAssertFalse(called, "Should not be called")
    }
    
    func testTouchesBeganCallsDrag() {
        var called:Bool = false
        let touch:MockTouch = MockTouch()
        touch.returnView = MockViewItem()
        self.drag.onDragBegin = {
            called = true
        }
        
        self.view.touchesBegan([touch], with:nil)
        XCTAssertTrue(called, "Should be called")
    }
    
    func testTouchesMovedCallsDrag() {
        var called:Bool = false
        let touch:MockTouch = MockTouch()
        self.drag.onDragUpdate = {
            called = true
        }
        
        self.view.touchesMoved([touch], with:nil)
        XCTAssertTrue(called, "Should be called")
    }
    
    func testTouchesCancelledCallsDrag() {
        var called:Bool = false
        let touch:MockTouch = MockTouch()
        self.drag.onDragEnd = {
            called = true
        }
        
        self.view.touchesCancelled([touch], with:nil)
        XCTAssertTrue(called, "Should be called")
    }
    
    func testTouchesEndedCallsDrag() {
        var called:Bool = false
        let touch:MockTouch = MockTouch()
        self.drag.onDragEnd = {
            called = true
        }
        
        self.view.touchesEnded([touch], with:nil)
        XCTAssertTrue(called, "Should be called")
    }
}
