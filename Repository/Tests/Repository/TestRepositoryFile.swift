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
    
    func testBoardDataFound() {
        let data:Data = Data()
        XCTAssertNoThrow(try data.write(to:self.model.url.boardUrl), "Failed to write")
        
        var board:Data!
        XCTAssertNoThrow(board = try self.model.boardData(), "Error loading data")
        XCTAssertNotNil(board, "Failed to load data")
    }
    
    func testBoardDataNotFound() {
        XCTAssertThrowsError(try self.model.boardData(), "Data should not be found")
    }
}


