import XCTest
@testable import Board

class TestBoard_Manage:XCTestCase {
    private var model:Board!
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.model.identifier = "lorem ipsum"
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testManageProjectAssignsManagerToProject() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        
        let managed:ProjectManagedProtocol = self.model.manage(project:project)
        let board:Board? = managed.manager as? Board
        XCTAssertNotNil(board, "Manager is not a board")
        XCTAssertEqual(board, self.model, "Failed to assign manager")
    }
    
    func testManageProjectRemovesProject() {
        XCTAssertEqual(self.model.countProjects, 0, "Initial project count should be 0")
        let project:ProjectProtocol = ProjectFactory.newProject()
        self.model.add(project:project)
        XCTAssertEqual(self.model.countProjects, 1, "Failed adding project")
        
        let _:ProjectManagedProtocol = self.model.manage(project:project)
        XCTAssertEqual(self.model.countProjects, 0, "Failed to remove project when it becomes managed")
    }
    
    func testManageCopyIdentifier() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = self.model.manage(project:project)
        XCTAssertEqual(project.identifier, managed.identifier, "Failed to copy identifier to managed")
    }
    
    func testManageCopyColumns() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        project.add(column:ColumnFactory.newColumn())
        let managed:ProjectManagedProtocol = self.model.manage(project:project)
        XCTAssertEqual(project.countColumns, managed.countColumns, "Failed to copy columns to managed")
    }
    
    func testUnmanageAddsToProjects() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = self.model.manage(project:project)
        self.model.unmanage(project:managed)
        XCTAssertEqual(self.model.countProjects, 1, "Failed to add project to list")
    }
    
    func testUnmanageCopiesContent() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = self.model.manage(project:project)
        self.model.unmanage(project:managed)
        XCTAssertEqual(self.model.projects[0].identifier, project.identifier, "Add project is not the managed")
    }
    
    func testUnmanageIsNotManaged() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let managed:ProjectManagedProtocol = self.model.manage(project:project)
        self.model.unmanage(project:managed)
        let added:ProjectManagedProtocol? = self.model.projects[0] as? ProjectManagedProtocol
        XCTAssertNil(added, "Added project should not be managed")
    }
}
