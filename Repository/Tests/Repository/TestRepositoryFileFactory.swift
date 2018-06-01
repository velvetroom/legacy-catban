import XCTest
import Shared
@testable import Repository

class TestRepositoryFileFactory:XCTestCase {
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
    }
    
    func testRootDirectoryHasRootName() {
        let url:String = RepositoryFileFactory.makeDirectoryUrl().path
        self.validateRootNameFor(url:url)
    }
    
    func testProjectsHasFullPath() {
        let base:URL = RepositoryFileFactory.makeDirectoryUrl()
        let url:String = RepositoryFileFactory.makeProjectsWith(url:base).path
        self.validateRootNameFor(url:url)
        self.validateProjectsNameFor(url:url)
    }
    
    private func validateRootNameFor(url:String) {
        let containedString:String = "/" + Configuration.directoryRoot
        XCTAssertTrue(url.contains(containedString), "Invalid directory")
    }
    
    private func validateProjectsNameFor(url:String) {
        let containedString:String = "/" + RepositoryConstants.directoryProjects
        XCTAssertTrue(url.contains(containedString), "Invalid directory")
    }
}
