import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateDraggingView:XCTestCase {
    private var animation:PresenterDragStrategyCardStateDraggingView!
    
    override func setUp() {
        super.setUp()
        self.animation = PresenterDragStrategyCardStateDraggingView()
    }
    
    func testNotRetainingView() {
        self.animation.view = ViewBoardItem()
        XCTAssertNil(self.animation.view, "Retains view")
    }
}
