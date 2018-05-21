import XCTest
@testable import Canvas

class TestViewNewCard:XCTestCase {
    private var view:ViewNewCard!
    
    override func setUp() {
        super.setUp()
        self.view = ViewNewCard()
    }
    
    func testAssignsDragState() {
        let stateType:DragStateFixed.Type? = self.view.dragState as? DragStateFixed.Type
        XCTAssertNotNil(stateType, "Invalid state type")
    }
    
    func testTriggerAction() {
        var called:Bool = false
        let canvas:MockCanvasEditorProtocol = MockCanvasEditorProtocol()
        canvas.onCreateNewCard = {
            called = true
        }
        
        self.view.triggerAction(canvas:canvas)
        XCTAssertTrue(called, "Not called")
    }
}
