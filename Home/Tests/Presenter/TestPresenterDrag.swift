import XCTest
@testable import Home

class TestPresenterDrag:XCTestCase {
    private var presenter:PresenterDrag!
    private var view:MockViewBoardItem!
    private var controller:Controller!
    
    override func setUp() {
        super.setUp()
        MockPresenterDragStrategyProtocol.beganDragging = false
        self.presenter = PresenterDrag()
        self.view = MockViewBoardItem()
        self.controller = Controller()
        self.presenter.controller = self.controller
    }
    
    func testNotRatainingController() {
        self.presenter.controller = Controller()
        XCTAssertNil(self.presenter.controller, "Retains")
    }
    
    func testViewNotRetained() {
        self.presenter.view = MockViewBoardItem()
        XCTAssertNil(self.presenter.view, "Retained")
    }
    
    func testDragStart() {
        let position:CGPoint = CGPoint(x:12, y:22)
        self.presenter.beginDragging(view:self.view, on:ViewBoard(), at:position)
        
        XCTAssertNotNil(self.presenter.strategy.initialPosition, "Position not injected")
        XCTAssertNotNil(self.presenter.strategy.controller, "Controller not injected")
        XCTAssertNotNil(self.presenter.strategy.view, "View not injected")
        XCTAssertNotNil(self.presenter.strategy.viewBoard, "Board not injected")
        XCTAssertEqual(self.presenter.strategy.initialPosition, position, "Invalid position")
    }
    
    func testStrategyType() {
        self.presenter.beginDragging(view:self.view, on:ViewBoard(), at:CGPoint.zero)
        let strategy:PresenterDragStrategyProtocol? = self.presenter.strategy as? MockPresenterDragStrategyProtocol
        XCTAssertNotNil(strategy, "Invalid strategy type")
    }
    
    func testBeganDraggingCalled() {
        self.presenter.beginDragging(view:self.view, on:ViewBoard(), at:CGPoint.zero)
        XCTAssertTrue(MockPresenterDragStrategyProtocol.beganDragging, "Not called")
    }
    
    func testDragToPosition() {
        let position:CGPoint = CGPoint(x:134, y:321)
        self.presenter.strategy = MockPresenterDragStrategyProtocol()
        self.presenter.draggedTo(position:position)
        XCTAssertEqual(self.presenter.strategy.latestPosition, position, "Position not injected")
    }
    
    func testEndDragingClearsAll() {
        self.presenter.strategy = MockPresenterDragStrategyProtocol()
        self.presenter.dragEnded()
        XCTAssertNil(self.presenter.view, "Not cleared")
        XCTAssertNil(self.presenter.strategy, "Not cleared")
    }
    
    func testOnMoveCallsStrategy() {
        var called:Bool = false
        let strategy:MockPresenterDragStrategyProtocol = MockPresenterDragStrategyProtocol()
        self.presenter.strategy = strategy
        strategy.onMoved = {
            called = true
        }
        
        self.presenter.draggedTo(position:CGPoint.zero)
        XCTAssertTrue(called, "Not called")
    }
    
    func testOnEndCallsStrategy() {
        var called:Bool = false
        let strategy:MockPresenterDragStrategyProtocol = MockPresenterDragStrategyProtocol()
        self.presenter.strategy = strategy
        strategy.onEndDragging = {
            called = true
        }
        
        self.presenter.dragEnded()
        XCTAssertTrue(called, "Not called")
    }
}
