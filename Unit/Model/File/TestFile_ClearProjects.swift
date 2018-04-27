import XCTest
@testable import catban

class TestFile_ClearProjects:XCTestCase {
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
        do { try FileManager.default.removeItem(at:self.model.directory) } catch { }
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
        XCTAssertNotNil(self.url, "Failed to load url")
    }
    
    func testClearFolderDirectory() {
        XCTAssertFalse(self.fileExists(), "Project should not exist before")
        self.creatProject()
        XCTAssertTrue(self.fileExists(), "Project should be created now")
        
        XCTAssertNoThrow(try self.model.clearProjects())
        
        XCTAssertFalse(self.fileExists(), "Failed to delete folder")
    }
    
    private func fileExists() -> Bool {
        return FileManager.default.fileExists(atPath:self.url.path)
    }
    
    private func creatProject() {
        do { try self.model.save(project:self.project, with:Constants.identifier) } catch { }
    }
}
