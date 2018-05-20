import XCTest
@testable import Canvas

class TestDragStateProtocol:XCTestCase {
    private var model:MockDragStateProtocol!
    private var event:MockDragEventProtocol!
    private var canvas:MockCanvasEditorProtocol!
    private var changer:MockDragStateChangerProtocol!
    private var view:MockViewItem!
    
    override func setUp() {
        super.setUp()
        self.model = MockDragStateProtocol()
        self.view = MockViewItem()
        self.event = MockDragEventProtocol()
        self.canvas = MockCanvasEditorProtocol()
        self.changer = MockDragStateChangerProtocol()
        self.model.changer = self.changer
        self.event.canvas = self.canvas
        self.model.event = self.event
        self.event.viewItem = self.view
    }
    
    func testTriggerActionCallsView() {
        var called:Bool = false
        self.view.onTriggerAction = {
            called = true
        }
        
        self.model.triggerAction()
        XCTAssertTrue(called, "Not called")
    }
    
    func testTriggerActionChangesState() {
        var called:Bool = false
        self.changer.onChange = {
            called = true
        }
        
        self.model.triggerAction()
        XCTAssertTrue(called, "Not called")
    }
    
    func testFinishDragChangesViewToNormal() {
        var called:Bool = false
        self.view.onStateNormal = {
            called = true
        }
        
        self.model.finishDrag()
        XCTAssertTrue(called, "Not called")
    }
    
    func testFinishDragChangesState() {
        var called:Bool = false
        self.changer.onChange = {
            called = true
        }
        
        self.model.finishDrag()
        XCTAssertTrue(called, "Not called")
    }
}
