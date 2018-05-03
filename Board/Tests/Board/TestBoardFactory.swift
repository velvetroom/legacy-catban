import XCTest
@testable import Board

class TestBoardFactory:XCTestCase {
    func testFactory() {
        let board:BoardProtocol = BoardFactory.newBoard()
        XCTAssertFalse(board.identifier.isEmpty, "Failed to assign identifier")
    }
}
