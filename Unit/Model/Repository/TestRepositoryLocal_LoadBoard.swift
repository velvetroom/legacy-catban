import XCTest
@testable import catban

class TestRepositoryLocal_LoadBoard:XCTestCase {
    private var model:RepositoryLocal!
    private var file:MockFileProtocol!
    private var deserialiser:MockDeserialiserProtocol!
    private var user:User!
    private var project:Project!
    private struct Constants {
        static let projectIdentifier:String = "fenktj342423"
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
}
