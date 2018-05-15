import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateDraggingBoard:XCTestCase {
    private var board:PresenterDragStrategyCardStateDraggingBoard!
    
    override func setUp() {
        super.setUp()
        self.board = PresenterDragStrategyCardStateDraggingBoard()
    }
    
    func testNotRetainsView() {
        self.board.view = ViewBoard()
        XCTAssertNil(self.board.view, "Retaining view")
    }
}
