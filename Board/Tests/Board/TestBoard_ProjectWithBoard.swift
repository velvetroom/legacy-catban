import XCTest
@testable import Board

class TestBoard_ProjectWithBoard:XCTestCase {
    private var board:BoardProtocol!
    private var project:ProjectProtocol!
    
    override func setUp() {
        super.setUp()
        self.board = BoardFactory.newBoard()
        self.project = ProjectFactory.newProject()
    }
    
    func testAddProjectInjectsReferenceToBoard() {
        self.board.add(project:self.project)
        XCTAssertNotNil(self.project.board, "Failed to inject board")
    }
    
    func testRemoveProjectRemovesReferenceToBoard() {
        self.board.add(project:self.project)
        XCTAssertNotNil(self.project.board, "Board not contained")
        self.board.remove(project:self.project)
        XCTAssertNil(self.project.board, "Failed to remove reference to board")
    }
}
