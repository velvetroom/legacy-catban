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
}
