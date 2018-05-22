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
    
    func testDragUpdateRefreshTouch() {
        let touch:CGPoint = CGPoint(x:98, y:97)
        self.model.latestTouch = touch
        self.model.dragUpdate()
        XCTAssertEqual(self.model.position.latestTouch, touch, "Not updated")
    }
    
    func testDragUpdateCallsState() {
        var called:Bool = false
        self.model.state = self.state
        self.state.onUpdate = {
            called = true
        }
        
        self.model.dragUpdate()
        XCTAssertTrue(called, "Not called")
    }
    
    func testDragEndsCallsState() {
        var called:Bool = false
        self.model.state = self.state
        self.state.onEnd = {
            called = true
        }
        
        self.model.dragEnd()
        XCTAssertTrue(called, "Not called")
    }
    
    func testRestart() {
        let itemPosition:CGPoint = CGPoint(x:10, y:10)
        let latestTouch:CGPoint = CGPoint(x:345, y:678)
        self.layout.constant = itemPosition.x
        self.model.latestTouch = latestTouch
        
        self.model.dragBegin()
        XCTAssertEqual(self.model.position.initialItem, itemPosition, "Not updated")
        XCTAssertEqual(self.model.position.initialTouch, latestTouch, "Not updated")
        XCTAssertEqual(self.model.position.latestTouch, latestTouch, "Not updated")
    }
}
