import XCTest
@testable import catban

class TestBoard_Save:XCTestCase {
    private var model:Board!
    private var repository:MockBoardRepositoryProtocol!
    private var project:Project!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.repository = MockBoardRepositoryProtocol()
        self.project = Project()
        self.model.project = project
        self.model.repository = self.repository
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.repository, "Failed to load repository")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testSaveProject() {
        self.startExpectation()
        self.repository.onSaveProject = { [weak self] (project:ProjectProtocol) in
            let project:Project = project as! Project
            XCTAssertTrue(self?.project === project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.model.saveProject()
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
