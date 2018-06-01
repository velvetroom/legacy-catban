import XCTest
import Shared
@testable import Repository

class TestRepositoryFileFactory:XCTestCase {
    private var url:RepositoryFileUrl!
    
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
        self.url = RepositoryFileFactory.makeUrl()
    }

    func testDirectory() {
        self.validateUserDirectoryFor(url:self.url.directoryUrl)
        self.validateRootNameFor(url:self.url.directoryUrl)
    }
    
    func testProjects() {
        self.validateUserDirectoryFor(url:self.url.projectsUrl)
        self.validateRootNameFor(url:self.url.projectsUrl)
        self.validateProjectsNameFor(url:self.url.projectsUrl)
    }
    
    func testBoard() {
        self.validateUserDirectoryFor(url:self.url.boardUrl)
        self.validateRootNameFor(url:self.url.boardUrl)
        self.validateProjectsNameFor(url:self.url.projectsUrl)
    }
    
    private func validateUserDirectoryFor(url:URL) {
        let containedString:String = FileManager.default.urls(
            for:FileManager.SearchPathDirectory.documentDirectory,
            in:FileManager.SearchPathDomainMask.userDomainMask).last!.path
        XCTAssertTrue(url.path.contains(containedString), "Invalid directory")
    }
    
    private func validateRootNameFor(url:URL) {
        let containedString:String = "/" + Configuration.directoryRoot
        XCTAssertTrue(url.path.contains(containedString), "Invalid directory")
    }
    
    private func validateProjectsNameFor(url:URL) {
        let containedString:String = "/" + RepositoryConstants.directoryProjects
        XCTAssertTrue(url.path.contains(containedString), "Invalid directory")
    }
    
    private func validateBoardNameFor(url:URL) {
        let containedStringA:String = "/" + RepositoryConstants.boardName
        let containedStringB:String = "." + RepositoryConstants.fileExtension
        XCTAssertTrue(url.path.contains(containedStringA), "Invalid url")
        XCTAssertTrue(url.path.contains(containedStringB), "Invalid url")
    }
}
