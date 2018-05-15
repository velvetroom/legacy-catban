import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateDraggingMover:XCTestCase {
    private var mover:PresenterDragStrategyCardStateDraggingMover!
    
    override func setUp() {
        super.setUp()
        self.mover = PresenterDragStrategyCardStateDraggingMover()
    }
    
    func testNotRetainingView() {
        self.mover.view = ViewBoardItem()
        XCTAssertNil(self.mover.view, "Retains view")
    }
}
