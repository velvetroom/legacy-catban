import XCTest
@testable import catban

class TestRepository_LocalDeleteProject:XCTestCase {
    private var model:Repository!
    private var local:MockRepositoryLocalProtocol!
    private var project:Project!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Repository()
        self.local = MockRepositoryLocalProtocol()
        self.project = Project()
        self.model.local = self.local
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.local, "Failed to load local")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testLocalDeleteCallsLocal() {
        self.startExpectation()
        self.local.onDeleteProject = { [weak self] (project:ProjectProtocol) in
            let project:Project = project as! Project
            XCTAssertTrue(self?.project === project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.delete(project:self.project) } catch { }
        
        self.waitExpectation()
    }
    
    func testNoThrows() {
        XCTAssertNoThrow(try self.model.delete(project:self.project), "Failed deleting project")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
