import XCTest
@testable import Home
@testable import Board

class TestViewCard:XCTestCase {
    private var view:ViewCard!
    private var controller:MockController!
    
    override func setUp() {
        super.setUp()
        self.view = ViewCard()
        self.controller = MockController()
    }
    
    func testSucceded() {
        var called:Bool = false
        self.controller.onEditCardWith = { (identifier:String) in
            called = true
        }
        
        self.view.triggerAction(controller:self.controller)
        XCTAssertTrue(called, "Failed to call")
    }
    
    func testDragState() {
        let state:DragStateDynamic.Type? = self.view.dragState as? DragStateDynamic.Type
        XCTAssertNotNil(state, "Invalid state")
    }
}
