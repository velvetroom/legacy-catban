import XCTest
@testable import Canvas

class TestModel_Items:XCTestCase {
    private var model:Model!
    private var mapDelegate:MockMapDelegateProtocol!
    private var projectOrder:MockProjectOrderProtocol!
    private var editor:MockCanvasEditorProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Model()
        self.mapDelegate = MockMapDelegateProtocol()
        self.projectOrder = MockProjectOrderProtocol()
        self.editor = MockCanvasEditorProtocol()
        self.model.mapDelegate = self.mapDelegate
        self.model.projectOrder = self.projectOrder
        self.model.canvas = self.editor
    }
    
    func testAddItemUpdatesSize() {
        var updates:Bool = false
        self.mapDelegate.onMapChangedSize = {
            updates = true
        }
        
        self.model.arrange(item:MapNewCard())
        XCTAssertTrue(updates, "Not updated")
    }
}
