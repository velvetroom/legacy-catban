import XCTest
@testable import Home

class TestPresenterDragStrategyCardStateDraggingBoard:XCTestCase {
    private var board:PresenterDragStrategyCardStateDraggingBoard!
    
    override func setUp() {
        super.setUp()
        self.board = PresenterDragStrategyCardStateDraggingBoard()
    }
    
    func testNotRetainsViewBoard() {
        self.board.viewBoard = ViewBoard()
        XCTAssertNil(self.board.viewBoard, "Retaining view")
    }
    
    func testNotRetainsView() {
        self.board.view = ViewBoardItem()
        XCTAssertNil(self.board.view, "Retaining view")
    }
}
