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
}
