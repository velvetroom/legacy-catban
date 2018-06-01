import XCTest
import Board
@testable import Repository

class TestDeserialise:XCTestCase {
    private var model:Deserialise!
    private var board:Data!
    private var project:Data!
    private var emptyObject:Data!
    private var emptyFile:Data!
    private struct Constants {
        static let board:String = "Board"
        static let project:String = "Project"
        static let emptyObject:String = "EmptyObject"
        static let emptyFile:String = "EmptyFile"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Deserialise()
        self.board = FileLoader.load(fileNamed:Constants.board)
        self.project = FileLoader.load(fileNamed:Constants.project)
        self.emptyObject = FileLoader.load(fileNamed:Constants.emptyObject)
        self.emptyFile = FileLoader.load(fileNamed:Constants.emptyFile)
    }
    
    func testMakeBoard() {
        self.model.data = self.board
        var board:BoardProtocol!
        XCTAssertNoThrow(board = try self.model.makeBoard(), "Error making board")
        XCTAssertNotNil(board, "Board not found")
        XCTAssertFalse(board.identifier.isEmpty, "Invalid identifier")
    }
    
    func testMakeBoardEmptyObject() {
        self.model.data = self.emptyObject
        XCTAssertThrowsError(try self.model.makeBoard(), "Should throw an error")
    }
    
    func testMakeBoardEmptyFile() {
        self.model.data = self.emptyFile
        XCTAssertThrowsError(try self.model.makeBoard(), "Should throw an error")
    }
    
    func testMakeProject() {
        self.model.data = self.project
        var project:ProjectProtocol!
        XCTAssertNoThrow(project = try self.model.makeProject(), "Error making project")
        XCTAssertNotNil(project, "Project not found")
        self.projectLoaded(project:project)
    }
    
    private func projectLoaded(project:ProjectProtocol) {
        self.validate(project:project)
        var totalCards:Int = 0
        project.iterate { (column:ColumnProtocol) in
            self.validate(column:column)
            column.iterate { (card:CardProtocol) in
                self.validate(card:card)
                totalCards += 1
            }
        }
        XCTAssertEqual(project.countColumns, 3, "Invalid")
        XCTAssertEqual(totalCards, 2, "Invalid")
    }
    
    private func validate(project:ProjectProtocol) {
        XCTAssertFalse(project.identifier.isEmpty, "Invalid")
        XCTAssertEqual(project.name, "test project", "Invalid")
        XCTAssertGreaterThan(project.created, 0, "Invalid")
    }
    
    private func validate(column:ColumnProtocol) {
        XCTAssertFalse(column.identifier.isEmpty, "Invalid")
        XCTAssertFalse(column.name.isEmpty, "Invalid")
        XCTAssertGreaterThan(column.created, 0, "Invalid")
    }
    
    private func validate(card:CardProtocol) {
        XCTAssertFalse(card.identifier.isEmpty, "Invalid")
        XCTAssertFalse(card.content.isEmpty, "Invalid")
        XCTAssertGreaterThan(card.created, 0, "Invalid")
    }
}
