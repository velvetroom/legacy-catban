import XCTest
import Repository

class TestRepositoryConstants:XCTestCase {
    func testDirectoryRoot() {
        XCTAssertFalse(RepositoryConstants.directoryRoot.isEmpty, "Invalid directory name")
    }
}
