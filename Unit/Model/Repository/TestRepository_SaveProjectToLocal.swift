import XCTest
@testable import catban

class TestRepository_SaveProjectToLocal:XCTestCase {
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
    
    func testSaveProjectToLocal() {
        self.startExpectation()
        self.local.onSaveProject = { [weak self] (project:ProjectProtocol) in
            let project:Project = project as! Project
            XCTAssertTrue(project === self?.project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        do { try self.model.save(project:self.project) } catch { }
        
        self.waitExpectations()
    }
    
    func testNoThrows() {
        XCTAssertNoThrow(try self.model.save(project:self.project), "Failed to save project")
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
