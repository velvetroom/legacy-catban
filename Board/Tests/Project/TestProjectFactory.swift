import XCTest
@testable import Board

class TestProjectFactory:XCTestCase {
    func testNewProjectIdentifier() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        XCTAssertFalse(project.identifier.isEmpty, "Failed to assign identifier to project")
    }
    
    func testNewProjectCreated() {
        let timestamp:Int = Date.timestamp
        let project:ProjectProtocol = ProjectFactory.newProject()
        XCTAssertGreaterThanOrEqual(project.created, timestamp, "Failed to assign created")
    }
    
    func testBlankProjectNoIdentifier() {
        let project:ProjectProtocol = ProjectFactory.blankProject()
        XCTAssertTrue(project.identifier.isEmpty, "Should have no identifier")
    }
    
    func testBlankProjectNoCreated() {
        let project:ProjectProtocol = ProjectFactory.blankProject()
        XCTAssertEqual(project.created, 0, "Should have no created")
    }
    
    func testBlankProjectNoColumns() {
        let project:ProjectProtocol = ProjectFactory.blankProject()
        XCTAssertEqual(project.countColumns, 0, "Should have no columns")
    }
    
    func testUnmanagedProject() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let board:BoardProtocol = BoardFactory.newBoard()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        let unmanaged:ProjectManagedProtocol? = ProjectFactory.removeManagementFrom(
            project:managed) as? ProjectManagedProtocol
        XCTAssertNil(unmanaged, "Unmanaged should not be managed protocol")
    }
    
    func testUnmanagedProjectIdentifier() {
        let project:ProjectProtocol = ProjectFactory.newProject()
        let board:BoardProtocol = BoardFactory.newBoard()
        let managed:ProjectManagedProtocol = board.manage(project:project)
        let unmanaged:ProjectProtocol = ProjectFactory.removeManagementFrom(project:managed)
        XCTAssertEqual(unmanaged.identifier, project.identifier, "Failed to copy content")
    }
}
