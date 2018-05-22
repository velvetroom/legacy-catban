import XCTest
@testable import Canvas

class TestDragStateDynamic:XCTestCase {
    private var model:DragStateDynamic!
    private var changer:MockDragStateChangerProtocol!
    private var event:MockDragEventProtocol!
    private var mapItem:MockMapItemProtocol!
    private var view:MockViewItem!
    private var parent:MockMapParentProtocol!
    private var canvas:CanvasEditorProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = DragStateDynamic()
        self.changer = MockDragStateChangerProtocol()
        self.event = MockDragEventProtocol()
        self.view = MockViewItem()
        self.mapItem = MockMapItemProtocol()
        self.parent = MockMapParentProtocol()
        self.canvas = MockCanvasEditorProtocol()
        self.model.event = self.event
        self.model.changer = self.changer
        self.event.viewItem = self.view
        self.event.mapItem = self.mapItem
        self.mapItem.parent = self.parent
        self.parent.childItem = self.mapItem
        self.event.canvas = self.canvas
        self.view.mapItem = self.mapItem
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
    
    func testStartMovingChangesTypeToMoving() {
        var called:Bool = false
        self.event.position.latestTouch = CGPoint(x:100, y:100)
        self.changer.onChange = { (stateType:DragStateProtocol.Type) in
            XCTAssertTrue(stateType == DragStateMoving.self, "Invalid type")
            called = true
        }
        self.model.update()
        XCTAssertTrue(called, "Not called")
    }
    
    func testStartMovingCallsView() {
        var called:Bool = false
        self.event.position.latestTouch = CGPoint(x:100, y:100)
        self.view.onStateMoving = {
            called = true
        }
        
        self.model.update()
        XCTAssertTrue(called, "Not called")
    }
    
    func testStartMovingDetachesItem() {
        self.event.position.latestTouch = CGPoint(x:100, y:100)
        self.model.update()
        XCTAssertNil(self.mapItem.parent, "Not detached")
        XCTAssertNil(self.parent.childItem, "Not detached")
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
