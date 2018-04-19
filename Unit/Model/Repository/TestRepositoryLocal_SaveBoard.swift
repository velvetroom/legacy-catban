import XCTest
@testable import catban

class TestRepositoryLocal_SaveBoard:XCTestCase {
    private var model:RepositoryLocal!
    private var serialiser:MockSerialiserProtocol!
    private var file:MockFileProtocol!
    private var board:Board!
    private var project:Project!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = RepositoryLocal()
        self.file = MockFileProtocol()
        self.board = Board()
        self.project = Project()
        self.serialiser = MockSerialiserProtocol()
        self.board.projects = [self.project]
        self.model.file = self.file
        self.model.serialiser = self.serialiser
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.file, "Failed to load file")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testNoThrow() {
        XCTAssertNoThrow(try self.model.save(board:self.board))
    }
    
    func testSaveUserIsCalled() {
        self.startExpectation()
        self.file.onSaveUser = { [weak self] (user:UserProtocol) in
            let user:User? = user as? User
            let boardUser:User? = self?.board.user as? User
            XCTAssertNotNil(user, "Invalid user sent to save")
            XCTAssertTrue(user === boardUser, "Trying to save invalid user")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    func testSaveProjectsIsCalled() {
        self.startExpectation()
        self.file.onSaveProjects = { [weak self] (projects:[ProjectProtocol]) in
            let firstProject:Project? = projects.first as? Project
            XCTAssertNotNil(firstProject, "Invalid projects sent to save")
            XCTAssertTrue(firstProject === self?.project, "Trying to save invalid projects")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
