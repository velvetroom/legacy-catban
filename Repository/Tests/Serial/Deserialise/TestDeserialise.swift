import XCTest
import Board
@testable import Repository

class TestDeserialise:XCTestCase {
    private var model:Deserialise!
    private var data:Data!
    private var emptyObject:Data!
    private var emptyFile:Data!
    private struct Constants {
        static let data:String = "Board"
        static let emptyObject:String = "EmptyObject"
        static let emptyFile:String = "EmptyFile"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Deserialise()
        self.data = FileLoader.load(fileNamed:Constants.data)
        self.emptyObject = FileLoader.load(fileNamed:Constants.emptyObject)
        self.emptyFile = FileLoader.load(fileNamed:Constants.emptyFile)
    }
    
    func testMakeBoard() {
        self.model.data = self.data
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
}
