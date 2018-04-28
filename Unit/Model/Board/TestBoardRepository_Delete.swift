import XCTest
@testable import catban

class TestBoardRepository_Delete:XCTestCase {
    private var model:BoardRepository!
    private var project:Project!
    private var repository:MockRepositoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = BoardRepository()
        self.repository = MockRepositoryProtocol()
        self.project = Project()
        self.model.repository = self.repository
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.repository, "Failed to load repository")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testDeleteProjectOnLocalDeleteProject() {
        self.startExpectation()
        self.repository.onDeleteProject = { [weak self] (project:ProjectProtocol) in
            let project:Project = project as! Project
            XCTAssertFalse(Thread.isMainThread, "Should not be on main thread")
            XCTAssertTrue(project === self?.project, "Invalid board received")
            self?.expect?.fulfill()
        }
        
        self.model.delete(project:self.project)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
