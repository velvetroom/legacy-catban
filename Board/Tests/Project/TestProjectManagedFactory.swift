import XCTest
@testable import Board

class TestProjectManagedFactory:XCTestCase {
    func testBlankManagedNoIdentifier() {
        let project:ProjectManagedProtocol = ProjectManagedFactory.blankProjectManaged()
        XCTAssertTrue(project.identifier.isEmpty, "Project should not have identifier")
    }
    
    func testBlankManagedNoCreated() {
        let project:ProjectManagedProtocol = ProjectManagedFactory.blankProjectManaged()
        XCTAssertEqual(project.created, 0, "Project should not have created")
    }
    
    func testBlankManagedNoColumns() {
        let project:ProjectManagedProtocol = ProjectManagedFactory.blankProjectManaged()
        XCTAssertEqual(project.countColumns, 0, "Project should not have columns")
    }
    
    func testForNewProjectManagedAssignsManager() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let manager:BoardProtocol = BoardFactory.newBoard()
        let managed:ProjectManagedProtocol = ProjectManagedFactory.assign(manager:manager, to:project)
        let assigned:BoardProtocol = managed.manager as! BoardProtocol
        XCTAssertEqual(manager.identifier, assigned.identifier, "Invalid manager assigned")
    }
    
    func testForNewProjectCopiesContent() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let manager:BoardProtocol = BoardFactory.newBoard()
        let managed:ProjectManagedProtocol = ProjectManagedFactory.assign(manager:manager, to:project)
        XCTAssertEqual(managed.identifier, project.identifier, "Content not copied")
    }
}
