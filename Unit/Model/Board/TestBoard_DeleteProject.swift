import XCTest
@testable import catban

class TestBoard_DeleteProject:XCTestCase {
    private var model:Board!
    private var project:Project!
    private var repository:MockBoardRepositoryProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let idOne:String = "lorem ipsum"
        static let idTwo:String = "hello world"
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.project = Project()
        self.repository = MockBoardRepositoryProtocol()
        self.project.identifier = Constants.idOne
        self.model.project = self.project
        self.model.projects = [self.project]
        self.model.repository = self.repository
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.repository, "Failed to load repository")
    }
    
    func testReduceProjects() {
        self.model.projects.append(Project())
        
        self.model.deleteProject()
        
        XCTAssertEqual(self.model.projects.count, 1, "Failed to reduce projects")
    }
    
    func testRemoveNotCurrentProject() {
        let newProject:Project = Project()
        self.model.projects.append(newProject)
        
        self.model.deleteProject()
        
        let remainProject:Project = self.model.projects.first as! Project
        XCTAssertTrue(remainProject === newProject, "Deleted wrong project")
    }
    
    func testUpdateCurrentProject() {
        let newProject:Project = Project()
        self.model.projects.append(newProject)
        
        self.model.deleteProject()
        
        let currentProject:Project = self.model.project as! Project
        XCTAssertTrue(currentProject === newProject, "Failed to update current project")
    }
    
    func testReleaseDeletedProject() {
        self.model.project = Project()
        weak var weakReference:Project? = self.model.project as? Project
        weakReference?.identifier = Constants.idTwo
        self.model.projects.append(weakReference!)
        
        self.model.deleteProject()
        
        XCTAssertNil(weakReference, "Failed to release project")
    }
    
    func testDeleteCallsRepository() {
        self.startExpectation()
        let newProject:Project = Project()
        self.model.projects.append(newProject)
        self.repository.onDeleteProject = { [weak self] (project:ProjectProtocol) in
            let project:Project = project as! Project
            XCTAssertTrue(self?.project === project, "Invalid project received")
            self?.expect?.fulfill()
        }
        
        self.model.deleteProject()
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
