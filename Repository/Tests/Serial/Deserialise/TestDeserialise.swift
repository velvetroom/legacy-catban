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
        XCTAssertFalse(project.identifier.isEmpty, "Invalid")
        XCTAssertEqual(project.name, "test project", "Invalid")
    }
}
