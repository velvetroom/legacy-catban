import XCTest
@testable import catban

class TestFile:XCTestCase {
    private var model:File!
    private struct Constants {
        static let rootFolder:String = "tests"
    }
    
    override func setUp() {
        super.setUp()
        File.rootFolder = Constants.rootFolder
        self.model = File()
    }
    
    override func tearDown() {
        super.tearDown()
        self.model.deleteAll()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.directory, "Failed to load directory")
        XCTAssertNotNil(self.model.projects, "Failed to load projects")
        XCTAssertNotNil(self.model.user, "Failed to load user")
    }
    
    func createDirectoriesOnLoad() {
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.directory.path),
                      "Failed to create directory")
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.projects.path),
                      "Failed to create projects")
    }
    
    func testCreateDirectory() {
        XCTAssertNoThrow(try self.model.createDirectories())
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.directory.path),
                      "Failed to create directory")
    }
    
    func testCreateProjects() {
        XCTAssertNoThrow(try self.model.createDirectories())
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.projects.path),
                      "Failed to create projects")
    }
    
    func testFactoryDirectory() {
        XCTAssertNotNil(File.factoryDirectory(), "Failed to factory directory")
    }
    
    func testDirectoryURL() {
        XCTAssertTrue(self.model.directory.absoluteString.contains(File.rootFolder),
                      "Invalid directory")
    }
    
    func testProjectsURL() {
        XCTAssertTrue(self.model.projects.absoluteString.contains(File.rootFolder),
                      "Invalid projects folder")
        XCTAssertTrue(self.model.projects.absoluteString.contains(File.Constants.projectsFolder),
                      "Invalid projects folder")
    }
    
    func testUserURL() {
        XCTAssertFalse(self.model.user.absoluteString.contains(File.Constants.projectsFolder),
                      "Invalid user url")
        XCTAssertTrue(self.model.user.absoluteString.contains(File.Constants.rootFolder),
                      "Invalid user url")
        XCTAssertTrue(self.model.user.absoluteString.contains(File.Constants.userFile),
                      "Invalid user url")
        XCTAssertTrue(self.model.user.absoluteString.contains(".\(File.Constants.fileExtension)"),
                      "Invalid user url")
    }
}
