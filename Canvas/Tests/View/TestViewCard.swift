import XCTest
@testable import Canvas

class TestViewCard:XCTestCase {
    private var view:ViewCard!
    
    override func setUp() {
        super.setUp()
        self.view = ViewCard()
    }
    
    func testAssignsDragState() {
        let stateType:DragStateDynamic.Type? = self.view.dragState as? DragStateDynamic.Type
        XCTAssertNotNil(stateType, "Invalid state type")
    }
}
