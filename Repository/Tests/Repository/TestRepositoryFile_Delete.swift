import XCTest
import Shared
@testable import Repository

class TestRepositoryFile_Delete:XCTestCase {
    private var model:RepositoryFile!
    private struct Constants {
        static let fileName:String = "helloWorld.txt"
        static let projectName:String = "fdsfsdfs"
    }
    
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
    
    func testDelete() {
        let data:Data = Data()
        let fileUrl:URL = self.model.url.directoryUrl.appendingPathComponent(Constants.fileName)
        let projectUrl:URL = self.model.url.projectsUrl.appendingPathComponent(Constants.projectName)
        do { try data.write(to:fileUrl) } catch { }
        do { try data.write(to:projectUrl) } catch { }
        XCTAssertTrue(FileManager.default.fileExists(atPath:fileUrl.path), "Failed to write")
        XCTAssertTrue(FileManager.default.fileExists(atPath:projectUrl.path), "Failed to write")
        
        self.model.delete()
        XCTAssertFalse(FileManager.default.fileExists(atPath:fileUrl.path), "Failed to delete")
        XCTAssertFalse(FileManager.default.fileExists(atPath:projectUrl.path), "Failed to delete")
    }
    
    func testDeleteProject() {
        let data:Data = Data()
        let projectUrl:URL = self.model.url.projectsUrl.appendingPathComponent(
            Constants.projectName).appendingPathExtension(RepositoryConstants.Url.fileExtension)
        do { try data.write(to:projectUrl) } catch { }
        XCTAssertTrue(FileManager.default.fileExists(atPath:projectUrl.path), "Failed to write")
        
        XCTAssertNoThrow(try self.model.deleteProjectWith(identifier:Constants.projectName), "Failed to delete")
        XCTAssertFalse(FileManager.default.fileExists(atPath:projectUrl.path), "Failed to delete")
    }
}
