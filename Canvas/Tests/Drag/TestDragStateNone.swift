import XCTest
@testable import Canvas

class TestDragStateNone:XCTestCase {
    private var model:DragStateNone!
    
    override func setUp() {
        super.setUp()
        self.model = DragStateNone()
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
}
