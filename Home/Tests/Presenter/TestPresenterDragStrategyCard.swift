import XCTest
@testable import Home

class TestPresenterDragStrategyCard:XCTestCase {
    private var strategy:PresenterDragStrategyCard!
    private var state:MockPresenterDragStrategyCardStateProtocol!
    
    override func setUp() {
        super.setUp()
        self.strategy = PresenterDragStrategyCard()
        self.state = MockPresenterDragStrategyCardStateProtocol()
    }
    
    func testInitialState() {
        let state:PresenterDragStrategyCardStateTouchable? = self.strategy.state as?
        PresenterDragStrategyCardStateTouchable
        XCTAssertNotNil(state, "Initial state should be touchable")
    }
    
    func testInjectsItselfToState() {
        XCTAssertNotNil(self.strategy.state.strategy, "Not injected")
    }
    
    func testDraggingDetectedChangesState() {
        self.strategy.draggingDetected()
        let state:PresenterDragStrategyCardStateDragging? = self.strategy.state as?
        PresenterDragStrategyCardStateDragging
        XCTAssertNotNil(state, "State should be dragging")
    }
    
    func testDraggingDetectedInjectsItselfOnNewState() {
        self.strategy.draggingDetected()
        XCTAssertNotNil(self.strategy.state.strategy, "Not injected")
    }
    
    func testNotRetainsController() {
        self.strategy.controller = Controller()
        XCTAssertNil(self.strategy.controller, "Retains")
    }
    
    func testNotRetainsView() {
        self.strategy.view = ViewCard()
        XCTAssertNil(self.strategy.view, "Retains")
    }
    
    func testNotRetainsBoard() {
        self.strategy.viewBoard = ViewBoard()
        XCTAssertNil(self.strategy.viewBoard, "Retains")
    }
    
    func testMovingCallsState() {
        var called:Bool = false
        self.strategy.state = self.state
        self.state.onMoved = {
            called = true
        }
        
        self.strategy.moved()
        XCTAssertTrue(called, "Not called")
    }
    
    func testEndDraggingCallsState() {
        var called:Bool = false
        self.strategy.state = self.state
        self.state.onEndDragging = {
            called = true
        }
        
        self.strategy.endDragging()
        XCTAssertTrue(called, "Not called")
    }
}
