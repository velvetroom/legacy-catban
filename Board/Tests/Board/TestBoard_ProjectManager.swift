import XCTest
@testable import Board

class TestBoard_ProjectManager:XCTestCase {
    private var model:Board!
    private var project:Project!
    private struct Constants {
        static let identifier:String = "abc"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Board()
        self.project = Project()
        self.model.identifier = Constants.identifier
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testCountProjects() {
        XCTAssertEqual(self.model.projects.count, self.model.countProjects, "Invalid count projects")
    }
    
    func testCountProjectsAfterAdding() {
        self.model.projects.append(Project())
        XCTAssertEqual(self.model.projects.count, self.model.countProjects, "Invalid count projects")
    }
    
    func testManageProjectAssignsProject() {
        let project:ProjectManagedProtocol = self.model.manage(project:self.project)
        let board:Board? = project.manager as? Board
        XCTAssertNotNil(board, "Manager is not a board")
        XCTAssertEqual(board, self.model, "Failed to assign manager")
    }
}
