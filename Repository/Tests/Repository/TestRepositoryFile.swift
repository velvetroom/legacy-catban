import XCTest
import Shared
@testable import Repository

class TestRepositoryFile:XCTestCase {
    private var model:RepositoryFile!
    
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
        self.model = RepositoryFile()
        XCTAssertNoThrow(try self.model.buildStructure(), "Exception building folders")
    }
    
    override func tearDown() {
        super.tearDown()
        self.model.delete()
    }
    
    func testBuildDirectoryStructure() {
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.url.directoryUrl.path),
                      "Failed to create")
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.url.projectsUrl.path),
                      "Failed to create")
    }
    
    func testBoardData() {
        let data:Data = Data()
        XCTAssertNoThrow(try data.write(to:self.model.url.boardUrl), "Failed to write")
        
        var board:Data!
        XCTAssertNoThrow(board = try self.model.boardData(), "Error loading data")
        XCTAssertNotNil(board, "Failed to load data")
    }
    
    func testBoardDataNotFound() {
        XCTAssertThrowsError(try self.model.boardData(), "Data should not be found")
    }
    
    func testLoadProjects() {
        let fileName:String = "test.catban"
        let data:Data = Data()
        let url:URL = self.model.url.projectsUrl.appendingPathComponent(fileName)
        XCTAssertNoThrow(try data.write(to:url), "Failed to write")
        
        let projects:[Data] = self.model.projectsData()
        XCTAssertEqual(projects.count, 1, "Failed to load projects")
    }
    
    func testLoadProjectsNotFound() {
        let projects:[Data] = self.model.projectsData()
        XCTAssertTrue(projects.isEmpty, "Should be no projects")
    }
    
    func testSaveBoard() {
        XCTAssertNoThrow(try self.model.writeBoard(data:Data()), "Error saving board")
        XCTAssertTrue(FileManager.default.fileExists(atPath:self.model.url.boardUrl.path), "Failed to save")
    }
    
    func testSaveProject() {
        let identifier:String = "test"
        XCTAssertNoThrow(try self.model.writeProject(data:Data(), with:identifier), "Failed to write")
        let url:URL = self.model.url.projectsUrl.appendingPathComponent(identifier).appendingPathExtension(
            RepositoryConstants.Url.fileExtension)
        XCTAssertTrue(FileManager.default.fileExists(atPath:url.path), "Failed to save")
    }
}
