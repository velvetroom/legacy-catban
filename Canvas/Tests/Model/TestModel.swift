import XCTest
@testable import Canvas

class TestModel:XCTestCase {
    private var model:Model!
    
    override func setUp() {
        super.setUp()
        self.model = Model()
    }
    
    func testNotRetainingCanvas() {
        self.model.canvas = MockCanvasEditorProtocol()
        XCTAssertNil(self.model.canvas, "Retains")
    }
    
    func testNotRetainingMapDelegate() {
        self.model.mapDelegate = MockMapDelegateProtocol()
        XCTAssertNil(self.model.mapDelegate, "Retains")
    }
    
    func testNotRetainingViewItem() {
        self.model.viewItem = MockViewItem()
        XCTAssertNil(self.model.viewItem, "Retains")
    }
    
    func testInitialStateIsNone() {
        let state:DragStateNone? = self.model.state as? DragStateNone
        XCTAssertNotNil(state, "Invalid state")
    }
    
    func testClearColumns() {
        self.model.columns.append(MapColumn())
        self.model.clear()
        XCTAssertTrue(self.model.columns.isEmpty, "Not clearing")
    }
    
    func testRetainsMapItem() {
        self.model.mapItem = MapCard()
        XCTAssertNotNil(self.model.mapItem, "Not retaining")
    }
}
