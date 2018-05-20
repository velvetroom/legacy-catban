import XCTest
@testable import Canvas

class TestDragStateFixed:XCTestCase {
    private var model:DragStateFixed!
    private var changer:MockDragStateChangerProtocol!
    private var event:MockDragEventProtocol!
    private var view:MockViewItem!
    private var canvas:CanvasEditorProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = DragStateFixed()
        self.changer = MockDragStateChangerProtocol()
        self.event = MockDragEventProtocol()
        self.view = MockViewItem()
        self.canvas = MockCanvasEditorProtocol()
        self.model.event = self.event
        self.model.changer = self.changer
        self.event.viewItem = self.view
        self.event.canvas = self.canvas
    }
    
    func testNotRetainingEvent() {
        self.model.event = MockDragEventProtocol()
        XCTAssertNil(self.model.event, "Retains")
    }
    
    func testNotRetainingChanger() {
        self.model.changer = MockDragStateChangerProtocol()
        XCTAssertNil(self.model.changer, "Retains")
    }
    
    func testNotRetainingEditor() {
        self.model.mapEditor = MockMapEditorProtocol()
        XCTAssertNil(self.model.mapEditor, "Retains")
    }
    
    func testStartMovingChangesTypeToNone() {
        var called:Bool = false
        self.event.position.latestTouch = CGPoint(x:100, y:100)
        self.changer.onChange = { (stateType:DragStateProtocol.Type) in
            XCTAssertTrue(stateType == DragStateNone.self, "Invalid type")
            called = true
        }
        self.model.update()
        XCTAssertTrue(called, "Not called")
    }
    
    func testStartMovingChangesViewToNormal() {
        var called:Bool = false
        self.event.position.latestTouch = CGPoint(x:100, y:100)
        self.view.onStateNormal = {
            called = true
        }
        self.model.update()
        XCTAssertTrue(called, "Not called")
    }
    
    func testEndTriggersAction() {
        var called:Bool = false
        self.event.position.latestTouch = CGPoint(x:100, y:100)
        self.view.onTriggerAction = {
            called = true
        }
        
        self.model.end()
        XCTAssertTrue(called, "Not called")
    }
}
