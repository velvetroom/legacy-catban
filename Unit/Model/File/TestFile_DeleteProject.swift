import XCTest
@testable import catban

class TestFile_DeleteProject:XCTestCase {
    private var model:File!
    private var data:Data!
    private var url:URL!
    private struct Constants {
        static let rootFolder:String = "tests"
        static let identifier:String = "loremipsum"
        static let projectData:Any = ["project":"lorem ipsum"]
    }
    
    override func setUp() {
        super.setUp()
        File.rootFolder = Constants.rootFolder
        self.model = File()
        self.url = self.model.projects.appendingPathComponent(Constants.identifier).appendingPathExtension(
            File.Constants.fileExtension)
        do {
            try self.data = JSONSerialization.data(withJSONObject:Constants.projectData,
                                                      options:JSONSerialization.WritingOptions())
        } catch { }
    }
    
    override func tearDown() {
        super.tearDown()
        do { try FileManager.default.removeItem(at:self.model.directory) } catch { }
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.data, "Failed to load data")
        XCTAssertNotNil(self.url, "Failed to load url")
    }
    
    func testProjectShouldNotExistBefore() {
        XCTAssertFalse(self.fileExists(), "Project already exists")
    }
    
    func testNoThrow() {
        XCTAssertNoThrow(try self.model.deleteProjectWith(identifier:Constants.identifier),
                         "Failed to delete project")
    }
    
    func testFileNotExistsAfter() {
        self.saveFile()
        XCTAssertTrue(self.fileExists(), "Failed to create project")
        
        do { try self.model.deleteProjectWith(identifier:Constants.identifier) } catch { }
        
        XCTAssertFalse(self.fileExists(), "Failed to delete project")
    }
    
    private func saveFile() {
        do { try self.model.save(project:self.data, with:Constants.identifier) } catch { }
    }
    
    private func fileExists() -> Bool {
        return FileManager.default.fileExists(atPath:self.url.path)
    }
}
