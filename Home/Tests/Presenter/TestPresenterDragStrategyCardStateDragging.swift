import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateDragging:XCTestCase {
    private var state:PresenterDragStrategyCardStateDragging!
    private var view:MockViewBoardItem!
    private var viewBoard:ViewBoard!
    private var strategy:PresenterDragStrategyCard!
    
    override func setUp() {
        super.setUp()
        self.state = PresenterDragStrategyCardStateDragging()
        self.view = MockViewBoardItem()
        self.viewBoard = ViewBoard()
        self.strategy = PresenterDragStrategyCard()
        self.strategy.view = self.view
        self.strategy.viewBoard = self.viewBoard
    }
    
    func testNotRetainingStrategy() {
        self.state.strategy = PresenterDragStrategyCard()
        XCTAssertNil(self.state.strategy, "It is retained")
    }
    
    func testAssignsViewToAnimate() {
        self.state.strategy = self.strategy
        XCTAssertNotNil(self.state.animation.view, "Not assigned")
    }
    
    func testAssignsViewToMover() {
        self.state.strategy = self.strategy
        XCTAssertNotNil(self.state.mover.view, "Not assigned")
    }
}
