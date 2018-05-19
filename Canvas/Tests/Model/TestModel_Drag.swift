import XCTest
@testable import Canvas

class TestModel_Drag:XCTestCase {
    private var model:Model!
    private var viewItem:MockViewItem!
    private var mapItem:MapItemProtocol!
    private var layout:NSLayoutConstraint!
    private var state:MockDragStateProtocol!
    
    override func setUp() {
        super.setUp()
        self.model = Model()
        self.viewItem = MockViewItem()
        self.mapItem = MapCard()
        self.layout = NSLayoutConstraint()
        self.state = MockDragStateProtocol()
        self.viewItem.dragState = MockDragStateProtocol.self
        self.viewItem.mapItem = self.mapItem
        self.mapItem.view = self.viewItem
        self.model.viewItem = self.viewItem
        self.viewItem.layoutWidth = self.layout
        self.viewItem.layoutHeight = self.layout
        self.viewItem.layoutLeft = self.layout
        self.viewItem.layoutTop = self.layout
    }
    
    func testDragBeginLoadsMapItem() {
        self.model.dragBegin()
        XCTAssertNotNil(self.model.mapItem, "Failed to assign map item")
    }
    
    func testDragBeginRestartsPosition() {
        let point:CGPoint = CGPoint(x:123, y:345)
        self.model.latestTouch = point
        self.model.dragBegin()
        XCTAssertEqual(self.model.position.initialTouch, point, "Not restarted")
    }
    
    func testDragBeginChangesState() {
        self.model.dragBegin()
        let state:MockDragStateProtocol? = self.model.state as? MockDragStateProtocol
        XCTAssertNotNil(state, "State not changed")
    }
    
    func testDragBeginHighlightsView() {
        var called:Bool = false
        self.viewItem.onStateHighlighted = {
            called = true
        }
        
        self.model.dragBegin()
        XCTAssertTrue(called, "Not highlighted")
    }
}
