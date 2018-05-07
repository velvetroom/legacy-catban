import XCTest
@testable import Board

class TestBoardFactory:XCTestCase {
    private struct Constants {
        static let countProjects:Int = 1
        static let countColumns:Int = 3
    }
    
    func testFactory() {
        let board:BoardProtocol = BoardFactory.newBoard()
        XCTAssertFalse(board.identifier.isEmpty, "Failed to assign identifier")
    }
    
    func testBlankBoardNoIdentifier() {
        let board:BoardProtocol = BoardFactory.blankBoard()
        XCTAssertTrue(board.identifier.isEmpty, "Identifier should be empty")
    }
    
    func testBlankBoardNoProjects() {
        let board:BoardProtocol = BoardFactory.blankBoard()
        XCTAssertEqual(board.countProjects, 0, "There should be no projects on blank board")
    }
    
    func testKanbanBoardProjects() {
        let board:BoardProtocol = BoardFactory.newKanbanBoard()
        XCTAssertEqual(board.countProjects, Constants.countProjects, "Board should have only 1 project")
    }
    
    func testKanbanBoardColumns() {
        let board:BoardProtocol = BoardFactory.newKanbanBoard()
        let project:ProjectProtocol = board.projectAt(index:0)
        XCTAssertEqual(project.countColumns, Constants.countColumns, "Invalid number of columns")
    }
}
