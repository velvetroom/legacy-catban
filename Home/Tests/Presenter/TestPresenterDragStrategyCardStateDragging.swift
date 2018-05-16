import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateDragging:XCTestCase {
    private var state:PresenterDragStrategyCardStateDragging!
    private var view:MockViewBoardItem!
    private var viewBoard:ViewBoard!
    private var layoutTop:NSLayoutConstraint!
    private var layoutLeft:NSLayoutConstraint!
    private var strategy:PresenterDragStrategyCard!
    
    override func setUp() {
        super.setUp()
        self.state = PresenterDragStrategyCardStateDragging()
        self.view = MockViewBoardItem()
        self.viewBoard = ViewBoard()
        self.layoutTop = NSLayoutConstraint()
        self.layoutLeft = NSLayoutConstraint()
        self.view.layoutTop = self.layoutTop
        self.view.layoutLeft = self.layoutLeft
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
        XCTAssertNotNil(self.state.view.view, "Not assigned")
    }
}
