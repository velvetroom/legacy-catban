import XCTest
@testable import catban

class TestRepositoryLocal_Save:XCTestCase {
    private var model:RepositoryLocal!
    private var serialiser:MockSerialiserProtocol!
    private var file:MockFileProtocol!
    private var project:Project!
    private var user:User!
    private var data:Data!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let identifier:String = "lorem ipsum"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = RepositoryLocal()
        self.project = Project()
        self.user = User()
        self.file = MockFileProtocol()
        self.serialiser = MockSerialiserProtocol()
        self.data = Data()
        self.project.identifier = Constants.identifier
        self.model.file = self.file
        self.model.serialiser = self.serialiser
        self.serialiser.returnSerialisedData = self.data
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.file, "Failed to load file")
        XCTAssertNotNil(self.serialiser, "Failed to load serialiser")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.user, "Failed to load user")
        XCTAssertNotNil(self.data, "Failed to load data")
    }
    
    func testProjectNoThrow() {
        XCTAssertNoThrow(try self.model.save(project:self.project))
    }
    
    func testUserNoThrow() {
        XCTAssertNoThrow(try self.model.save(user:self.user))
    }
    
    func testSaveProject() {
        self.startExpectation()
        self.file.onSaveProject = { [weak self] (project:Data, identifier:String) in
            XCTAssertEqual(identifier, Constants.identifier, "Invalid identifier")
            XCTAssertTrue(self?.data == project, "Invalid data received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(project:self.project) } catch { }
        
        self.waitExpectations()
    }
    
    func testSaveUser() {
        self.startExpectation()
        self.file.onSaveUser = { [weak self] (user:Data) in
            XCTAssertTrue(self?.data == user, "Invalid data received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(user:self.user) } catch { }
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
