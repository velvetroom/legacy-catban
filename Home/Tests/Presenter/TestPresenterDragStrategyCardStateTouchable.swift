import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateTouchable:XCTestCase {
    private var state:PresenterDragStrategyCardStateTouchable!
    private var strategy:PresenterDragStrategyCard!
    private var view:MockViewCard!
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        self.state = PresenterDragStrategyCardStateTouchable()
        self.strategy = PresenterDragStrategyCard()
        self.view = MockViewCard()
        self.controller = Controller()
        self.strategy.view = self.view
        self.strategy.controller = self.controller
        self.state.strategy = self.strategy
    }
    
    func testNotRetainingStrategy() {
        self.state.strategy = PresenterDragStrategyCard()
        XCTAssertNil(self.state.strategy, "It is retained")
    }
    
    func testChangeStateOnDragging() {
        self.strategy.latestPosition = CGPoint(x:PresenterConstants.Drag.minDeltaForMovement, y:1)
        self.state.moved()
        let state:PresenterDragStrategyCardStateDragging? = self.strategy.state as?
        PresenterDragStrategyCardStateDragging
        XCTAssertNotNil(state, "After movement state should change")
    }
    
    func testEndDraggingTouchesSucceded() {
        var touchesCalled:Bool = false
        self.view.onTouchSucceded = { (controller:Controller) in
            touchesCalled = true
        }
        
        self.state.endDragging()
        XCTAssertTrue(touchesCalled, "Not called")
    }
}
