import XCTest
import Shared
@testable import Canvas

class TestViewNewColumn:XCTestCase {
    private var view:ViewNewColumn!
    
    override func setUp() {
        super.setUp()
        self.view = ViewNewColumn()
    }
    
    func testAssignsDragState() {
        let stateType:DragStateFixed.Type? = self.view.dragState as? DragStateFixed.Type
        XCTAssertNotNil(stateType, "Invalid state type")
    }
    
    func testTriggerAction() {
        var called:Bool = false
        let canvas:MockCanvasEditorProtocol = MockCanvasEditorProtocol()
        canvas.onCreateNewColumn = {
            called = true
        }
        
        self.view.triggerAction(canvas:canvas)
        XCTAssertTrue(called, "Not called")
    }
    
    func testImage() {
        let image:UIImage? = UIImage(name:Constants.NewColumn.icon, in:ViewNewColumn.self)
        XCTAssertNotNil(image, "Image not found")
    }
}
