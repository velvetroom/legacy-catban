import XCTest
import Repository

class TestRepositoryConstants:XCTestCase {
    func testDirectoryRoot() {
        XCTAssertFalse(RepositoryConstants.Url.directoryRoot.isEmpty, "Invalid directory name")
    }
}
