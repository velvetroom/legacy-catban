import XCTest
@testable import catban

class TestRepositoryLocal_LoadBoard:XCTestCase {
    private var model:RepositoryLocal!
    private var file:MockFileProtocol!
    private var deserialiser:MockDeserialiserProtocol!
    private var user:User!
    private var project:Project!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let userIdentifier:String = "iounjkfds"
        static let projectIdentifier:String = "fenktj342423"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = RepositoryLocal()
        self.file = MockFileProtocol()
        self.deserialiser = MockDeserialiserProtocol()
        self.user = User()
        self.project = Project()
        self.model.file = self.file
        self.model.deserialiser = self.deserialiser
        self.user.identifier = Constants.userIdentifier
        self.project.identifier = Constants.projectIdentifier
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.file, "Failed to load file")
        XCTAssertNotNil(self.deserialiser, "Failed to load deserialiser")
        XCTAssertNotNil(self.user, "Failed to load user")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testLoadBoardHappyPath() {
        self.user.project = self.project
        self.deserialiser.user = self.user
        self.deserialiser.project = self.project
        
        XCTAssertNoThrow(try self.model.loadBoard(), "Failed to load board")
    }
    
    func testLoadBoardValid() {
        self.user.project = self.project
        self.deserialiser.user = self.user
        self.deserialiser.project = self.project
        
        let board:BoardProtocol
        do {
            try board = self.model.loadBoard()
        } catch { return }
        
        XCTAssertEqual(board.user.identifier, Constants.userIdentifier, "Invalid user in board")
        XCTAssertEqual(board.project.identifier, Constants.projectIdentifier, "Invalid project in board")
        XCTAssertEqual(board.projects.first?.identifier, Constants.projectIdentifier, "Invalid projects in board")
        XCTAssertEqual(board.projects.count, 1, "Invalid amount of projects")
    }
    
    func testLoadBoardThrows() {
        self.deserialiser.user = self.user
        self.deserialiser.project = self.project
        
        XCTAssertThrowsError(try self.model.loadBoard(), "Failed to throw error")
    }
    
    func testLoadUserCallsFile() {
        self.startExpectation()
        self.file.onLoadUser = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNoThrow(try self.model.loadUser(), "Failed to load user")
        
        self.waitExpectations()
    }
    
    func testLoadUserCallsDeserialiser() {
        self.startExpectation()
        self.deserialiser.onDeserialiseUser = { [weak self] (data:Data) in
            self?.expect?.fulfill()
        }
        
        XCTAssertNoThrow(try self.model.loadUser(), "Failed to load user")
        
        self.waitExpectations()
    }
    
    func testLoadProjectsCallsFile() {
        self.startExpectation()
        self.file.onLoadProjects = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNoThrow(try self.model.loadProjects(), "Failed to load projects")
        
        self.waitExpectations()
    }
    
    func testLoadProjectsCallsDeserialiser() {
        self.startExpectation()
        self.deserialiser.onDeserialiseProject = { [weak self] (data:Data) in
            self?.expect?.fulfill()
        }
        
        XCTAssertNoThrow(try self.model.loadProjects(), "Failed to load projects")
        
        self.waitExpectations()
    }
    
    func testFindProjectSuccess() {
        self.user.project = self.project
        let project:Project?
        do {
            try project = self.model.findProjectFor(user:self.user, in:[self.project]) as? Project
        } catch {
            project = nil
        }
        XCTAssertNotNil(project, "Failed to find project")
        XCTAssertTrue(project === self.project, "Invalid project returned")
    }
    
    func testFindProjectNoThrows() {
        self.user.project = self.project
        XCTAssertNoThrow(try self.model.findProjectFor(user:self.user, in:[self.project]), "Failed to find project")
    }
    
    func testFindProjectThrows() {
        XCTAssertThrowsError(try self.model.findProjectFor(user:self.user, in:[self.project]),
                             "Invalid project returned")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
