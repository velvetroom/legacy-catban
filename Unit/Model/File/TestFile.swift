import XCTest
@testable import catban

class TestFile:XCTestCase {
    private var model:File!
    
    override func setUp() {
        super.setUp()
        self.model = File()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.directory, "Failed to load directory")
        XCTAssertNotNil(self.model.projects, "Failed to load projects")
        XCTAssertNotNil(self.model.user, "Failed to load user")
    }
    
    func testCreateDirectory() {
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.directory.path),
                      "Failed to create directory")
    }
    
    func testCreateProjects() {
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.projects.path),
                      "Failed to create projects")
    }
    
    func testFactoryDirectory() {
        XCTAssertNotNil(File.factoryDirectory(), "Failed to factory directory")
    }
    
    func testDirectoryURL() {
        XCTAssertTrue(self.model.directory.absoluteString.contains(File.Constants.rootFolder),
                      "Invalid directory")
    }
    
    func testProjectsURL() {
        XCTAssertTrue(self.model.projects.absoluteString.contains(File.Constants.rootFolder),
                      "Invalid projects folder")
        XCTAssertTrue(self.model.projects.absoluteString.contains(File.Constants.projectsFolder),
                      "Invalid projects folder")
    }
    
    func testUserURL() {
        XCTAssertTrue(self.model.user.absoluteString.contains(File.Constants.rootFolder),
                      "Invalid user url")
        XCTAssertTrue(self.model.user.absoluteString.contains(File.Constants.userFile),
                      "Invalid user url")
        XCTAssertTrue(self.model.user.absoluteString.contains(".\(File.Constants.fileExtension)"),
                      "Invalid user url")
    }
}
