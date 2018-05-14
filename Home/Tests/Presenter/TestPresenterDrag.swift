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
        self.presenter.beganDragging(view:self.view, on:ViewBoard(), at:position)
        
        XCTAssertNotNil(self.presenter.strategy.initialPosition, "Position not injected")
        XCTAssertNotNil(self.presenter.strategy.controller, "Controller not injected")
        XCTAssertNotNil(self.presenter.strategy.view, "View not injected")
        XCTAssertNotNil(self.presenter.strategy.viewBoard, "Board not injected")
        XCTAssertEqual(self.presenter.strategy.initialPosition, position, "Invalid position")
    }
    
    func testStrategyType() {
        self.presenter.beganDragging(view:self.view, on:ViewBoard(), at:CGPoint.zero)
        let strategy:PresenterDragStrategyProtocol? = self.presenter.strategy as? MockPresenterDragStrategyProtocol
        XCTAssertNotNil(strategy, "Invalid strategy type")
    }
    
    func testBeganDraggingCalled() {
        self.presenter.beganDragging(view:self.view, on:ViewBoard(), at:CGPoint.zero)
        XCTAssertTrue(MockPresenterDragStrategyProtocol.beganDragging, "Not called")
    }
}
