import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateDraggingAnimation:XCTestCase {
    private var animation:PresenterDragStrategyCardStateDraggingAnimation!
    
    override func setUp() {
        super.setUp()
        self.animation = PresenterDragStrategyCardStateDraggingAnimation()
    }
    
    func testNotRetainingView() {
        self.animation.view = ViewBoardItem()
        XCTAssertNil(self.animation.view, "Retains view")
    }
}
