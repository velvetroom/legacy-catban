import XCTest
@testable import catban

class TestRepositoryLocal_SaveBoard:XCTestCase {
    private var model:RepositoryLocal!
    private var serialiser:MockSerialiserProtocol!
    private var file:MockFileProtocol!
    private var board:Board!
    private var project:Project!
    private var data:Data!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let identifier:String = "loremipsum"
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
        self.data = Data()
        self.project.identifier = Constants.identifier
        self.model.file = self.file
        self.model.serialiser = self.serialiser
        self.serialiser.returnSerialisedData = self.data
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.file, "Failed to load file")
        XCTAssertNotNil(self.board, "Failed to load board")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.data, "Failed to load data")
    }
    
    func testNoThrow() {
        XCTAssertNoThrow(try self.model.save(board:self.board))
    }
    
    func testFileIsCalledForUser() {
        self.startExpectation()
        self.file.onSaveUser = { [weak self] (user:Data) in
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    func testSerialiserIsCalledForUser() {
        self.startExpectation()
        self.serialiser.onSerialiserUser = { [weak self] (user:UserProtocol) in
            let user:User? = user as? User
            let boardUser:User? = self?.board.user as? User
            XCTAssertNotNil(user, "Invalid user sent to save")
            XCTAssertTrue(user === boardUser, "Trying to save invalid user")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    func testCompareDataForUser() {
        self.startExpectation()
        self.file.onSaveUser = { [weak self] (user:Data) in
            XCTAssertTrue(self?.data == user, "Invalid data received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    func testFileIsCalledForProjects() {
        self.startExpectation()
        self.file.onSaveProject = { [weak self] (project:Data, identifier:String) in
            XCTAssertEqual(Constants.identifier, identifier, "Invalid identifier")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    func testSerialiserIsCalledForProject() {
        self.startExpectation()
        self.serialiser.onSerialiserProject = { [weak self] (project:ProjectProtocol) in
            let project:Project? = project as? Project
            XCTAssertNotNil(project, "Invalid project sent to save")
            XCTAssertTrue(project === self?.project, "Trying to save invalid project")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    func testCompareDataForProject() {
        self.startExpectation()
        self.file.onSaveProject = { [weak self] (project:Data, identifier:String) in
            XCTAssertTrue(self?.data == project, "Invalid data received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    func testSaveBoardClearsProject() {
        self.startExpectation()
        self.file.onClearProjects = { [weak self] in
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(board:self.board) } catch { }
        
        self.waitExpectations()
    }
    
    func testSaveBoardCreatedDirectoriesAfterClearProjects() {
        self.startExpectation()
        self.file.onCreateDirectories = { [weak self] in
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
