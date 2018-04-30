import XCTest
@testable import catban

class TestFile_LoadProjects:XCTestCase {
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
    }
    
    func testLoadSuccess() {
        self.createProject()
        XCTAssertNoThrow(try self.model.loadProjects(), "Failed to load projects")
    }
    
    func testLoadTotalProjects() {
        self.createProject()
        self.createProject()
        self.createProject()
        var projects:[Data] = []
        XCTAssertNoThrow(projects = try self.model.loadProjects(), "Failed to load projects")
        XCTAssertEqual(projects.count, 3, "Invalid amount of projects loaded")
    }
    
    func testLoadError() {
        XCTAssertThrowsError(try self.model.loadProjects(), "Failed to throw when projects not found")
    }
    
    private func createProject() {
        let projectName:String = UUID().uuidString
        let fileUrl:URL = self.model.projects.appendingPathComponent(projectName)
        let fileWithExtension:URL = fileUrl.appendingPathExtension(File.Constants.fileExtension)
        do {
            try Data().write(to:fileWithExtension)
        } catch { }
    }
}
