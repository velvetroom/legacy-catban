import XCTest
@testable import Board

class TestBoard_ProjectManager:XCTestCase {
    private var model:Board!
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.model.identifier = "lorem ipsum"
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
    
    func testRemoveProjectNotContained() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        XCTAssertEqual(self.model.countProjects, 0, "Should have no projects")
        self.model.remove(project:project)
        XCTAssertEqual(self.model.countProjects, 0, "Should still have no projects")
    }
    
    func testProjectWithIdentifier() {
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        let projectB:ProjectProtocol = ProjectFactory.newProject()
        self.model.add(project:projectA)
        self.model.add(project:projectB)
        let retrieved:ProjectProtocol = self.model.projectWith(identifier:projectB.identifier)
        XCTAssertEqual(retrieved.identifier, projectB.identifier, "Invalid project retrieved")
    }
    
    func testIterate() {
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        let projectB:ProjectProtocol = ProjectFactory.newProject()
        self.model.add(project:projectA)
        self.model.add(project:projectB)
        var foundA:Bool = false
        var foundB:Bool = false
        
        self.model.iterate { (project:ProjectProtocol) in
            if project.identifier == projectA.identifier {
                foundA = true
            } else if project.identifier == projectB.identifier {
                foundB = true
            }
        }
        
        XCTAssertTrue(foundA, "Failed to iterate project A")
        XCTAssertTrue(foundB, "Failed to iterate project B")
    }
    
    func testFirstProject() {
        let projectA:ProjectProtocol = ProjectFactory.newProject()
        self.model.add(project:projectA)
        self.model.add(project:ProjectFactory.newProject())
        XCTAssertEqual(self.model.firstProject?.identifier, projectA.identifier, "Failed")
    }
}
