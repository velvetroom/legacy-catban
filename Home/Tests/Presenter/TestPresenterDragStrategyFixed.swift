import XCTest
@testable import Home

class TestPresenterDragStrategyFixed:XCTestCase {
    private var strategy:PresenterDragStrategyFixed!
    private var view:MockViewBoardItem!
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        self.strategy = PresenterDragStrategyFixed()
        self.view = MockViewBoardItem()
        self.controller = Controller()
        self.strategy.controller = self.controller
        self.strategy.view = self.view
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
    
    func testReleaseViewOnMoving() {
        XCTAssertNotNil(self.strategy.view, "View not set")
        self.strategy.latestPosition = CGPoint(x:PresenterConstants.Drag.minDeltaForMovement, y:1)
        self.strategy.moved()
        XCTAssertNil(self.strategy.view, "View not released")
    }
    
    func testDragEndCallsTouchSucceded() {
        var called:Bool = false
        self.view.onTouchSucceded = { (controller:Controller) in
            called = true
        }
        
        self.strategy.endDragging()
        XCTAssertTrue(called, "Not called")
    }
}
