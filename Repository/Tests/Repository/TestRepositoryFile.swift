import XCTest
import Shared
@testable import Repository

class TestRepositoryFile:XCTestCase {
    private var model:RepositoryFile!
    
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
        self.model = RepositoryFile()
    }
    
    func testBuildDirectoryStructure() {
        XCTAssertNoThrow(try self.model.buildStructure(), "Exception building folders")
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.directoryUrl.path),
                      "Failed to create")
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.projectsUrl.path),
                      "Failed to create")
    }
}
