import XCTest
import Shared
@testable import Canvas

class TestViewColumn:XCTestCase {
    private var view:ViewColumn!
    
    override func setUp() {
        super.setUp()
        self.view = ViewColumn()
    }
    
    func testAssignsDragState() {
        let stateType:DragStateFixed.Type? = self.view.dragState as? DragStateFixed.Type
        XCTAssertNotNil(stateType, "Invalid state type")
    }
    
    func testTriggerAction() {
        var called:Bool = false
        let canvas:MockCanvasEditorProtocol = MockCanvasEditorProtocol()
        canvas.onEditColumnWithIdentifier = {
            called = true
        }
        
        self.view.triggerAction(canvas:canvas)
        XCTAssertTrue(called, "Not called")
    }
}
