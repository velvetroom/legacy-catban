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
        project.uploadTimestamp = 42
        project.downloadTimestamp = 34
        project.changeTimestamp = 98
        
        self.project.copy(project:project)
        XCTAssertEqual(self.project.remoteIdentifier, project.remoteIdentifier, "Not copied")
        XCTAssertEqual(self.project.uploadTimestamp, project.uploadTimestamp, "Not copied")
        XCTAssertEqual(self.project.downloadTimestamp, project.downloadTimestamp, "Not copied")
        XCTAssertEqual(self.project.changeTimestamp, project.changeTimestamp, "Not copied")
    }
    
    func testCopyingFromNotSynched() {
        let project:Project = Project()
        project.identifier = "lorem ipsum"
        self.project.copy(project:project)
        XCTAssertEqual(self.project.identifier, project.identifier, "Failed to copy")
    }
}
