import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateDraggingView:XCTestCase {
    private var presenter:PresenterDragStrategyCardStateDraggingView!
    private var view:ViewBoardItem!
    private var layoutTop:NSLayoutConstraint!
    private var layoutLeft:NSLayoutConstraint!
    
    override func setUp() {
        super.setUp()
        self.view = ViewBoardItem()
        self.layoutTop = NSLayoutConstraint()
        self.layoutLeft = NSLayoutConstraint()
        self.view.layoutTop = self.layoutTop
        self.view.layoutLeft = self.layoutLeft
        self.presenter = PresenterDragStrategyCardStateDraggingView()
    }
    
    func testNotRetainingView() {
        self.presenter.view = self.view
        XCTAssertNil(self.presenter.view, "Retains view")
    }
}
