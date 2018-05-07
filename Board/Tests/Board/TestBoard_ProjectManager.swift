import XCTest
@testable import Board

class TestBoard_ProjectManager:XCTestCase {
    private var model:Board!
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.model.identifier = "lorem ipsum"
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testCountProjects() {
        XCTAssertEqual(self.model.countProjects, 0, "There should be no projects")
    }
    
    func testCountProjectsAfterAdding() {
        self.model.projects.append(Project())
        XCTAssertEqual(self.model.countProjects, 1, "There should be 1 project")
    }
    
    func testAddProject() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.model.add(project:project)
        XCTAssertEqual(self.model.countProjects, 1, "There should be 1 project")
        XCTAssertEqual(project.identifier, self.model.projects.first?.identifier, "Invalid project added")
    }
    
    func testAddProjectNoIdentifierShouldFail() {
        let project:ProjectProtocol = Project()
        self.model.add(project:project)
        XCTAssertEqual(self.model.countProjects, 0, "There should be no projects")
    }
    
    func testRemoveProject() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.model.add(project:project)
        XCTAssertEqual(self.model.countProjects, 1, "There should be 1 project")
        self.model.remove(project:project)
        XCTAssertEqual(self.model.countProjects, 0, "Failed to remove project")
    }
}
