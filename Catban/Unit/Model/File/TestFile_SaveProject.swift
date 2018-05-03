import XCTest
@testable import catban

class TestFile_SaveProject:XCTestCase {
    private var model:File!
    private var project:Data!
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
            try self.project = JSONSerialization.data(withJSONObject:Constants.projectData,
                                                   options:JSONSerialization.WritingOptions())
        } catch { }
    }
    
    override func tearDown() {
        super.tearDown()
        self.model.deleteAll()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.url, "Failed to load url")
    }
    
    func testNoThrow() {
        XCTAssertNoThrow(try self.model.save(project:self.project, with:Constants.identifier), "Failed to save project")
    }
    
    func testCreateFile() {
        XCTAssertFalse(self.fileExists(), "Project should not exist before")
        
        do { try self.model.save(project:self.project, with:Constants.identifier) } catch { }
        
        XCTAssertTrue(self.fileExists(), "Project should exist after")
    }
    
    func testFileSize() {
        do { try self.model.save(project:self.project, with:Constants.identifier) } catch { }
        var data:Data! = nil
        do { try data = Data.init(contentsOf:self.url) } catch { }
        XCTAssertEqual(data.count, self.project.count, "Invalid number of bytes written")
    }
    
    private func fileExists() -> Bool {
        return FileManager.default.fileExists(atPath:self.url.path)
    }
}
