import XCTest
@testable import Canvas

class TestDragStateMoving:XCTestCase {
    private var model:DragStateMoving!
    private var changer:MockDragStateChangerProtocol!
    private var event:MockDragEventProtocol!
    private var mapItem:MockMapItemProtocol!
    private var view:MockViewItemMapable!
    private var editor:MockMapEditorProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = DragStateMoving()
        self.changer = MockDragStateChangerProtocol()
        self.event = MockDragEventProtocol()
        self.view = MockViewItemMapable()
        self.mapItem = MockMapItemProtocol()
        self.editor = MockMapEditorProtocol()
        self.model.event = self.event
        self.model.changer = self.changer
        self.event.viewItem = self.view
        self.event.mapItem = self.mapItem
        self.model.mapEditor = self.editor
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
    
    func testUpdateInjectsItemPosition() {
        var injected:Bool = false
        self.event.position.latestTouch = CGPoint(x:100, y:200)
        self.view.onUpdatePosition = {
            injected = true
        }
        self.model.update()
        
        XCTAssertTrue(injected, "Not injected")
    }
    
    func testUpdateCallsView() {
        var called:Bool = false
        self.view.onUpdatePosition = {
            called = true
        }
        
        self.model.update()
        XCTAssertTrue(called, "Not called")
    }
    
    func testEndArrangesItem() {
        var called:Bool = false
        self.editor.onArrange = {
            called = true
        }
        
        self.model.end()
        XCTAssertTrue(called, "Not ordered")
    }
    
    func testEndUpdatesView() {
        var called:Bool = false
        self.view.onEndMoving = {
            called = true
        }
        
        self.model.end()
        XCTAssertTrue(called, "Not called")
    }
    
    func testEndChangesTypeToNone() {
        var called:Bool = false
        self.changer.onChange = { (stateType:DragStateProtocol.Type) in
            XCTAssertTrue(stateType == DragStateNone.self, "Invalid type")
            called = true
        }
        
        self.model.end()
        XCTAssertTrue(called, "Not called")
    }
    
    func testEndChangesViewToNormal() {
        var called:Bool = false
        self.view.onStateNormal = {
            called = true
        }
        
        self.model.end()
        XCTAssertTrue(called, "Not called")
    }
}
