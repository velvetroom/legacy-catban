import XCTest
import Shared
import Board
@testable import Repository

class TestRepository_Save:XCTestCase {
    private var board:BoardProtocol!
    private var project:ProjectProtocol!
    private struct Constants {
        static let fileBoard:String = "Board"
        static let fileProject:String = "Project"
    }
    
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
        self.board = BoardFactory.newBoard()
        self.project = ProjectFactory.newProject()
        self.board.add(project:self.project)
    }
    
    override func tearDown() {
        super.tearDown()
        let repository:Repository = Repository()
        repository.file.delete()
    }
    
    func testSaveBoard() {
        let expect:XCTestExpectation = expectation(description:"Wait for saving")
        self.saveBoard()
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.3) {
            expect.fulfill()
        }
        
        waitForExpectations(timeout:0.4) { [weak self] (error:Error?) in
            self?.validateBoard()
        }
    }
    
    func testSaveProject() {
        let expect:XCTestExpectation = expectation(description:"Wait for saving")
        self.saveProject()
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.3) {
            expect.fulfill()
        }
        
        waitForExpectations(timeout:0.4) { [weak self] (error:Error?) in
            self?.validateProject()
        }
    }
    
    private func saveBoard() {
        let repository:Repository = Repository()
        do { try repository.file.buildStructure() } catch { }
        repository.save(board:self.board)
    }
    
    private func saveProject() {
        let repository:Repository = Repository()
        do { try repository.file.buildStructure() } catch { }
        repository.save(project:self.project)
    }
    
    private func validateBoard() {
        let repository:Repository = Repository()
        let boardPath:String = repository.file.url.boardUrl.path
        XCTAssertTrue(FileManager.default.fileExists(atPath:boardPath), "Failed to save")
    }
    
    private func validateProject() {
        let repository:Repository = Repository()
        let projectPath:String = repository.file.url.projectsUrl.appendingPathComponent(
            self.project.identifier).appendingPathExtension(RepositoryConstants.Url.fileExtension).path
        XCTAssertTrue(FileManager.default.fileExists(atPath:projectPath), "Failed to save")
    }
}
