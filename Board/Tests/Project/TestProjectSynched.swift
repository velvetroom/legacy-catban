import XCTest
@testable import Board

class TestProjectSynched:XCTestCase {
    private var project:ProjectSynched!
    
    override func setUp() {
        super.setUp()
        self.project = ProjectSynched()
    }
    
    func testCopyCopiesSynchedProperties() {
        let project:ProjectSynched = ProjectSynched()
        project.remoteIdentifier = "hello world"
        project.uploaded = 42
        
        self.project.copy(project:project)
        XCTAssertEqual(self.project.remoteIdentifier, project.remoteIdentifier, "Not copied")
        XCTAssertEqual(self.project.uploaded, project.uploaded, "Not copied")
    }
    
    func testCopyingFromNotSynched() {
        let project:Project = Project()
        project.identifier = "lorem ipsum"
        self.project.copy(project:project)
        XCTAssertEqual(self.project.identifier, project.identifier, "Failed to copy")
    }
}
