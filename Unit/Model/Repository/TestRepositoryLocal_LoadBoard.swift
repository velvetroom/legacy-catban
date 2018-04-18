import XCTest
@testable import catban

class TestRepositoryLocal_LoadBoard:XCTestCase {
    private var model:RepositoryLocal!
    private var file:MockFileProtocol!
    private var deserialiser:MockDeserialiserProtocol!
    private var user:User!
    private var project:Project!
    
    override func setUp() {
        super.setUp()
        self.model = RepositoryLocal()
        self.file = MockFileProtocol()
        self.deserialiser = MockDeserialiserProtocol()
        self.user = User()
        self.project = Project()
        self.model.file = self.file
        self.model.deserialiser = self.deserialiser
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.file, "Failed to load file")
        XCTAssertNotNil(self.deserialiser, "Failed to load deserialiser")
        XCTAssertNotNil(self.user, "Failed to load user")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testLoadBoardHappyPath() {
        XCTAssertNoThrow(try self.model.loadBoard(), "Failed to load board")
    }
}
