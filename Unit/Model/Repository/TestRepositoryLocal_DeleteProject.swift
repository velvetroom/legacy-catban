import XCTest
@testable import catban

class TestRepositoryLocal_DeleteProject:XCTestCase {
    private var model:RepositoryLocal!
    private var file:MockFileProtocol!
    private var project:Project!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let identifier:String = "231212"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = RepositoryLocal()
        self.file = MockFileProtocol()
        self.project = Project()
        self.model.file = self.file
        self.project.identifier = Constants.identifier
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.file, "Failed to load file")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testNoThrows() {
        XCTAssertNoThrow(try self.model.delete(project:self.project), "Failed to delete project")
    }
    
    func testDeleteProjectCallsFile() {
        self.startExpectation()
        self.file.onDeleteProjectWithIdentifier = { [weak self] (identifier:String) in
            XCTAssertEqual(identifier, Constants.identifier, "Invalid identifier received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.delete(project:self.project) } catch { }
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
