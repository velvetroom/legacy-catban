import XCTest
import Shared
import Board
@testable import Repository

class TestRepository:XCTestCase {
    private var model:Repository!
    private struct Constants {
        static let projectFileName:String = "242341.catban"
        static let fileBoard:String = "Board"
        static let fileProject:String = "Project"
    }
    
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
        self.model = Repository()
        do { try self.model.file.buildStructure() } catch { }
    }
    
    override func tearDown() {
        super.tearDown()
        self.model.file.delete()
    }
    
    func testLoadBoard() {
        self.saveMockBoard()
        var board:BoardProtocol!
        XCTAssertNoThrow(board = try self.model.loadBoard(), "Failed to load board")
        XCTAssertNotNil(board, "Failed to load board")
        XCTAssertFalse(board.identifier.isEmpty, "Invalid identifier")
        XCTAssertEqual(board.countProjects, 0, "Should have no projects")
    }
    
    func testLoadBoardThrows() {
        XCTAssertThrowsError(try self.model.loadBoard(), "Should throw")
    }
    
    func testLoadBoardWithProjects() {
        self.saveMockBoard()
        self.saveProject()
        var board:BoardProtocol!
        XCTAssertNoThrow(board = try self.model.loadBoard(), "Failed to load board")
        XCTAssertNotNil(board, "Board not found")
        XCTAssertEqual(board.countProjects, 1, "Should have 1 project")
        XCTAssertFalse(board.firstProject!.identifier.isEmpty, "Invalid identifier")
    }
    
    func testDeleteProject() {
        let expect:XCTestExpectation = expectation(description:"Waiting for delete")
        let project:ProjectProtocol = ProjectFactory.newProject()
        let file:MockRepositoryFile = MockRepositoryFile()
        file.onDeleteProject = { (identifier:String) in
            XCTAssertEqual(project.identifier, identifier, "Invalid identifier")
            expect.fulfill()
        }
        
        self.performDelete(project:project, file:file)
        waitForExpectations(timeout:0.3) { (error:Error?) in }
    }
    
    private func saveMockBoard() {
        let data:Data = FileLoader.load(fileNamed:Constants.fileBoard)
        self.write(data:data, to:self.model.file.url.boardUrl)
    }
    
    private func saveProject() {
        let data:Data = FileLoader.load(fileNamed:Constants.fileProject)
        let url:URL = self.model.file.url.projectsUrl.appendingPathComponent(Constants.projectFileName)
        self.write(data:data, to:url)
    }
    
    private func performDelete(project:ProjectProtocol, file:RepositoryFile) {
        let model:Repository = Repository()
        model.file = file
        model.localDelete(project:project)
    }
    
    private func write(data:Data, to url:URL) {
        XCTAssertNoThrow(try data.write(to:url), "Failed to write")
    }
}
