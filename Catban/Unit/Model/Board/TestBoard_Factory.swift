import XCTest
@testable import catban

class TestBoard_Factory:XCTestCase {
    private var board:BoardProtocol!
    
    override func setUp() {
        super.setUp()
        self.board = Board.factoryNewBoard()
    }
    
    func testNewBoardHasProjects() {
        XCTAssertFalse(self.board.projects.isEmpty, "Failed to factory Projects for new Board")
    }
    
    func testNewBoardHasColumns() {
        let project:ProjectProtocol = self.board.projects.first!
        XCTAssertFalse(project.columns.isEmpty, "Failed to factory Columns for new Board")
    }
    
    func testNewBoardHasCards() {
        let column:ProjectColumn = self.board.projects.first!.columns.first!
        XCTAssertFalse(column.cards.isEmpty, "Failed to factory Cards for new Board")
    }
    
    func testNewBoardHasUserWithIdentifier() {
        XCTAssertFalse(self.board.user.identifier.isEmpty, "User has empty identifier")
    }
    
    func testNewBoardUserHasFirstProjectAsCurrent() {
        XCTAssertTrue(self.board.user.project.identifier == self.board.projects.first?.identifier,
                      "Invalid current project")
    }
}
