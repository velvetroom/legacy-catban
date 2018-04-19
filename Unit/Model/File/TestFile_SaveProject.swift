import XCTest
@testable import catban

class TestFile_SaveProject:XCTestCase {
    private var model:File!
    private var project:Data!
    private var url:URL!
    private struct Constants {
        static let rootFolder:String = "tests"
        static let identifier:String = "loremipsum"
    }
    
    override func setUp() {
        super.setUp()
        File.rootFolder = Constants.rootFolder
        self.model = File()
        self.project = Data()
        self.url = self.model.projects.appendingPathComponent(Constants.identifier).appendingPathExtension(
            File.Constants.fileExtension)
    }
    
    override func tearDown() {
        super.tearDown()
        do { try FileManager.default.removeItem(at:self.model.directory) } catch { }
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
    
    private func fileExists() -> Bool {
        return FileManager.default.fileExists(atPath:self.url.path)
    }
}
