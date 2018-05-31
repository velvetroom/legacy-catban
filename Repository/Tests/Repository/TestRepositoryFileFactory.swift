import XCTest
import Shared
@testable import Repository

class TestRepositoryFileFactory:XCTestCase {
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
    }
    
    func testRootDirectoryHasRootName() {
        let containedString:String = "/" + Configuration.directoryRoot
        let url:String = RepositoryFileFactory.makeDirectoryURL().absoluteString
        XCTAssertTrue(url.contains(containedString), "Invalid directory")
    }
}
